package com.king.service;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;

import java.util.Map;

import static org.junit.Assert.*;

/**
 * @author hhumhr
 */
public class OssServiceTest extends BaseJUnitTest {


//    @Autowired
//    private OssService ossService ;

    @Autowired
    private TokenService tokenService;

    @Test
    public void getSign() {
        Map<String, Object> token = tokenService.createToken(1);
        System.out.println(token);
//        Object sign = ossService.getSign();
//        System.out.println(sign);
    }
}