package com.king.dao;

import com.king.entity.MyApprovalEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-23 17:08:53
 */
public interface MyApprovalDao extends BaseDao<MyApprovalEntity> {

    MyApprovalEntity queryByUserId(@Param("userId") int userId);
}
