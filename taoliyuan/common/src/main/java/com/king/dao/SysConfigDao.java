package com.king.dao;

import org.apache.ibatis.annotations.Param;

import com.king.entity.SysConfigEntity;

/**
 * 系统配置信息
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2016年12月4日 下午6:46:16
 */
public interface SysConfigDao extends BaseDao<SysConfigEntity> {

    /**
     * 根据key，查询value
     */
    String queryByKey(String paramKey);

    /**
     * 根据key，更新value
     */
    int updateValueByKey(@Param("key") String key, @Param("value") String value);

}
