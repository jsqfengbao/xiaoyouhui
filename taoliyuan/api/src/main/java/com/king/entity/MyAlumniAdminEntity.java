package com.king.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_alumni_admin
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-27 12:38:06
 */
public class MyAlumniAdminEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;

    private Integer schoolParentId;
    //
    private Integer schoolId;
    //
    private String schoolName;
    //
    private String adminName;
    //
    private String adminPhone;
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
    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    /**
     * 获取：
     */
    public String getSchoolName() {
        return schoolName;
    }
    /**
     * 设置：
     */
    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    /**
     * 获取：
     */
    public String getAdminName() {
        return adminName;
    }
    /**
     * 设置：
     */
    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }

    /**
     * 获取：
     */
    public String getAdminPhone() {
        return adminPhone;
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

    public Integer getSchoolParentId() {
        return schoolParentId;
    }

    public void setSchoolParentId(Integer schoolParentId) {
        this.schoolParentId = schoolParentId;
    }
}
