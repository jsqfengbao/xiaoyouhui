package com.king.entity;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_sms_code
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-07 18:13:17
 */
public class MySmsCodeEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //
    private Integer userId;
    //
    private String phoneNum;
    //
    private String smsCode;
    //
    private String createTime;
    //是否使用过。0：未使用，1已使用
    private String used;

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
    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    /**
     * 获取：
     */
    public String getPhoneNum() {
        return phoneNum;
    }
    /**
     * 设置：
     */
    public void setSmsCode(String smsCode) {
        this.smsCode = smsCode;
    }

    /**
     * 获取：
     */
    public String getSmsCode() {
        return smsCode;
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
     * 设置：是否使用过。0：未使用，1已使用
     */
    public void setUsed(String used) {
        this.used = used;
    }

    /**
     * 获取：是否使用过。0：未使用，1已使用
     */
    public String getUsed() {
        return used;
    }
}
