package com.king.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

/**
 * @author hhumhr
 */
@Data
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class MyForumCommentVO {
    private Integer id;

    private Integer postId;

    private Integer userId;

    private String name;

    private String avatar;

    private String content;

    private Integer replyNum;

    /**
     * 点赞的数量
     */
    private Integer zanNum;

    /**
     * 当前用户是否赞过
     */
    private Integer zaned;


    private Integer floor;

    private Integer parentId;

    private Integer toUserId;

    private String createTime;


    private String toUserName;



}
