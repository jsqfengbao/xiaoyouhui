package com.king.dao;

import com.king.entity.MyRegionEntity;

import java.util.List;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2019-01-01 21:21:34
 */
public interface MyRegionDao extends BaseDao<MyRegionEntity> {
    List<MyRegionEntity> queryRegionWithSchoolList(Integer schoolId);
}
