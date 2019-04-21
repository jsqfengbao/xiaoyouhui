package com.king.dao;

import java.util.List;

/**
 * @author hhumhr
 */
public interface SysUserSchoolDao {
    List<Integer> getSchoolIdListBySysUserId(Integer sysUserId);
}
