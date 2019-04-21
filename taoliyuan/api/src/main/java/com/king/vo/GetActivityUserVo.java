package com.king.vo;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/23 16:42
 * @Modified By
 **/
public class GetActivityUserVo {

    private int activityId;

    private int userId;

    private String name;

    private String avatar;

    public int getActivityId() {
        return activityId;
    }

    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "GetActivityUserVo{" +
                "activityId=" + activityId +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
