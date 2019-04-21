package com.king.vo;

import lombok.Data;

/**
 * @author hhumhr
 */
@Data
public class MyForumPostVO {

    /**
     * 当前用户是否点过赞
     */
    private Integer zaned;

    private Integer userId;
    private String name;
    private String avatar;


    private String subModuleName;




    private Integer id;

    private String title;

    private String forumPic;

    private Integer top;

    private String content;

    private Integer viewNum;

    private Integer zanNum;

    private Integer commentNum;

    private Integer shareNum;

    private String createTime;

    private String updateTime;


}
