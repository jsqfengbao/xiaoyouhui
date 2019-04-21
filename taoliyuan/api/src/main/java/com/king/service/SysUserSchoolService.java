package com.king.service;

import com.king.dao.SysUserSchoolDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hhumhr
 */
@Service
public class SysUserSchoolService {
    @Autowired
    private SysUserSchoolDao sysUserSchoolDao;

    List<Integer> getSchoolIdListBySysUserId(Integer adminId) {
        return sysUserSchoolDao.getSchoolIdListBySysUserId(adminId);
    }
}
