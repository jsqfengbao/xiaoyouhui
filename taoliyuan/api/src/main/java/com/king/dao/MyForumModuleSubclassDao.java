package com.king.dao;

import com.king.entity.MyForumModuleSubclassEntity;

import java.util.List;

/**
 * Dao
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 10:54:21
 */
public interface MyForumModuleSubclassDao extends BaseDao<MyForumModuleSubclassEntity> {

    List<MyForumModuleSubclassEntity> getFollowedSubModuleList(Integer userId);

    Integer getModuleIdById(Integer subModuleId);


}
