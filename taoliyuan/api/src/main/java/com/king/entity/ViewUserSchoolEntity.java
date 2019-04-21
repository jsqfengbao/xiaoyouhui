package com.king.entity;

import java.io.Serializable;


/**
 * VIEW实体
 * 表名 view_user_school
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-24 18:02:17
 */
public class ViewUserSchoolEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    private String userId;

    //姓名
    private String name;
    //
    private String avatar;
    //
    private Integer schoolId;
    //
    private Integer schoolParentId;
    //入学时间
    private String inShool;
    //毕业时间
    private String outShool;

    private String depart;
    //学历
    private String education;
    //纬度
    private Double latitude;
    //经度
    private Double longitude;
    //状态
    private String status;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 设置：姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：姓名
     */
    public String getName() {
        return name;
    }
    /**
     * 设置：
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /**
     * 获取：
     */
    public String getAvatar() {
        return avatar;
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
     * 设置：入学时间
     */
    public void setInShool(String inShool) {
        this.inShool = inShool;
    }

    /**
     * 获取：入学时间
     */
    public String getInShool() {
        return inShool;
    }
    /**
     * 设置：毕业时间
     */
    public void setOutShool(String outShool) {
        this.outShool = outShool;
    }

    /**
     * 获取：毕业时间
     */
    public String getOutShool() {
        return outShool;
    }
    /**
     * 学历
     */
    public void setEducation(String education) {
        this.education = education;
    }

    /**
     * 学历
     */
    public String getEducation() {
        return education;
    }
    /**
     * 设置：纬度
     */
    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    /**
     * 获取：纬度
     */
    public Double getLatitude() {
        return latitude;
    }
    /**
     * 设置：经度
     */
    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    /**
     * 获取：经度
     */
    public Double getLongitude() {
        return longitude;
    }
    /**
     * 设置：状态
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：状态
     */
    public String getStatus() {
        return status;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }
}
