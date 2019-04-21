package com.king.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_activity
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-15 21:55:02
 */
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class MyActivityEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;

    private Integer schoolParentId;
    //关联school表主键
    private Integer schoolId;
    //标题
    private String title;

    //作者
    private String author;
    //活动内容
    private String content;
    //联系人
    private String linkName;
    //联系人电话
    private String linkTelephone;
    //活动图片logo
    private String activityLogo;
    //活动时间
    private String activityTime;
    //活动结束时间
    private String activityEndTime;
    //活动地点
    private String activityPlace;

    //是否推荐
    private String isRecommended;
    //0：无效，1:有效
    private String isDelete;
    //0：无效，1：有效
    private String enabled;
    //创建时间
    private String createTime;
    //更新时间
    private String updateTime;

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
     * 设置：关联school表主键
     */
    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    /**
     * 获取：关联school表主键
     */
    public Integer getSchoolId() {
        return schoolId;
    }
    /**
     * 设置：标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取：标题
     */
    public String getTitle() {
        return title;
    }
    /**
     * 设置：活动内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取：活动内容
     */
    public String getContent() {
        return content;
    }
    /**
     * 设置：联系人
     */
    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    /**
     * 获取：联系人
     */
    public String getLinkName() {
        return linkName;
    }
    /**
     * 设置：联系人电话
     */
    public void setLinkTelephone(String linkTelephone) {
        this.linkTelephone = linkTelephone;
    }

    /**
     * 获取：联系人电话
     */
    public String getLinkTelephone() {
        return linkTelephone;
    }
    /**
     * 设置：活动图片logo
     */
    public void setActivityLogo(String activityLogo) {
        this.activityLogo = activityLogo;
    }

    /**
     * 获取：活动图片logo
     */
    public String getActivityLogo() {
        return activityLogo;
    }
    /**
     * 设置：活动时间
     */
    public void setActivityTime(String activityTime) {
        this.activityTime = activityTime;
    }

    /**
     * 获取：活动时间
     */
    public String getActivityTime() {
        return activityTime;
    }
    /**
     * 设置：活动地点
     */
    public void setActivityPlace(String activityPlace) {
        this.activityPlace = activityPlace;
    }

    /**
     * 获取：活动地点
     */
    public String getActivityPlace() {
        return activityPlace;
    }
    /**
     * 设置：0：无效，1:有效
     */
    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 获取：0：无效，1:有效
     */
    public String getIsDelete() {
        return isDelete;
    }
    /**
     * 设置：0：无效，1：有效
     */
    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    /**
     * 获取：0：无效，1：有效
     */
    public String getEnabled() {
        return enabled;
    }
    /**
     * 设置：创建时间
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取：创建时间
     */
    public String getCreateTime() {
        return createTime;
    }
    /**
     * 设置：更新时间
     */
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取：更新时间
     */
    public String getUpdateTime() {
        return updateTime;
    }

    public Integer getSchoolParentId() {
        return schoolParentId;
    }

    public void setSchoolParentId(Integer schoolParentId) {
        this.schoolParentId = schoolParentId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsRecommended() {
        return isRecommended;
    }

    public void setIsRecommended(String isRecommended) {
        this.isRecommended = isRecommended;
    }

    public String getActivityEndTime() {
        return activityEndTime;
    }

    public void setActivityEndTime(String activityEndTime) {
        this.activityEndTime = activityEndTime;
    }
}
