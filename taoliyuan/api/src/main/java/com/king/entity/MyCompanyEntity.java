package com.king.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_company
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-16 16:07:55
 */
public class MyCompanyEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //
    private Integer schoolParentId;
    //
    private Integer schoolId;
    //公司名
    private String companyName;
    //
    private String content;
    //
    private String description;
    //
    private String link1Name;
    //
    private String link1Telephone;
    //
    private String link2Telephone;
    //
    private String link2Name;
    //
    private String isDelete;
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
     * 设置：公司名
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * 获取：公司名
     */
    public String getCompanyName() {
        return companyName;
    }
    /**
     * 设置：
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取：
     */
    public String getContent() {
        return content;
    }
    /**
     * 设置：
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取：
     */
    public String getDescription() {
        return description;
    }
    /**
     * 设置：
     */
    public void setLink1Name(String link1Name) {
        this.link1Name = link1Name;
    }

    /**
     * 获取：
     */
    public String getLink1Name() {
        return link1Name;
    }
    /**
     * 设置：
     */
    public void setLink1Telephone(String link1Telephone) {
        this.link1Telephone = link1Telephone;
    }

    /**
     * 获取：
     */
    public String getLink1Telephone() {
        return link1Telephone;
    }
    /**
     * 设置：
     */
    public void setLink2Telephone(String link2Telephone) {
        this.link2Telephone = link2Telephone;
    }

    /**
     * 获取：
     */
    public String getLink2Telephone() {
        return link2Telephone;
    }
    /**
     * 设置：
     */
    public void setLink2Name(String link2Name) {
        this.link2Name = link2Name;
    }

    /**
     * 获取：
     */
    public String getLink2Name() {
        return link2Name;
    }
    /**
     * 设置：
     */
    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 获取：
     */
    public String getIsDelete() {
        return isDelete;
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
}
