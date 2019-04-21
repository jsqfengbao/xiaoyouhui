package com.king.dao;

import com.king.entity.MyForumCommentEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hhumhr
 */
public interface MyForumCommentDao {
    Integer getMaxFloorByPostId(Integer postId);
    int saveComment(MyForumCommentEntity myForumCommentEntity);
    int saveCommentReply(MyForumCommentEntity myForumCommentEntity);
    List<MyForumCommentEntity> getCommentListByPostId(Integer postId);

    List<MyForumCommentEntity> getCommentReplyListByCommentId(Integer commentId);

    List<Integer> getZanedCommentIdListInSelectedCommentIdListByUserId(@Param("commentIdList") List<Integer> commentIdList,@Param("userId") Integer userId);

    int decreaseZanNum(Integer id);

    int increaseZanNum(Integer id);

    int increaseReplyNum(Integer id);
}
