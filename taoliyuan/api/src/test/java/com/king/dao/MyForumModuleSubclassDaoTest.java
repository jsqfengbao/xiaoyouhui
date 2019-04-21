package com.king.dao;

import com.king.BaseJUnitTest;
import com.king.entity.MyForumModuleSubclassEntity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author hhumhr
 */
public class MyForumModuleSubclassDaoTest extends BaseJUnitTest {

    @Autowired
    private MyForumModuleSubclassDao myForumModuleSubclassDao;

    @Test
    public void getFollowedSubModuleList(){
        List<MyForumModuleSubclassEntity> followedSubModuleList = myForumModuleSubclassDao.getFollowedSubModuleList(380);
        System.out.println();
    }

}