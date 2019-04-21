package com.king.enums;

/**
 * @author hhumhr
 */
public enum UploadImageTypeEnum {
    /**
     *
     */
    FORUM(1, "论坛"), ACTIVITY(2, "活动");

    int code;
    String desc;

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    UploadImageTypeEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }}
