package com.king.dao;

import com.king.entity.MyUserEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-06 16:45:16
 */
public interface MyUserDao extends BaseDao<MyUserEntity> {

    /**
     * 根据微信ID查询
     * @param openId
     * @return
     */
    MyUserEntity queryByOpenId(@Param("openId") String openId);
}
