package com.king.service;

import com.king.dao.MyForumModuleSubclassDao;
import com.king.dao.MyForumModuleUserDao;
import com.king.entity.MyForumModuleUserEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author hhumhr
 */
@Service
public class MyForumModuleUserService {

    @Resource
    private MyForumModuleUserDao myForumModuleUserDao;

    @Resource
    MyForumModuleSubclassDao myForumModuleSubclassDao;

    public boolean followSubModule(Integer userId, Integer subModuleId) {
        MyForumModuleUserEntity myForumModuleUserEntity = myForumModuleUserDao.checkFollow(userId, subModuleId);
        if (myForumModuleUserEntity != null) {
            if (myForumModuleUserEntity.getEnabled().equals(1)) {
                return true;
            } else {
                return myForumModuleUserDao.reFollow(myForumModuleUserEntity.getId()) == 1;
            }
        }
        Integer moduleId = myForumModuleSubclassDao.getModuleIdById(subModuleId);
        int count = myForumModuleUserDao.follow(userId, subModuleId, moduleId);
        return count == 1;
    }

    public boolean unFollowSubModule(Integer userId, Integer subModuleId) {
        MyForumModuleUserEntity myForumModuleUserEntity = myForumModuleUserDao.checkFollow(userId, subModuleId);
        if (myForumModuleUserEntity != null) {
            if (myForumModuleUserEntity.getEnabled().equals(0)) {
                return true;
            } else {
                return myForumModuleUserDao.unFollow(myForumModuleUserEntity.getId()) == 1;
            }
        } else {
            return true;
        }
    }

}
