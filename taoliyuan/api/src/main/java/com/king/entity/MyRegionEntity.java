package com.king.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;


/**
 * 实体
 * 表名 my_region
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2019-01-01 21:21:34
 */
@Data
public class MyRegionEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Integer id;
    //
    private String regionName;
    //
    private String regionCode;
    //
    private String enabled;
    //
    private String createTime;
    //
    private String updateTime;

    private List<MySchoolEntity> schoolEntityList;

}
