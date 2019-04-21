package com.king.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_approval
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-23 17:08:53
 */
public class MyApprovalEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //
    private Integer userId;
    //
    private Integer approvalAdminId;
    //审批状态
    private String status;
    //
    private String refusedReason;
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
    public void setApprovalAdminId(Integer approvalAdminId) {
        this.approvalAdminId = approvalAdminId;
    }

    /**
     * 获取：
     */
    public Integer getApprovalAdminId() {
        return approvalAdminId;
    }
    /**
     * 设置：审批状态
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取：审批状态
     */
    public String getStatus() {
        return status;
    }
    /**
     * 设置：
     */
    public void setRefusedReason(String refusedReason) {
        this.refusedReason = refusedReason;
    }

    /**
     * 获取：
     */
    public String getRefusedReason() {
        return refusedReason;
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
