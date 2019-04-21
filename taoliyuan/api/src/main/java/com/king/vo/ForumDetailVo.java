package com.king.vo;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/2/22 12:40
 * @Modified By
 **/
public class ForumDetailVo {
    private int userId;  //用户ID

    private String name;

    private String nickName;

    private int moduleId;

    private String moduleName;

    private int moduleSubId;

    private String moduleSubName;

    private String forumTitle;

    private List<String> forumPicList;

    private String ifTopic; //是否置顶

    private String forumContent; //帖子内容

    private int clickNum; //点击次数

    private String createTime; //发帖时间

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public int getModuleSubId() {
        return moduleSubId;
    }

    public void setModuleSubId(int moduleSubId) {
        this.moduleSubId = moduleSubId;
    }

    public String getModuleSubName() {
        return moduleSubName;
    }

    public void setModuleSubName(String moduleSubName) {
        this.moduleSubName = moduleSubName;
    }

    public String getForumTitle() {
        return forumTitle;
    }

    public void setForumTitle(String forumTitle) {
        this.forumTitle = forumTitle;
    }

    public List<String> getForumPicList() {
        return forumPicList;
    }

    public void setForumPicList(List<String> forumPicList) {
        this.forumPicList = forumPicList;
    }

    public String getIfTopic() {
        return ifTopic;
    }

    public void setIfTopic(String ifTopic) {
        this.ifTopic = ifTopic;
    }

    public String getForumContent() {
        return forumContent;
    }

    public void setForumContent(String forumContent) {
        this.forumContent = forumContent;
    }

    public int getClickNum() {
        return clickNum;
    }

    public void setClickNum(int clickNum) {
        this.clickNum = clickNum;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
