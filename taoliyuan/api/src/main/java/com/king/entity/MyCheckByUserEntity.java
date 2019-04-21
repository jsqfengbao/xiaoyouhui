package com.king.entity;

import lombok.Data;

/**
 * @author hhumhr
 */
@Data
public class MyCheckByUserEntity {
    private Integer id;

    /**
     * my_user_school 表的 主键
     */
    private Integer schoolUserId;

    private Integer schoolParentId;


    private Integer userId;

    private Integer byUserId;

    private Integer checked;

    private String refuseReason;

}
