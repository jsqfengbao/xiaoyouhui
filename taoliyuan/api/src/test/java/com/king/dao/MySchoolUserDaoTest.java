package com.king.dao;

import com.king.BaseJUnitTest;
import com.king.entity.MySchoolUserEntity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author hhumhr
 */
public class MySchoolUserDaoTest extends BaseJUnitTest {

    @Autowired
    private MySchoolUserDao mySchoolUserDao;

    @Test
    public void  getOneBySchoolParentAndUserId(){
        MySchoolUserEntity oneBySchoolParentAndUserId = mySchoolUserDao.getOneBySchoolParentAndUserId(1, 112);
        System.out.println();
    }

}