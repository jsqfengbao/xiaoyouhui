package com.king.entity;


import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author hhumhr
 */
@Data
public class MyForumModuleUserEntity {
    private Long id;

    private Integer userId;

    private Integer moduleId;

    private Integer subModuleId;

    private Integer enabled;
}
