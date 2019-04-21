package com.king.service;

import com.king.dao.MyCheckByUserDao;
import com.king.dao.MySchoolUserDao;
import com.king.entity.MyCheckByUserEntity;
import com.king.enums.UserStatusEnum;
import com.king.util.SmsUtils;
import com.king.utils.SmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author hhumhr
 */
@Service
public class MyCheckByUserService {
    @Autowired
    private MyCheckByUserDao myCheckByUserDao;

    private MySchoolUserDao mySchoolUserDao;

    public boolean checkCanBeChecker(Integer byUserId, Integer schoolParentId) {
        Integer integer = myCheckByUserDao.selectIdByByUserIdAndSchoolParentId(byUserId, schoolParentId);
        return integer != null;
    }

    @Transactional
    public void pass(Integer schoolUserId,Integer byUserId){

        myCheckByUserDao.updateCheckedBySchoolUserId(schoolUserId,byUserId);
        doSomethingIfDoneAndIfPass(schoolUserId);
    }

    @Transactional
    public void refuse(Integer schoolUserId,Integer byUserId,String refuseReason){
        myCheckByUserDao.updateCheckedAndRefuseReasonBySchoolUserId(schoolUserId,byUserId,refuseReason);
        doSomethingIfDoneAndIfPass(schoolUserId);
    }

    private void doSomethingIfDoneAndIfPass(Integer schoolUserId) {
        List<MyCheckByUserEntity> checkedList = myCheckByUserDao.selectListBySchoolUserId(schoolUserId);

        boolean isDone = true;
        boolean isPass = true;
        StringBuilder refuse = new StringBuilder();
        for (MyCheckByUserEntity checkByUserEntity : checkedList) {
            if (checkByUserEntity.getChecked() == 0){
                isDone = false;
            }
            if (checkByUserEntity.getChecked() == -1){
                isPass = false;
                refuse.append(checkByUserEntity.getRefuseReason());
            }
        }

        if (isDone){
            if (isPass){
                mySchoolUserDao.updateStatusById(schoolUserId, UserStatusEnum.APPLIED.getValue());
//                SmsUtils.notifyApplyUser();

            }else {

                mySchoolUserDao.updateStatusAndRefuseReasonById(schoolUserId,UserStatusEnum.NEED_EDIT.getValue(),refuse.toString());
            }
        }
    }
}
