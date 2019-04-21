package com.king.service;

import com.king.dao.MyCheckByUserDao;
import com.king.dao.MySchoolDao;
import com.king.dao.MySchoolUserDao;
import com.king.dao.SysUserSchoolDao;
import com.king.entity.MyCheckByUserEntity;
import com.king.entity.MySchoolUserEntity;
import com.king.entity.MyUserEntity;
import com.king.enums.CheckTypeEnum;
import com.king.enums.UserStatusEnum;
import com.king.util.Const;
import com.king.util.ServerResponse;
import com.king.utils.ApiRRException;
import com.king.utils.FailureException;
import com.king.utils.ParamsException;
import com.king.vo.ApplyingUserVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/23 16:44
 * @Modified By hhumhr
 **/
@Service
public class MySchoolUserService {
    @Resource
    private MySchoolUserDao mySchoolUserDao;

    @Resource
    private MySchoolDao mySchoolDao;

    @Resource
    private MyCheckByUserDao myCheckByUserDao;

    @Resource
    private SysUserSchoolDao sysUserSchoolDao;

    public List<ApplyingUserVO> getNeedMeCheckUserList(Integer schoolParentId, Integer id) {
        List<MyUserEntity> myUserEntityList = myCheckByUserDao.selectUserListByByUserIdAndSchoolParentId(id, schoolParentId);
        return assembleApplyingUserVOList(myUserEntityList);

    }

    public List<ApplyingUserVO> getApplyingUserList(Integer schoolParentId,Integer adminId){
        List<Integer> schoolIdList = sysUserSchoolDao.getSchoolIdListBySysUserId(adminId);
        if (schoolIdList.size()==0){
            throw new ApiRRException("没有权限");
        }
        boolean isSchoolAdmin = false;
        for (Integer schoolId : schoolIdList) {
            if (schoolId.equals(schoolParentId)){
                isSchoolAdmin = true;
                break;
            }
        }
        List<MyUserEntity> myUserEntityList;
        if (isSchoolAdmin){
            myUserEntityList = mySchoolUserDao.getApplyingUserListBySchoolParentId(schoolParentId);

        }else {
            myUserEntityList = mySchoolUserDao.getApplyingUserListBySchoolIdList(schoolIdList);
        }

        return assembleApplyingUserVOList(myUserEntityList);
    }

    private List<ApplyingUserVO> assembleApplyingUserVOList(List<MyUserEntity> myUserEntityList) {
        List<ApplyingUserVO> applyingUserVOList = new ArrayList<>();
        for (MyUserEntity myUserEntity : myUserEntityList) {
            ApplyingUserVO applyingUserVO = new ApplyingUserVO();
            applyingUserVO.setMySchoolUserId(myUserEntity.getSchoolUserId());
            applyingUserVO.setUserId(myUserEntity.getId());
            applyingUserVO.setCheckType(myUserEntity.getCheckType());
            applyingUserVO.setName(myUserEntity.getName());
            applyingUserVO.setCertificateNo(myUserEntity.getCertificateNo());
            applyingUserVOList.add(applyingUserVO);
        }
        return applyingUserVOList;
    }

    public List<MySchoolUserEntity> getUserSchoolListBySchoolParentId(int schoolParentId) {
        return mySchoolUserDao.queryList(schoolParentId);
    }

    public List<MySchoolUserEntity> getListUserSchool(Map<String, Object> map) {
        return mySchoolUserDao.queryList(map);
    }


    public int updateById(MySchoolUserEntity mySchoolUserEntity) {
        return mySchoolUserDao.update(mySchoolUserEntity);
    }


    public MySchoolUserEntity getMyUserScoolEntityByUserId(){
    //todo
            return null;
    }

    @Transactional(rollbackFor = Exception.class)
    public ServerResponse checkByAlumni(Integer userId,
                                        Integer schoolParentId,
                                        Integer schoolId,
                                        MySchoolUserEntity mySchoolUserEntity,
                                        String[] telephoneList) {
        ServerResponse x = checkCommonStatus(mySchoolUserEntity);
        if (x != null) {
            return x;
        }
        List checkedUserIdList = mySchoolUserDao.getCheckedUserIdListByTelephoneList(telephoneList);
        if (checkedUserIdList.size() != Const.CHECKED_ALUMNI_SIZE) {
            return ServerResponse.createByErrorMessage("所输入的手机号有未通过审核的，请和相关校友确认后重输");
        }
//        如果是修改后重新申请验证,需要改
        if (mySchoolUserEntity != null && mySchoolUserEntity.getStatus().equals(UserStatusEnum.NEED_EDIT.getValue())) {
            int count = mySchoolUserDao.updateStatusAndCheckTypeById(mySchoolUserEntity.getId(), UserStatusEnum.APPLYING.getValue(), CheckTypeEnum.BY_ALUMNI.getValue());
            insertIntoCheckByUser(userId, mySchoolUserEntity, checkedUserIdList);
            //todo 给校友发短信等
            notifyAlumni();

        }
        mySchoolUserEntity = assemblyMyUserSchoolEntity(userId, schoolParentId, schoolId, CheckTypeEnum.BY_CERTIFICATE_NO.getValue());
        int count;
        count = mySchoolUserDao.insert(mySchoolUserEntity);
        if (count != 1) {
            return ServerResponse.createByErrorMessage("申请失败，请稍后再试");
        }
        // 往 my_check_by_user 里面插入数据
        insertIntoCheckByUser(userId, mySchoolUserEntity, checkedUserIdList);
        notifyAlumni();
        return ServerResponse.createBySuccessMessage("申请成功，审核中");
    }
    @Transactional
    public ServerResponse checkByCertificateNo(Integer userId,
                                               Integer schoolParentId,
                                               MySchoolUserEntity mySchoolUserEntity,
                                               Integer schoolId,
                                               String certificateNo) {
        ServerResponse x = checkCommonStatus(mySchoolUserEntity);
        if (x != null) {
            return x;
        }
        // 如果是修改后重新申请验证
        if (mySchoolUserEntity != null && mySchoolUserEntity.getStatus().equals(UserStatusEnum.NEED_EDIT.getValue())) {
            int count = mySchoolUserDao.updateStatusAndCheckTypeAndCertificateNoById(mySchoolUserEntity.getId(), UserStatusEnum.APPLYING.getValue(), CheckTypeEnum.BY_CERTIFICATE_NO.getValue(), certificateNo);
            //todo 通知主管理员
            notifyMainAdmin();
            return ServerResponse.createBySuccessMessage("申请成功，审核中");
        }

        // 新的申请
        mySchoolUserEntity = assemblyMyUserSchoolEntity(userId, schoolParentId, schoolId, CheckTypeEnum.BY_CERTIFICATE_NO.getValue());
        int count = mySchoolUserDao.insert(mySchoolUserEntity);
        //todo 通知主管理员
        notifyMainAdmin();
        return ServerResponse.createBySuccessMessage("申请成功，审核中");
    }

    @Transactional
    public ServerResponse checkByAdmin(Integer userId,
                                       Integer schoolParentId,
                                       MySchoolUserEntity mySchoolUserEntity,
                                       Integer schoolId) {
        ServerResponse x = checkCommonStatus(mySchoolUserEntity);
        if (x != null) {
            return x;
        }
        // 如果是修改后重新申请验证
        if (mySchoolUserEntity != null && mySchoolUserEntity.getStatus().equals(UserStatusEnum.NEED_EDIT.getValue())) {
            int count = mySchoolUserDao.updateStatusAndCheckTypeById(mySchoolUserEntity.getId(), UserStatusEnum.APPLYING.getValue(), CheckTypeEnum.BY_ADMIN.getValue());
            //todo 通知分会理员
            notifyAdmin();
            return ServerResponse.createBySuccessMessage("申请成功，审核中");
        }
        // 新的申请
        mySchoolUserEntity = assemblyMyUserSchoolEntity(userId, schoolParentId, schoolId, CheckTypeEnum.BY_ADMIN.getValue());
        int count = mySchoolUserDao.insert(mySchoolUserEntity);
        //todo 通知分会理员
        notifyAdmin();
        return ServerResponse.createBySuccessMessage("申请成功，审核中");

    }

    private void notifyAlumni() {

    }

    private void notifyMainAdmin() {

    }

    private void notifyAdmin() {

    }

    private void insertIntoCheckByUser(Integer userId, MySchoolUserEntity mySchoolUserEntity, List checkedUserIdList) {
        int count;//主键
        Integer schoolUserId = mySchoolUserEntity.getId();
        // 根据生成的主键 来 往 my_check_by_user 里面插入数据
        MyCheckByUserEntity[] myCheckByUserEntityList = new MyCheckByUserEntity[Const.CHECKED_ALUMNI_SIZE];
        for (int i = 0; i < Const.CHECKED_ALUMNI_SIZE; i++) {
            MyCheckByUserEntity myCheckByUserEntity = new MyCheckByUserEntity();
            myCheckByUserEntity.setSchoolUserId(schoolUserId);
            myCheckByUserEntity.setUserId(userId);
            myCheckByUserEntity.setSchoolParentId(mySchoolUserEntity.getSchoolParentId());
            myCheckByUserEntity.setByUserId((Integer) checkedUserIdList.get(i));
            myCheckByUserEntityList[i] = myCheckByUserEntity;
        }
        count = myCheckByUserDao.insertList(myCheckByUserEntityList);
        if (count != Const.CHECKED_ALUMNI_SIZE) {
            throw new FailureException("申请");
        }
    }

    private MySchoolUserEntity assemblyMyUserSchoolEntity(Integer userId, Integer schoolParentId, Integer schoolId, Integer checkType) {
        MySchoolUserEntity mySchoolUserEntity;
        mySchoolUserEntity = new MySchoolUserEntity();
        mySchoolUserEntity.setUserId(userId);
        mySchoolUserEntity.setSchoolParentId(schoolParentId);
        mySchoolUserEntity.setSchoolId(schoolId);
        mySchoolUserEntity.setCheckType(checkType);
        return mySchoolUserEntity;
    }

    public MySchoolUserEntity getOneBySchoolParentAndUserId(Integer userId, Integer schoolParentId) {
        return mySchoolUserDao.getOneBySchoolParentAndUserId(schoolParentId, userId);
    }

    /**
     * 检查是否被禁用、是否正在审核、是否已经通过了审核
     * @param mySchoolUserEntity
     * @return
     */
    private ServerResponse checkCommonStatus(MySchoolUserEntity mySchoolUserEntity) {
        if (mySchoolUserEntity != null) {
            Integer status = mySchoolUserEntity.getStatus();
            if (status.equals(UserStatusEnum.REFUSED.getValue()) || mySchoolUserEntity.getEnabled().equals(0)) {
                return ServerResponse.createByErrorMessage("拒绝审核，请联系管理员");
            }
            if (status.equals(UserStatusEnum.APPLYING.getValue())) {
                return ServerResponse.createByErrorMessage("已有申请正在审核中");
            }
            if (status.equals(UserStatusEnum.APPLIED.getValue())) {
                return ServerResponse.createByErrorMessage("已加入该学校校友会，如需修改所在分会请联系管理员");
            }
        }
        return null;
    }


    public Integer getSchoolParentId(Integer schoolId) {
        Integer schoolParentId = mySchoolDao.getSchoolParentIdBySchoolId(schoolId);
        if (schoolParentId == null) {
            throw new ApiRRException("分会id err");
        }
        return schoolParentId;
    }

    public void pass(Integer schoolUserId) {
        mySchoolUserDao.updateStatusById(schoolUserId,UserStatusEnum.APPLIED.getValue());
    }
    public void refuse(Integer schoolUserId,String refuseReason){
        mySchoolUserDao.updateStatusAndRefuseReasonById(schoolUserId,UserStatusEnum.NEED_EDIT.getValue(),refuseReason);
    }
}
