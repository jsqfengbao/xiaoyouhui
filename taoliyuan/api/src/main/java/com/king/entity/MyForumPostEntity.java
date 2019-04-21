package com.king.entity;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;


/**
 * 实体
 * 表名 my_forum
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 10:54:21
 */
@Data
public class MyForumPostEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    private MyUserEntity myUserEntity;
    private MyForumModuleSubclassEntity myForumModuleSubclassEntity;



    private Integer id;
    private Integer userId;

    private Integer moduleId;

    private Integer subModuleId;

    private String title;

    private String imgs;

    private Integer top;

    private String content;

    private Integer viewNum;

    private Integer zanNum;

    private Integer shareNum;

    private Integer commentNum;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private String enabled;


}
