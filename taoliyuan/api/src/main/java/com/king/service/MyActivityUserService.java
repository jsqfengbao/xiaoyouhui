package com.king.service;

import com.king.dao.MyActivityUserDao;
import com.king.dao.annotation.IMyActivityUserDao;
import com.king.entity.MyActivityUserEntity;
import com.king.vo.GetActivityUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/22 17:41
 * @Modified By
 **/
@Service
public class MyActivityUserService {
    @Autowired
    private IMyActivityUserDao iMyActivityUserDao;
    @Autowired
    private MyActivityUserDao myActivityUserDao;

    public List<MyActivityUserEntity> getOneByCondition(Map<String,Object> map){
        return myActivityUserDao.queryList(map);
    }
    public int saveActivityUser(MyActivityUserEntity myActivityUserEntity){
        return myActivityUserDao.save(myActivityUserEntity);
    }
    public int update(MyActivityUserEntity myActivityUserEntity){
        return myActivityUserDao.update(myActivityUserEntity);
    }

    public List<GetActivityUserVo> getAllMyUserByActivityId(int activityId){
        return iMyActivityUserDao.getAllUserByActivityId(activityId);
    }
}
