package com.king.dao;

import com.king.entity.MySchoolEntity;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-15 15:13:52
 */
public interface MySchoolDao extends BaseDao<MySchoolEntity> {


    /**
     *
     * @param schoolId
     * @return
     */
    Integer getSchoolParentIdBySchoolId(Integer schoolId);
//    /**
//     * 获取学校列表信息
//     * @param schoolType
//     * @return
//     */
//    MySchoolEntity getParentSchool(@Param("schoolType") String schoolType);
//
//    /**
//     * 根据学校ID获取列表信息
//     * @param parentSchoolId
//     * @return
//     */
//    MySchoolEntity getSchoolArea(@Param("parentSchoolId") String parentSchoolId);


}
