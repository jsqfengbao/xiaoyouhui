package com.king.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author hhumhr
 */
@Data
public class MyForumCommentEntity {



    private MyUserEntity myUserEntity;

    private String toUserName;


    private Integer id;

    private Integer postId;

    private Integer userId;

    private Integer replyNum;

    private Integer zanNum;

    private Integer floor;

    private String content;

    private Integer parentId;

    private Integer toUserId;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
