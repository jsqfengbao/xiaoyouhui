package com.king.dao;

import com.king.entity.MyUserApplyEntity;
import org.apache.ibatis.annotations.Param;

/**
 * 用户申请表Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2019-01-05 21:59:37
 */
public interface MyUserApplyDao extends BaseDao<MyUserApplyEntity> {

    public MyUserApplyEntity getOne(@Param("userId") Integer userId, @Param("schoolId")  Integer schoolId, @Param("schoolParentId") Integer schoolParentId);
}
