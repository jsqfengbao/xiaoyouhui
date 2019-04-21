package com.king.enums;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/2/23 14:10
 * @Modified By
 **/
@Description("评论类型")
public enum ForumReplyEnum {
    /** 1，点赞**/
    praise("1","点赞"),
    /** 2,评论**/
    reply("2","评论");


    // 成员变量
    private String value; // value
    private String desc; // 描述

    // 构造方法
    private ForumReplyEnum(String val, String desc) {
        this.value = val;
        this.desc = desc;
    }

    public static Map<String, String> getDescValueMap() {
        ForumReplyEnum[] loops = ForumReplyEnum.values();
        Map<String, String> map = new LinkedHashMap<String, String>();
        for (ForumReplyEnum loop : loops) {
            map.put(loop.getDesc(), loop.getValue());
        }
        return map;
    }

    /**
     * 通过value获取对象
     */
    public static ForumReplyEnum getMessageType(String val) {
        for (ForumReplyEnum c : ForumReplyEnum.values()) {
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
