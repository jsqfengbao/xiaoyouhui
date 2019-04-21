package com.king.dao.annotation;

import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Select;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/2/22 20:28
 * @Modified By
 **/
public interface IMyForumDao {

    @Select("SELECT u.id as userId,u.name as name,u.nickname,f.* FROM my_forum as f,my_user as u where f.user_id = u.id and f.id = #{forumId}")
    public JSONObject getForumDetailById(int forumId);
}
