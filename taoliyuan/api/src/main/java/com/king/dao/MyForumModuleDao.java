package com.king.dao;

import com.king.entity.MyForumModuleEntity;

import java.util.List;

/**
 * Dao
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 10:54:21
 */
public interface MyForumModuleDao extends BaseDao<MyForumModuleEntity> {
    List<MyForumModuleEntity> getModuleListWithSon();

}
