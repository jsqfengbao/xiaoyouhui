package com.king.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.king.dao.PayWayDao;
import com.king.entity.PayWayEntity;
import com.king.service.PayWayService;

/**
 * Service实现类
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-05-24 18:01:14
 */
@Service("payWayService")
public class PayWayServiceImpl implements PayWayService {
    @Autowired
    private PayWayDao payWayDao;

    @Override
    public PayWayEntity queryObject(String id) {
        return payWayDao.queryObject(id);
    }

    @Override
    public List<PayWayEntity> queryList(Map<String, Object> map) {
        return payWayDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return payWayDao.queryTotal(map);
    }

    @Override
    public int save(PayWayEntity payWay) {
        return payWayDao.save(payWay);
    }

    @Override
    public int update(PayWayEntity payWay) {
        return payWayDao.update(payWay);
    }

    @Override
    public int delete(String id) {
        return payWayDao.delete(id);
    }

    @Override
    public int deleteBatch(String[]ids) {
        return payWayDao.deleteBatch(ids);
    }
}
