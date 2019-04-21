package com.king.service;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @author hhumhr
 */
public class MyActivityServiceTest extends BaseJUnitTest {

    @Autowired
    private MyActivityService myActivityService;

    @Test
    public void getRecommendedActivityList() {
        myActivityService.getRecommendedActivityList(1,1);
        System.out.println();
    }
}