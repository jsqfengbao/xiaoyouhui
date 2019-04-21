package com.king.service;

import com.king.dao.MyUserDao;
import com.king.dao.annotation.IMyUserDao;
import com.king.entity.MyUserEntity;
import com.king.vo.GetInviteUserListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/6 17:10
 * @Modified By
 **/
@Service
public class MyUserService {
    @Autowired
    private MyUserDao userDao;
    @Autowired
    private IMyUserDao iMyUserDao;

    public MyUserEntity queryByOpenId(String openId){
        return userDao.queryByOpenId(openId);
    }

    public void save(MyUserEntity userVo) {
        userDao.save(userVo);
    }
    public void update(MyUserEntity user) {
        userDao.update(user);
    }
    public List<GetInviteUserListVo> getInviteUserListVoList(int inviteUserId){
        return iMyUserDao.getInviteUserList(inviteUserId);
    }

    public MyUserEntity queryObject(Integer id){
        return userDao.queryObject(id);
    }
}
