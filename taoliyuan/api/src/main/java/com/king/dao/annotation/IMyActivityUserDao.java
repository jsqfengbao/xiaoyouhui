package com.king.dao.annotation;

import com.king.vo.GetActivityUserVo;

import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/23 15:42
 * @Modified By
 **/
public interface IMyActivityUserDao {

    @Select("select * from my_user as u,my_activity_user as au where au.activity_id=#{activityId} and u.id = au.user_id and au.enabled = 1")
    public List<GetActivityUserVo> getAllUserByActivityId(int activityId);
}
