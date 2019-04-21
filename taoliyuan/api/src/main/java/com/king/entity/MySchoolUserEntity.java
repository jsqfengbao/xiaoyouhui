package com.king.entity;

import io.swagger.models.auth.In;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;


/**
 * 实体
 * 表名 my_user_school
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-23 16:57:42
 */
@Data
public class MySchoolUserEntity implements Serializable {
    private static final long serialVersionUID = 1L;


    private Integer id;

    private Integer userId;

    private Integer schoolParentId;

    private Integer schoolId;

    private Integer status;

    private Integer adminId;

    private Integer checkType;

    private String certificateNo;

    private String refuseReason;

    private String remark;

    private Integer enabled;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


}
