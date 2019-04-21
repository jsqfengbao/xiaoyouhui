package com.king.service;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @author hhumhr
 */
public class MyForumModuleUserServiceTest extends BaseJUnitTest {

    @Autowired
    private MyForumModuleUserService myForumModuleUserService;

    @Test
    public void followSubModule() {
        boolean result = myForumModuleUserService.followSubModule(380, 2);

        System.out.println();
    }

    @Test
    public void unFollowSubModule() {
        boolean result = myForumModuleUserService.unFollowSubModule(380, 2);

        System.out.println();
    }


}