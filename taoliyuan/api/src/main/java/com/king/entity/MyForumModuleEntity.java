package com.king.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;


/**
 * 实体
 * 表名 my_forum_module
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 10:54:21
 */
@Data
public class MyForumModuleEntity implements Serializable {
    private static final long serialVersionUID = 1L;


    private Integer id;

    private String name;

    private String moduleIcon;

    private Integer clickNum;

    private String createTime;

    private String updateTime;

    private String enabled;

    private List<MyForumModuleSubclassEntity> myForumModuleSubclassEntityList;


}
