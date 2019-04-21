package com.king.enums;
import java.util.LinkedHashMap;
import java.util.Map;
/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/15 20:54
 * @Modified By
 * 用户状态
 **/
@Description("记录当前状态")
public enum UserStatusEnum {
    /** 0，未填写个人信息**/
    NoInput(0, "未填写个人信息"),
    /** 1-审批中**/
    APPLYING(1, "审批中"),
    /** 2-有效**/
    APPLIED(2, "有效"),
    /** 3-修改信息，重新提交**/
    NEED_EDIT(3,"修改后重新提交"),
    /** 4-拒绝**/
    REFUSED(4,"拒绝");


    private Integer value;
    private String desc;

    UserStatusEnum(Integer val, String desc) {
        this.value = val;
        this.desc = desc;
    }

//    public static Map<String, String> getDescValueMap() {
//        UserStatusEnum[] loops = UserStatusEnum.values();
//        Map<String, String> map = new LinkedHashMap<String, String>();
//        for (UserStatusEnum loop : loops) {
//            map.put(loop.getDesc(), loop.getValue());
//        }
//        return map;
//    }

    /**
     * 通过value获取对象
     */
//    public static UserStatusEnum getMessageType(String val) {
//        for (UserStatusEnum c : UserStatusEnum.values()) {
//            if (c.getValue().equals(val)) {
//                return c;
//            }
//        }
//        return null;
//    }

    public Integer getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

}

