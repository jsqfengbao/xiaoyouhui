package com.king.dao;

import com.king.entity.MyAlumniAdminEntity;

import java.util.List;
import java.util.Map;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-27 12:38:06
 */
public interface MyAlumniAdminDao extends BaseDao<MyAlumniAdminEntity> {

    List<MyAlumniAdminEntity> queryListBySchoolIdAndParentId(Map<String, Object> map);
}
