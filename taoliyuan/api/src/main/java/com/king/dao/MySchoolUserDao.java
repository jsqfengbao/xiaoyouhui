package com.king.dao;

import com.king.entity.MySchoolUserEntity;
import com.king.entity.MyUserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Dao
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-23 16:57:42
 */
public interface MySchoolUserDao extends BaseDao<MySchoolUserEntity> {

    /**
     * 获取 MySchoolUserEntity
     *
     * @param schoolParentId
     * @param userId
     * @return
     */
    MySchoolUserEntity getOneBySchoolParentAndUserId(@Param("schoolParentId") Integer schoolParentId, @Param("userId") Integer userId);

    /**
     * 通过手机号获取通过审核的校友的Id
     *
     * @param telephoneList
     * @return
     */
    List getCheckedUserIdListByTelephoneList(String[] telephoneList);

    int updateStatusById(@Param("id") Integer id, @Param("status") Integer status);

    int updateStatusAndRefuseReasonById(@Param("id") Integer id, @Param("status") Integer status, @Param("refuseReason") String refuseReason);

    /**
     * 通过id更改状态
     *
     * @param id
     * @param status
     * @return
     */
    int updateStatusAndCheckTypeById(@Param("id") Integer id, @Param("status") Integer status, @Param("checkType") Integer checkType);

    int updateStatusAndCheckTypeAndCertificateNoById(@Param("id") Integer id, @Param("status") Integer status, @Param("checkType") Integer checkType, @Param("certificateNo") String certificateNo);

    int insert(MySchoolUserEntity mySchoolUserEntity);

    List<MyUserEntity> getApplyingUserListBySchoolParentId(Integer schoolParentId);

    List<MyUserEntity> getApplyingUserListBySchoolIdList(List<Integer> schoolIdList);
}
