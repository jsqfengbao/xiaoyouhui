package com.king.controller;


import com.king.annotation.IgnoreAuth;
import com.king.annotation.LoginUser;
import com.king.annotation.RegisterUser;
import com.king.entity.*;
import com.king.enums.CheckTypeEnum;
import com.king.enums.UserStatusEnum;
import com.king.service.*;
import com.king.util.*;
import com.king.utils.*;
import com.king.vo.*;
import io.swagger.annotations.Api;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/15 15:35
 * @Modified By
 **/
@RestController
@RequestMapping("/api/school")
@Api(value = "学校管理", tags = {"API学校相关接口"})
public class SchoolController extends ApiBaseAction {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private MySchoolService mySchoolService;
    @Autowired
    private MyRegionService myRegionService;
    @Autowired
    private MyUserService myUserService;
    @Autowired
    private MyApprovalService myApprovalService;
    @Autowired
    private MyUserApplyService myUserApplyService;
    @Autowired
    private MyAlumniAdminService myAlumniAdminService;
    @Resource
    private MySchoolUserService mySchoolUserService;

    /**
     * 获取学校列表信息
     *
     * @return
     */
    @IgnoreAuth
    @RequestMapping(value = "getParentSchool", method = RequestMethod.POST)
    public Object getParentSchool(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "size", defaultValue = "10") Integer size) {
        Map<String, Object> param = new HashMap<>();

        param.put("schoolType", "0");
        param.put("page", page);
        param.put("limit", size);
        param.put("sidx", "id");
        param.put("order", "desc");

        //查询列表数据
        Query query = new Query(param);
        List<MySchoolEntity> mySchoolEntityList = mySchoolService.getParentSchool(query);
        query.put("schoolType", "0");
        int total = mySchoolService.queryTotal(query);
        ParentSchoolVO parentSchoolVO = new ParentSchoolVO();
        if (null != mySchoolEntityList) {
            ApiPageUtils pageUtil = new ApiPageUtils(mySchoolEntityList, total, query.getLimit(), query.getPage());
            return toResponseSuccess(pageUtil);
        }
        return toResponseObject(1, "查询为空！", parentSchoolVO);
    }

    /**
     * 获取所有地区校友会列表信息，先放个人所在的分会，其次是按时间正序排
     *
     * @param userEntity
     * @return
     */
    @RequestMapping(value = "getMyAndAllSchoolArea")
    public Object getAllSchoolArea(@RegisterUser MyUserEntity userEntity) {
        MyAndAllSchoolAreaVo myAndAllSchoolAreaVo = new MyAndAllSchoolAreaVo();
        int schoolId = userEntity.getSchoolParentId();
        int schoolAreaId = userEntity.getSchoolId();
        MySchoolEntity meSchool = mySchoolService.queryObject(schoolAreaId);
        SchoolArea schoolArea = new SchoolArea();
        schoolArea.setSchoolId(schoolAreaId);
        schoolArea.setSchoolName(meSchool.getSchoolName());
        myAndAllSchoolAreaVo.setMine(schoolArea);

        List<SchoolAreaVo> schoolAreaVoList = myRegionService.queryRegionWithSchoolList(schoolId);

        myAndAllSchoolAreaVo.setAll(schoolAreaVoList);

        return toResponseSuccess(myAndAllSchoolAreaVo);
    }

    /**
     * 获取学校校友会分会列表信息
     */
    @IgnoreAuth
    @RequestMapping("getSchoolArea")
    public Object getSchoolArea(Integer schoolId) {

        List<SchoolAreaVo> schoolAreaVoList = myRegionService.queryRegionWithSchoolList(schoolId);

        if (schoolAreaVoList.size() > 0) {
            return toResponseSuccess(schoolAreaVoList);
        }
        return toResponseObject(0, "查询为空！", schoolAreaVoList);
    }

    /**
     * 申请加入校友会
     *
     * @param userEntity
     * @return
     */
    @RequestMapping("addSchoolAssociation")
    public Object addSchoolAssociation(@LoginUser MyUserEntity userEntity, Integer schoolId) {
        if (UserStatusEnum.APPLYING.getValue().equals(userEntity.getStatus())) {
            return toResponseFail("审批中，请稍后");
        } else if (UserStatusEnum.NoInput.getValue().equals(userEntity.getStatus()) || StringUtils.isNullOrEmpty(userEntity.getStatus())) {
            Map<String, Object> param = new HashMap<>();
            //校验必填信息
            StringBuilder sb = mySchoolService.checkUserStatus(userEntity.getId());
            if (StringUtils.isNotEmpty(sb.toString())) {
                return toResponseFail("请前往“我的”填写基本信息");
            }
            userEntity.setStatus(UserStatusEnum.APPLYING.getValue());
            userEntity.setSchoolId(schoolId);

            int schoolParentId = mySchoolService.getSchoolParentId(schoolId).getParentId();
            userEntity.setSchoolParentId(schoolParentId);
            //更新用户表
            myUserService.update(userEntity);

            MyUserApplyEntity userApplyEntity = new MyUserApplyEntity();
            userApplyEntity.setUserId(userEntity.getId());
            userApplyEntity.setCreateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
            userApplyEntity.setEnabled("1");
            userApplyEntity.setSchoolId(schoolId);
            userApplyEntity.setSchoolParentId(schoolParentId);
            MyUserApplyEntity res = myUserApplyService.getOne(userEntity.getId(), schoolId, schoolParentId);
            //如果未申请
            if (null == res) {
                //保存用户申请信息；
                myUserApplyService.saveUserApply(userApplyEntity);
            }
            //通知分会管理员
            //生产环境才发送短信
            if (ResourceUtil.getConfigByName("sys.demo").equals("0")) {
                MySchoolEntity schoolEntity = mySchoolService.queryObject(schoolParentId);
                String schoolName = schoolEntity.getSchoolName();
                MySchoolEntity schoolAreaEntity = mySchoolService.queryObject(schoolId);
                String schoolAreaName = schoolAreaEntity.getSchoolName();
                Map<String, Object> alumniAdminMap = new HashMap<>();
                alumniAdminMap.put("schoolId", schoolId);
                alumniAdminMap.put("schoolParentId", schoolParentId);
                List<MyAlumniAdminEntity> myAlumniAdminEntityList = myAlumniAdminService.queryListBySchoolIdAndParentId(alumniAdminMap);
                for (MyAlumniAdminEntity alumniAdminEntity : myAlumniAdminEntityList) {
                    SmsUtils.notifySchoolAdmin(schoolName, schoolAreaName, userEntity.getName(), userEntity.getTelephone(), alumniAdminEntity.getAdminPhone());
                }
            }

///            Thread thread = new Thread(()->{
//                    MySchoolEntity schoolEntity = mySchoolService.queryObject(schoolParentId);
//                    String schoolName = schoolEntity.getSchoolName();
//                    MySchoolEntity schoolAreaEntity = mySchoolService.queryObject(schoolId);
//                    String schoolAreaName = schoolAreaEntity.getSchoolName();
//                    Map<String,Object> alumniAdminMap = new HashMap<>();
//                    alumniAdminMap.put("schoolId",schoolId);
//                    alumniAdminMap.put("schoolParentId",schoolParentId);
//                    List<MyAlumniAdminEntity> myAlumniAdminEntityList = myAlumniAdminService.queryListBySchoolIdAndParentId(alumniAdminMap);
//                    for(MyAlumniAdminEntity alumniAdminEntity : myAlumniAdminEntityList){
//                        SmsUtils.notifySchoolAdmin(schoolName,schoolAreaName,myUserEntity.getName(),myUserEntity.getTelephone(),alumniAdminEntity.getAdminPhone());
//                    }
//                }
//            );
//            thread.start();
            UserStatusVo statusVo = new UserStatusVo();
            statusVo.setStatus(UserStatusEnum.APPLYING.getValue());
            return toResponseObject(0, "提交成功！", statusVo);
        }//审批拒绝后可重新提交
        else if (UserStatusEnum.NEED_EDIT.getValue().equals(userEntity.getStatus())) {
            MyApprovalEntity myApprovalEntity = myApprovalService.queryByUserId(userEntity.getId());
            if (null != myApprovalEntity) {
                String reason = myApprovalEntity.getRefusedReason();
                //同时更新已有的状态码
                userEntity.setStatus(UserStatusEnum.APPLYING.getValue());
                myUserService.update(userEntity);

                return toResponseFail(reason);
            }

        } else if (UserStatusEnum.REFUSED.getValue().equals(userEntity.getStatus())) {
            return toResponseFail("拒绝申请，请联系管理员");
        } else if (UserStatusEnum.APPLIED.getValue().equals(userEntity.getStatus())) {
            return toResponseFail("请勿多次加入！");
        }
        return null;
    }

    /**
     * 申请加入校友会
     *
     * @param myUserEntity
     * @return
     */
    @RequestMapping("joinSchoolAssociation")
    public Object joinSchoolAssociation(@LoginUser MyUserEntity myUserEntity,
                                        Integer schoolId,
                                        int checkType,
                                        String telephoneListString,
                                        String certificateNo) {
        if (myUserEntity.getTelephone()==null){
            throw new ApiRRException("请先填写基本信息后，再申请加入校友会", 99);
        }
        Integer userId = myUserEntity.getId();
        Integer schoolParentId = mySchoolUserService.getSchoolParentId(schoolId);
        MySchoolUserEntity mySchoolUserEntity = mySchoolUserService.getOneBySchoolParentAndUserId(userId, schoolParentId);
        if (checkType == CheckTypeEnum.BY_ALUMNI.getValue()) {
            if (telephoneListString == null) {
                throw new ParamsException("telephoneList");
            }
            String[] telephoneList = telephoneListString.split("#");
            if (telephoneList.length != Const.CHECKED_ALUMNI_SIZE) {
                throw new ParamsException("telephoneList");
            }
            return mySchoolUserService.checkByAlumni(userId, schoolParentId, schoolId, mySchoolUserEntity, telephoneList);
        } else if (checkType == CheckTypeEnum.BY_CERTIFICATE_NO.getValue()) {
            if (certificateNo == null) {
                throw new ParamsException("certificateNo");
            }
            return mySchoolUserService.checkByCertificateNo(userId, schoolParentId, mySchoolUserEntity, schoolId, certificateNo);
        } else if (checkType == CheckTypeEnum.BY_ADMIN.getValue()) {
            return mySchoolUserService.checkByAdmin(userId, schoolParentId, mySchoolUserEntity, schoolId);
        } else {
            throw new ParamsException("checkType");
        }
    }
}
