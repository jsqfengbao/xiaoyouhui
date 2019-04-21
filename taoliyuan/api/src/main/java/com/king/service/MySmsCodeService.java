package com.king.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.king.dao.MySmsCodeDao;
import com.king.entity.MySmsCodeEntity;

/**
 * Service实现类
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-07 18:13:17
 */
@Service
public class MySmsCodeService {
    @Autowired
    private MySmsCodeDao mySmsCodeDao;

    public MySmsCodeEntity queryObject(Integer id) {
        return mySmsCodeDao.queryObject(id);
    }

    public MySmsCodeEntity queryByUserId(Integer userId){
        return mySmsCodeDao.queryByUserId(userId);
    }

    public MySmsCodeEntity queryByParam(Integer userId, String mobile){
        return mySmsCodeDao.queryByParam(userId,mobile);
    }

    public List<MySmsCodeEntity> queryList(Map<String, Object> map) {
        return mySmsCodeDao.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return mySmsCodeDao.queryTotal(map);
    }

    public int save(MySmsCodeEntity mySmsCode) {
        return mySmsCodeDao.save(mySmsCode);
    }

    public int update(MySmsCodeEntity mySmsCode) {
        return mySmsCodeDao.update(mySmsCode);
    }

    public int delete(Integer id) {
        return mySmsCodeDao.delete(id);
    }

    public int deleteBatch(Integer[]ids) {
        return mySmsCodeDao.deleteBatch(ids);
    }
}

