package com.king.service;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author hhumhr
 */
public class MyForumModuleServiceTest extends BaseJUnitTest {
    @Autowired
    private MyForumModuleService myForumModuleService;


    @Test
    public void getModuleListWithSonAndStatus() {
        List moduleListWithSonAndStatus = myForumModuleService.getModuleListWithSonAndStatus(380);
        System.out.println();
    }
}