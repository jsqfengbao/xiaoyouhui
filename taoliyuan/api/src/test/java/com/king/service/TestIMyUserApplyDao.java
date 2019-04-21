package com.king.service;

import com.king.dao.annotation.IMyUserApplyDao;
import com.king.entity.MyUserApplyEntity;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/28 10:11
 * @Modified By
 **/
public class TestIMyUserApplyDao extends BaseJUnitTest {
    @Autowired
    private IMyUserApplyDao iMyUserApplyDao;
    @Test
    public void getUserApplying(){
        List<MyUserApplyEntity> myUserApplyEntityList = iMyUserApplyDao.getMyUserApplying(1,2);
        for(MyUserApplyEntity userApplyEntity : myUserApplyEntityList){
            System.out.println(userApplyEntity);
        }
    }
}
