package com.king.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_school
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-15 15:13:52
 */
public class MySchoolEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //
    private Integer parentId;

    private Integer regionId;
    //
    private String schoolName;
    //排序号
    private Integer orderNum;
    //0：父学校,1:子学校
    private String schoolType;

    //0：无效，1:有效
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
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 获取：
     */
    public Integer getParentId() {
        return parentId;
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
     * 设置：排序号
     */
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * 获取：排序号
     */
    public Integer getOrderNum() {
        return orderNum;
    }
    /**
     * 设置：0：父学校,1:子学校
     */
    public void setSchoolType(String schoolType) {
        this.schoolType = schoolType;
    }

    /**
     * 获取：0：父学校,1:子学校
     */
    public String getSchoolType() {
        return schoolType;
    }
    /**
     * 设置：0：无效，1:有效
     */
    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    /**
     * 获取：0：无效，1:有效
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

    public Integer getRegionId() {
        return regionId;
    }

    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }
}
