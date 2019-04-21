package com.king.service;

import com.alibaba.fastjson.JSONObject;
import com.king.dao.annotation.IMyForumDao;

import com.king.BaseJUnitTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/2/22 20:41
 * @Modified By
 **/
public class TestIMyForumDao extends BaseJUnitTest {

    @Autowired
    private IMyForumDao iMyForumDao;

    @Test
    public void getForumDetailById(){
        JSONObject jsonObject = iMyForumDao.getForumDetailById(1);
        System.out.println(jsonObject);
    }
}
