package com.king.dao.annotation;

import com.king.vo.GetPriseListVo;
import com.king.vo.GetReplyListVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/2/23 14:41
 * @Modified By
 **/
public interface IMyForumReplyDao {
    @Select("SELECT u.id AS userId, u.NAME AS NAME, u.nickname, u.avatar FROM my_user AS u left join my_forum_reply AS f on f.user_id = u.id where f.forum_id = #{forumId} and f.type = #{type}")
    public List<GetPriseListVo> getForumPriseById(@Param("forumId") int forumId,@Param("type") String type);


    @Select("SELECT u.id as userId,\n" +
            "\tu.name as name,\n" +
            "\tu.nickname as nickname,\n" +
            "\tfr.parent_reply_id as parentReplyId,\n" +
            "\tfr.parent_reply_user_id as parentReplyUserId,\n" +
            "\ta.name as parentReplyName,\n" +
            "\ta.nickname as parentReplyNickname,\n" +
            "\tfr.content as content\n" +
            "FROM\n" +
            "\tmy_forum_reply as fr \n" +
            "LEFT JOIN \n" +
            "\tmy_user as u on fr.user_id = u.id \n" +
            "LEFT JOIN my_user as a on a.id = fr.parent_reply_user_id where fr.forum_id = #{forumId} and fr.type = #{type}")
    public List<GetReplyListVo> getForumReplyById(@Param("forumId") int forumId,@Param("type") String type);

}
