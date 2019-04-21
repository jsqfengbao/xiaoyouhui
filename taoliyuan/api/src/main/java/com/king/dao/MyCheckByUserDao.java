package com.king.dao;

import com.king.entity.MyCheckByUserEntity;
import com.king.entity.MyUserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hhumhr
 */
public interface MyCheckByUserDao {
    /**
     * 批量插入
     *
     * @param myCheckByUserEntities
     * @return 插入的行数
     */
    int insertList(MyCheckByUserEntity[] myCheckByUserEntities);

    List<MyCheckByUserEntity> selectListBySchoolUserId( @Param("schoolUserId") Integer schoolUserId);

    Integer selectIdByByUserIdAndSchoolParentId(@Param("byUserId") Integer byUserId, @Param("schoolParentId") Integer schoolParentId);

    List<MyUserEntity> selectUserListByByUserIdAndSchoolParentId(@Param("byUserId") Integer byUserId, @Param("schoolParentId") Integer schoolParentId);

    int updateCheckedBySchoolUserId(@Param("schoolUserId") Integer schoolUserId, @Param("byUserId") Integer byUserId);

    int updateCheckedAndRefuseReasonBySchoolUserId(@Param("schoolUserId") Integer schoolUserId, @Param("byUserId") Integer byUserId, @Param("refuseReason") String refuseReason);
}
