package com.king.dao;

import com.king.BaseJUnitTest;
import com.king.entity.MyForumModuleEntity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author hhumhr
 */
public class MyForumModuleDaoTest extends BaseJUnitTest {

    @Autowired
    private MyForumModuleDao myForumModuleDao;

    @Test
    public void testGetModuleListWithSon(){
        List<MyForumModuleEntity> moduleListWithSon  = myForumModuleDao.getModuleListWithSon();
        System.out.println(moduleListWithSon );
    }

}