package com.king.service;

import com.king.dao.MyUserApplyDao;
import com.king.dao.annotation.IMyUserApplyDao;
import com.king.entity.MyUserApplyEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/5 22:20
 * @Modified By
 **/
@Service
public class MyUserApplyService {
    @Autowired
    private MyUserApplyDao myUserApplyDao;
    @Autowired
    private IMyUserApplyDao iMyUserApplyDao;

    public int saveUserApply(MyUserApplyEntity myUserApplyEntity){
        return myUserApplyDao.save(myUserApplyEntity);
    }

    public MyUserApplyEntity getOne(int userId,int schoolId,int schoolParentId){
        return myUserApplyDao.getOne(userId,schoolId,schoolParentId);
    }
    public MyUserApplyEntity getOneById(int id){
        return myUserApplyDao.queryObject(id);
    }
    public List<MyUserApplyEntity> getListMyUserApply(Map<String,Object> map){
        return myUserApplyDao.queryList(map);
    }
    public List<MyUserApplyEntity> getListMyUserApplyByCondition(int schoolId,int schoolParentId){
        return iMyUserApplyDao.getMyUserApplying(schoolParentId,schoolId);
    }
}
