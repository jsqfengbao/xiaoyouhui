package com.king.dao;

import com.king.entity.MyForumPostZanUserEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @author hhumhr
 */
public interface MyForumPostZanUserDao {
    MyForumPostZanUserEntity checkZan(@Param("userId") Integer userId, @Param("postId") Integer postId);

    int zan(@Param("userId") Integer userId, @Param("postId") Integer postId);

    int reZan(Integer id);

    int unZan(Integer id);
}
