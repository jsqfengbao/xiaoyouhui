package com.king.dao;

import com.king.entity.MyForumModuleUserEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @author hhumhr
 */
public interface MyForumModuleUserDao {
    int follow(@Param("userId") Integer userId, @Param("subModuleId") Integer subModuleId, @Param("moduleId") Integer moduleId);

    MyForumModuleUserEntity checkFollow(@Param("userId") Integer userId, @Param("subModuleId") Integer subModuleId);

    int reFollow(Long id);

    int unFollow(Long id);
}
