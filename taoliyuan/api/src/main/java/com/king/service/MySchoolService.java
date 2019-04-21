package com.king.service;

import com.king.dao.MySchoolDao;
import com.king.dao.MyUserDao;
import com.king.entity.MySchoolEntity;
import com.king.entity.MyUserEntity;
import com.king.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/15 15:27
 * @Modified By
 **/
@Service
public class MySchoolService {

    @Autowired
    private MySchoolDao mySchoolDao;
    @Autowired
    private MyUserDao myUserDao;

    public List<MySchoolEntity> getParentSchool(Map<String, Object> map){
        return mySchoolDao.queryList(map);
    }

    public List<MySchoolEntity> getSchoolArea(Map<String, Object> map){
        return mySchoolDao.queryList(map);
    }
    public MySchoolEntity queryObject(int id){
        return mySchoolDao.queryObject(id);
    }
    public MySchoolEntity getSchoolParentId(int id){
        return mySchoolDao.queryObject(id);
    }
    public int queryTotal(Map<String, Object> map) {
        return mySchoolDao.queryTotal(map);
    }

    public StringBuilder checkUserStatus(int userId){
        MyUserEntity myUserEntity = myUserDao.queryObject(userId);
        StringBuilder sb = new StringBuilder();
        if(StringUtils.isNullOrEmpty(myUserEntity.getName())){
            sb.append("姓名不能为空！\n");
        }
        if(StringUtils.isNullOrEmpty(myUserEntity.getTelephone())){
            sb.append("手机号码不能为空！\n");
        }
        if(StringUtils.isNullOrEmpty(myUserEntity.getDepart())){
            sb.append("系别不能为空！\n");
        }
        if(StringUtils.isNullOrEmpty(myUserEntity.getInShool())){
            sb.append("入学时间不能为空！\n");
        }
        if(StringUtils.isNullOrEmpty(myUserEntity.getOutShool())){
            sb.append("毕业时间不能为空！\n");
        }
        if(StringUtils.isNullOrEmpty(myUserEntity.getEducation())){
            sb.append("学历不能为空！\n");
        }
        return sb;
    }
}
