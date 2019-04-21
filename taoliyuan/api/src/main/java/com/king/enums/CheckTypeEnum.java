package com.king.enums;

import lombok.Getter;

/**
 * @author hhumhr
 */
public enum CheckTypeEnum {
    /**
     *
     */
    BY_CERTIFICATE_NO(1, "证书编号"), BY_ALUMNI(2, "校友推荐"), BY_ADMIN(3, "管理员电话审核");


    @Getter
    int value;

    @Getter
    String msg;

    CheckTypeEnum(int value, String msg) {
        this.value = value;
        this.msg = msg;
    }
}