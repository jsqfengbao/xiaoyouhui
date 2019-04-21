package com.king.entity;

import java.io.Serializable;


/**
 * 用户申请表实体
 * 表名 my_user_apply
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2019-01-05 21:59:37
 */
public class MyUserApplyEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //
    private Integer userId;
    //
    private Integer schoolId;
    //
    private Integer schoolParentId;
    //
    private String enabled;
    //
    private String createTime;
    //
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
     * 设置：
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取：
     */
    public Integer getUserId() {
        return userId;
    }
    /**
     * 设置：
     */
    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    /**
     * 获取：
     */
    public Integer getSchoolId() {
        return schoolId;
    }
    /**
     * 设置：
     */
    public void setSchoolParentId(Integer schoolParentId) {
        this.schoolParentId = schoolParentId;
    }

    /**
     * 获取：
     */
    public Integer getSchoolParentId() {
        return schoolParentId;
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

    @Override
    public String toString() {
        return "MyUserApplyEntity{" +
                "id=" + id +
                ", userId=" + userId +
                ", schoolId=" + schoolId +
                ", schoolParentId=" + schoolParentId +
                ", enabled='" + enabled + '\'' +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }
}
