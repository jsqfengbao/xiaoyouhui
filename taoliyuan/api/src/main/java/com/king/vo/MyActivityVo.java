package com.king.vo;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/23 19:34
 * @Modified By
 **/
public class MyActivityVo {
    //
    private Integer id;

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
    //0：无效，1：有效
    private String enabled;
    //创建时间
    private String createTime;
    //更新时间
    private String updateTime;
    //是否过期
    private Integer ifOverdue;
    //是否参加该活动
    private String ifAddActivity;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkTelephone() {
        return linkTelephone;
    }

    public void setLinkTelephone(String linkTelephone) {
        this.linkTelephone = linkTelephone;
    }

    public String getActivityLogo() {
        return activityLogo;
    }

    public void setActivityLogo(String activityLogo) {
        this.activityLogo = activityLogo;
    }

    public String getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(String activityTime) {
        this.activityTime = activityTime;
    }

    public String getActivityEndTime() {
        return activityEndTime;
    }

    public void setActivityEndTime(String activityEndTime) {
        this.activityEndTime = activityEndTime;
    }

    public String getActivityPlace() {
        return activityPlace;
    }

    public void setActivityPlace(String activityPlace) {
        this.activityPlace = activityPlace;
    }

    public String getIsRecommended() {
        return isRecommended;
    }

    public void setIsRecommended(String isRecommended) {
        this.isRecommended = isRecommended;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getIfOverdue() {
        return ifOverdue;
    }

    public void setIfOverdue(Integer ifOverdue) {
        this.ifOverdue = ifOverdue;
    }

    public String getIfAddActivity() {
        return ifAddActivity;
    }

    public void setIfAddActivity(String ifAddActivity) {
        this.ifAddActivity = ifAddActivity;
    }
}
