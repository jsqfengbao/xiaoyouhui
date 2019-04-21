package com.king.dao;

import com.king.entity.TokenEntity;
import org.apache.ibatis.annotations.Param;

/**
 * 用户Token
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 15:22:07
 */
public interface TokenDao extends BaseDao<TokenEntity> {

    TokenEntity queryByUserId(@Param("userId") Integer userId);

    TokenEntity queryByToken(@Param("token") String token);

}
