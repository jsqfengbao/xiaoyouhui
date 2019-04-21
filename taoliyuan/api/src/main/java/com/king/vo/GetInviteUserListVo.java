package com.king.vo;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/29 17:25
 * @Modified By
 **/
public class GetInviteUserListVo {
    private int userId;

    private int schoolId;

    private String status;

    private String enabled;

    private String name;

    private String avatar;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(int schoolId) {
        this.schoolId = schoolId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
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
        return "GetInviteUserListVo{" +
                "userId=" + userId +
                ", schoolId=" + schoolId +
                ", status='" + status + '\'' +
                ", enabled='" + enabled + '\'' +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
