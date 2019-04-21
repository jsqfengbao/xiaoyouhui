package com.king.enums;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/23 20:30
 * @Modified By
 **/
@Description("记录当前状态")
public enum AdviceTypeEnum {
    /** 0，建议**/
    advice("0","建议"),
    /** 1,问题**/
    question("1","问题");


    // 成员变量
    private String value; // value
    private String desc; // 描述

    // 构造方法
    private AdviceTypeEnum(String val, String desc) {
        this.value = val;
        this.desc = desc;
    }

    public static Map<String, String> getDescValueMap() {
        AdviceTypeEnum[] loops = AdviceTypeEnum.values();
        Map<String, String> map = new LinkedHashMap<String, String>();
        for (AdviceTypeEnum loop : loops) {
            map.put(loop.getDesc(), loop.getValue());
        }
        return map;
    }

    /**
     * 通过value获取对象
     */
    public static AdviceTypeEnum getMessageType(String val) {
        for (AdviceTypeEnum c : AdviceTypeEnum.values()) {
            if (c.getValue().equals(val)) {
                return c;
            }
        }
        return null;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

}
