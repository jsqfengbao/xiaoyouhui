package com.king.controller;

import com.king.annotation.LoginUser;
import com.king.annotation.RegisterUser;
import com.king.entity.*;
import com.king.enums.UserStatusEnum;
import com.king.service.*;
import com.king.util.ApiBaseAction;
import com.king.util.ApiPageUtils;
import com.king.util.DateUtil;
import com.king.util.SmsUtils;
import com.king.utils.ResourceUtil;
import com.king.utils.StringUtils;
import com.king.vo.ApplyingUserVO;
import com.king.vo.GetInviteUserListVo;
import io.swagger.annotations.Api;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/7 14:09
 * @Modified By
 **/
@Api(value = "用户管理", tags = {"API用户注册接口"})
@RestController
@RequestMapping("/api/user")
public class UserController extends ApiBaseAction {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private MyCheckByUserService myCheckByUserService;

    @Autowired
    private MyUserService myUserService;
    @Autowired
    private MySmsCodeService mySmsCodeService;
    @Autowired
    private MyUserApplyService myUserApplyService;
    @Autowired
    private MySchoolUserService mySchoolUserService;
    @Autowired
    private MyApprovalService myApprovalService;
    @Autowired
    private MySchoolService mySchoolService;
    public String devCode = "0";

    private void getSmsCode(String mobile, int userId) {
        String smsResult = "123456";
        //
            //获取短信验证码
            smsResult = SmsUtils.sendSms(mobile);


        if (!"0".equals(smsResult)) {
            MySmsCodeEntity smsCodeEntity = new MySmsCodeEntity();
            smsCodeEntity.setUserId(userId);
            smsCodeEntity.setPhoneNum(mobile);
            smsCodeEntity.setSmsCode(smsResult);
            smsCodeEntity.setCreateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
            smsCodeEntity.setUsed("0");
            mySmsCodeService.save(smsCodeEntity);
        }
    }

    /**
     * 发送短信验证码
     *
     * @param myUserEntity
     * @return
     * @throws Exception
     */
    @RequestMapping("sendSms")
    public Object getSmsCode(@LoginUser MyUserEntity myUserEntity, String mobile) throws Exception {

        int userId = myUserEntity.getId();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", userId);
        MySmsCodeEntity mySmsCodeEntity = mySmsCodeService.queryByUserId(userId);
        if (null != mySmsCodeEntity && null != mySmsCodeEntity.getCreateTime() && "0".equals(mySmsCodeEntity.getUsed())) {
            DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            long thatTime = dateformat.parse(mySmsCodeEntity.getCreateTime()).getTime();
            long currentTime = System.currentTimeMillis();
//            验证码有效期
            int internalMinutes = 60;
            if ((currentTime - thatTime) / (60 * 1000) < internalMinutes) {
                return toResponseObject(1, "验证码60分钟有效，您还可以继续使用", "");
            } else {
                getSmsCode(mobile, userId);
                return toResponseObject(0, "验证码发送成功！", "");
            }
        } else {
            getSmsCode(mobile, userId);
            return toResponseObject(0, "验证码发送成功！", "");
        }
    }


    /**
     * 查询用户信息
     *
     * @param myUserEntity
     * @return
     */
    @RequestMapping("queryUser")
    public Object getUser(@LoginUser MyUserEntity myUserEntity, @RequestParam(required = false) Integer queryUserId) throws Exception {
        if (!StringUtils.isNullOrEmpty(queryUserId)) {
            MyUserEntity queryOtherUserEntity = myUserService.queryObject(queryUserId);
            return toResponseSuccess((queryOtherUserEntity));
        }
        return toResponseSuccess((myUserEntity));
    }

    @GetMapping("/simple")
    public Object getSimpleUser(@LoginUser MyUserEntity myUserEntity) {
        if (myUserEntity.getAdminId() != null) {
            return toResponseSuccess((myUserEntity));
        }
        boolean isChecker = myCheckByUserService.checkCanBeChecker(myUserEntity.getId(), myUserEntity.getSchoolParentId());
        if (isChecker) {
            myUserEntity.setChecker(1);
        }
        return toResponseSuccess((myUserEntity));
    }


    /**
     * 提交用户三项基本信息：基本信息、学校信息、工作信息
     *
     * @param myUserEntity0
     * @return
     */
    @PostMapping("submitUserDetailInfo")
    public Object submitUserDetailInfo(@LoginUser MyUserEntity myUserEntity0, ServletRequest request, String smsCode, String mobile) {

        String name = request.getParameter("name");
        int userId = myUserEntity0.getId();
        MyUserEntity myUserEntity = assemblyMyUserEntity(request);
        myUserEntity.setId(userId);
        if (StringUtils.isNullOrEmpty(smsCode)) {
            myUserService.update(myUserEntity);
            return toResponseObject(0, "提交成功!", "");
        }
        MySmsCodeEntity smsCodeEntity = mySmsCodeService.queryByParam(userId, mobile);
        if (null == smsCodeEntity) {
            return toResponseObject(1, "验证码已失效，请重新获取！", "");
        }
        if (smsCode.equals(smsCodeEntity.getSmsCode())) {
            //校验短信
            smsCodeEntity.setUsed("1");
            mySmsCodeService.update(smsCodeEntity);
            myUserEntity.setTelephone(mobile);
            myUserEntity.setUpdateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
            myUserService.update(myUserEntity);

            return toResponseObject(0, "提交成功!", "");
        } else {
            return toResponseObject(1, "验证码错误！", "");
        }
    }

    /**
     * 审批中的校友列表
     */
    @RequestMapping("getApplyingUser")
    public Object getApplyingUser(@RegisterUser MyUserEntity myUserEntity, @RequestParam Integer type) {
        if (type == 1) {
            //判断是否是管理员
            if (StringUtils.isNullOrEmpty(myUserEntity.getAdminId())) {
                return toResponseFail("没有权限！");
            }
            List<ApplyingUserVO> applyingUserList = mySchoolUserService.getApplyingUserList(myUserEntity.getSchoolParentId(), myUserEntity.getAdminId());
            return toResponseSuccess(applyingUserList);
        }
        if (type == 0) {
            List<ApplyingUserVO> needMeCheckUserList = mySchoolUserService.getNeedMeCheckUserList(myUserEntity.getSchoolParentId(), myUserEntity.getId());
            return toResponseSuccess(needMeCheckUserList);
        }
        return toResponseFail("请求拒绝");

    }


    /**
     * @param schoolUserId 审批ID
     * @param pass 审批状态
     * @param refuseReason 审批拒绝原因
     * 审批
     */
    @RequestMapping("/approvalUser")
    public Object approval(@RegisterUser MyUserEntity myUserEntity,
                                   @RequestParam Integer schoolUserId ,
                                   @RequestParam Integer pass,String refuseReason,
                                   @RequestParam Integer type ){

        if (type==0){
            if (pass == 1){
                myCheckByUserService.pass(schoolUserId,myUserEntity.getId());
                return  toResponseMsgSuccess("审核成功");
            }
            if (pass == 0){
                if (org.apache.commons.lang.StringUtils.isEmpty(refuseReason)){
                    return toResponseFail("请填写拒绝原因");
                }
                myCheckByUserService.refuse(schoolUserId,myUserEntity.getId(),refuseReason);
                return  toResponseMsgSuccess("审核成功");
            }
        }
        if (type==1){
            if (StringUtils.isNullOrEmpty(myUserEntity.getAdminId())) {
                return toResponseFail("没有权限！");
            }
            if (pass==1){
                mySchoolUserService.pass(schoolUserId);
                return  toResponseMsgSuccess("审核成功");

            }
            if (pass==0){
                if (org.apache.commons.lang.StringUtils.isEmpty(refuseReason)){
                    return toResponseFail("请填写拒绝原因");
                }
                mySchoolUserService.refuse(schoolUserId,refuseReason);
                return  toResponseMsgSuccess("审核成功");

            }
        }
        return toResponseFail("审核失败");


    }

    /**
     * 获取邀请的用户列表
     *
     * @param userEntity
     * @return
     */
    @RequestMapping("getInviteUserList")
    public Object getInviteUserList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                    @RequestParam(value = "size", defaultValue = "10") Integer size,
                                    @RegisterUser MyUserEntity userEntity) {

        List<GetInviteUserListVo> inviteUserListVos = myUserService.getInviteUserListVoList(userEntity.getId());
        ApiPageUtils pageUtil = new ApiPageUtils(inviteUserListVos, inviteUserListVos.size(), size, page);
        return toResponseSuccess(pageUtil);
    }

    private MyUserEntity assemblyMyUserEntity(ServletRequest request) {

        ///基本信息
        MyUserEntity myUserEntity = new MyUserEntity();
        myUserEntity.setName(request.getParameter("name"));
        myUserEntity.setIsShowMobile(request.getParameter("isShowMobile"));
        myUserEntity.setPersonProfile(request.getParameter("personProfile"));
        myUserEntity.setWebchat(request.getParameter("webchat"));
        myUserEntity.setQq(request.getParameter("qq"));
        myUserEntity.setNativeProvince(request.getParameter("nativeProvince"));
        myUserEntity.setNativeCity(request.getParameter("nativeCity"));
        myUserEntity.setNativeCountry(request.getParameter("nativeCountry"));
        myUserEntity.setNativePosition(request.getParameter("nativePosition"));
        //学校信息
        myUserEntity.setSchoolName(request.getParameter("schoolName"));
        myUserEntity.setEducation(request.getParameter("education"));
        myUserEntity.setInShool(request.getParameter("inSchool"));
        myUserEntity.setOutShool(request.getParameter("outSchool"));
        myUserEntity.setDepart(request.getParameter("depart"));
        myUserEntity.setMajor(request.getParameter("major"));
        myUserEntity.setUserClass(request.getParameter("userClass"));
        myUserEntity.setStudentNo(request.getParameter("studentNo"));
        myUserEntity.setMasterTutor(request.getParameter("masterTutor"));
        myUserEntity.setDoctorTutor(request.getParameter("doctorTutor"));
        //工作信息
        myUserEntity.setWorkLocation(request.getParameter("workLocation"));
        myUserEntity.setIndustryDirection(request.getParameter("industryDirection"));
        myUserEntity.setCurrentCompany(request.getParameter("currentCompany"));
        myUserEntity.setJob(request.getParameter("job"));

        myUserEntity.setUpdateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
        return myUserEntity;
    }
}
