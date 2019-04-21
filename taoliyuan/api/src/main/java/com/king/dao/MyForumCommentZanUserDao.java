package com.king.dao;

import com.king.entity.MyForumCommentZanUserEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @author hhumhr
 */
public interface MyForumCommentZanUserDao {
    MyForumCommentZanUserEntity checkZan(@Param("userId") Integer userId, @Param("commentId") Integer commentId);

    int zan(@Param("userId") Integer userId, @Param("commentId") Integer commentId);

    int reZan(Integer id);

    int unZan(Integer id);
}
