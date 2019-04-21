package com.king.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_forum_reply
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 20:00:12
 */
public class MyForumReplyEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //帖子ID
    private Integer forumId;
    //评论人ID
    private Integer userId;
    //评论内容
    private String content;
    //类型：1点赞2评论
    private String type;
    //评论贴父ID
    private Integer parentReplyId;
    //评论帖父用户 ID
    private Integer parentReplyUserId;
    //
    private String createTime;
    //
    private String updateTime;
    //
    private String enabled;

    /**
     * 设置：
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public Integer getId() {
        return id;
    }
    /**
     * 设置：帖子ID
     */
    public void setForumId(Integer forumId) {
        this.forumId = forumId;
    }

    /**
     * 获取：帖子ID
     */
    public Integer getForumId() {
        return forumId;
    }
    /**
     * 设置：评论人ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：评论人ID
     */
    public Integer getUserId() {
        return userId;
    }
    /**
     * 设置：评论内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取：评论内容
     */
    public String getContent() {
        return content;
    }
    /**
     * 设置：评论贴父ID
     */
    public void setParentReplyId(Integer parentReplyId) {
        this.parentReplyId = parentReplyId;
    }

    /**
     * 获取：评论贴父ID
     */
    public Integer getParentReplyId() {
        return parentReplyId;
    }
    /**
     * 设置：评论帖父用户 ID
     */
    public void setParentReplyUserId(Integer parentReplyUserId) {
        this.parentReplyUserId = parentReplyUserId;
    }

    /**
     * 获取：评论帖父用户 ID
     */
    public Integer getParentReplyUserId() {
        return parentReplyUserId;
    }
    /**
     * 设置：
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取：
     */
    public String getCreateTime() {
        return createTime;
    }
    /**
     * 设置：
     */
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取：
     */
    public String getUpdateTime() {
        return updateTime;
    }
    /**
     * 设置：
     */
    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    /**
     * 获取：
     */
    public String getEnabled() {
        return enabled;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
