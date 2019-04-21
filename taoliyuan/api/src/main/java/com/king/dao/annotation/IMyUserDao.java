package com.king.dao.annotation;

import com.king.entity.MyUserEntity;
import com.king.vo.GetInviteUserListVo;

import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/23 14:43
 * @Modified By
 **/
public interface IMyUserDao {

    @Select("select * from my_user where id = #{userId}")
    public MyUserEntity getMyUser(int userId);

    @Select("SELECT us.user_id,us.school_id,us.status,us.enabled,u.name,u.avatar,u.invite_user_id FROM my_user as u,my_user_school as us where u.id = us.user_id and invite_user_id =#{inviteUserId}")
    public List<GetInviteUserListVo> getInviteUserList(int inviteUserId);
}
