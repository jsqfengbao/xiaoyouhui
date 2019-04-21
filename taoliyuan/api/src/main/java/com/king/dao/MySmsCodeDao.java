package com.king.dao;

import com.king.entity.MySmsCodeEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-07 18:13:17
 */
public interface MySmsCodeDao extends BaseDao<MySmsCodeEntity> {

    MySmsCodeEntity queryByUserId(Integer userId);

    MySmsCodeEntity queryByParam(@Param("userId") Integer userId, @Param("mobile")  String mobile);
}
