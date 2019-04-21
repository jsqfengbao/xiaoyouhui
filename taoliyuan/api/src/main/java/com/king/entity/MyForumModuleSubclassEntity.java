package com.king.entity;

import lombok.Data;

import java.io.Serializable;


/**
 * 实体
 * 表名 my_forum_module_subclass
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 10:54:21
 */
@Data
public class MyForumModuleSubclassEntity implements Serializable {
    private static final long serialVersionUID = 1L;


    private Integer id;

    private Integer moduleId;

    private String name;

    private Integer clickNum;

    private String createTime;

    private String updateTime;

    private String enabled;


}
