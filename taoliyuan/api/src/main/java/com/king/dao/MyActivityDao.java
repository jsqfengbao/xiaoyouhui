package com.king.dao;

import com.king.entity.MyActivityEntity;

import java.util.List;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-15 21:55:02
 */
public interface MyActivityDao extends BaseDao<MyActivityEntity> {

    /**
     * 获取推荐的活动分页列表
     * @return
     */
    List<MyActivityEntity> getRecommendedActivityList();

}
