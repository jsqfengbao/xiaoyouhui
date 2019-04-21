package com.king.dao.annotation;

import com.king.entity.MyUserApplyEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/28 10:05
 * @Modified By
 **/
public interface IMyUserApplyDao {

    @Select("SELECT * FROM my_user_apply ua WHERE ua.user_id NOT IN (SELECT user_id FROM my_user_school where school_id = #{schoolId} and school_parent_id = #{schoolParentId}) and school_id = #{schoolId} and school_parent_id = #{schoolParentId};")
    public List<MyUserApplyEntity> getMyUserApplying(@Param("schoolParentId") int schoolParentId, @Param("schoolId") int schoolId);
}
