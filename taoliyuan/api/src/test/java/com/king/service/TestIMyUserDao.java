package com.king.service;

import com.king.dao.annotation.IMyActivityUserDao;
import com.king.dao.annotation.IMyUserDao;
import com.king.entity.MyUserEntity;
import com.king.vo.GetActivityUserVo;
import com.king.vo.GetInviteUserListVo;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/23 14:51
 * @Modified By
 **/


public class TestIMyUserDao extends BaseJUnitTest {
    @Autowired
    private IMyUserDao myUserDao;
    @Autowired
    private IMyActivityUserDao myActivityUserDao;

    @Test
    public void getAllMyUser(){
        MyUserEntity myUserEntity = myUserDao.getMyUser(51);
        System.out.println(myUserEntity);
    }

    @Test
    public void getAllMyUserByActivityId(){
        List<GetActivityUserVo> myUserEntities = myActivityUserDao.getAllUserByActivityId(9);
        for(GetActivityUserVo userEntity : myUserEntities){
            System.out.println(userEntity);
        }
    }

    @Test
    public void getAllInviteUserList(){
        List<GetInviteUserListVo> getInviteUserListVos = myUserDao.getInviteUserList(51);
        for(GetInviteUserListVo inviteUserListVo : getInviteUserListVos){
            System.out.println(inviteUserListVo);
        }
    }

}
