package com.king.service;

import com.king.dao.MyAlumniAdminDao;
import com.king.entity.MyAlumniAdminEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/27 12:44
 * @Modified By
 **/
@Service
public class MyAlumniAdminService {
    @Autowired
    private MyAlumniAdminDao myAlumniAdminDao;

    public List<MyAlumniAdminEntity> getAlumniAdminList(Map<String,Object> map){
        return myAlumniAdminDao.queryList(map);
    }
    public List<MyAlumniAdminEntity> queryListBySchoolIdAndParentId(Map<String,Object> map){
        return myAlumniAdminDao.queryListBySchoolIdAndParentId(map);
    }
    public int queryTotal(Map<String, Object> map) {
        return myAlumniAdminDao.queryTotal(map);
    }
}
