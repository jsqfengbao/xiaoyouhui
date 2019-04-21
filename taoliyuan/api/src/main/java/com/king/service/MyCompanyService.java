package com.king.service;

import com.king.dao.MyCompanyDao;
import com.king.entity.MyCompanyEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/16 13:22
 * @Modified By
 **/
@Service
public class MyCompanyService {

    @Autowired
    private MyCompanyDao myCompanyDao;


    public List<MyCompanyEntity> getCompanyList(Map<String,Object> map){
        return myCompanyDao.queryList(map);
    }
    public int queryTotal(Map<String,Object> map){
        return myCompanyDao.queryTotal(map);
    }
    public MyCompanyEntity getCompanyContentById(@Param("id") int id){
        return myCompanyDao.queryObject(id);
    }
}
