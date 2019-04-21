package com.king.dao;

import com.king.entity.MyForumPostEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hhumhr
 */
public interface MyForumPostDao extends BaseDao {

    List<MyForumPostEntity> getFollowedModulePostList(Integer userId);

    int increaseViewNumById(Integer id);

    MyForumPostEntity getPostDetailById(Integer id);

    Integer getZanedPostIdByUserIdAndPostId(@Param("postId")Integer postId,@Param("userId") Integer userId);

    int increaseViewNum(Integer id);
    int increaseZanNum(Integer id);
    int decreaseZanNum(Integer id);

    int increaseShareNum(Integer id);
    int increaseCommentNum(Integer id);

    List<Integer> getZanedPostIdListInSelectedPostIdListByUserId(@Param("postIdList") List<Integer> postIdList,@Param("userId") Integer userId);
}
