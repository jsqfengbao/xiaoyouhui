package com.king.service;

import com.king.dao.ViewUserSchoolDao;
import com.king.entity.ViewUserSchoolEntity;
import com.king.utils.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/24 18:50
 * @Modified By
 **/
@Service
public class ViewUserSchoolService {

    @Autowired
    private ViewUserSchoolDao viewUserSchoolDao;

    public List<ViewUserSchoolEntity> getUserSchoolListBySchoolParentId(@Param("schoolParentId") int schoolParentId,
                                                                        @Param("status") String status){
        Map<String, Object> map = new HashMap<>();
        map.put("schoolParentId",schoolParentId);
        map.put("status",status);
        return viewUserSchoolDao.queryList(map);
    }

    public List<ViewUserSchoolEntity> getUserSchoolListByPosition(@Param("schoolParentId") int schoolParentId,
                                                                        @Param("status") Integer status){
        Map<String, Object> map = new HashMap<>();
        map.put("schoolParentId",schoolParentId);
        map.put("status",status);
        map.put("latitude","有位置");
        map.put("longitude","有位置");
        return viewUserSchoolDao.queryList(map);
    }

    public List<ViewUserSchoolEntity> getUserSchoolListBySchoolAreaId(@Param("queryName")String queryName,@Param("schoolAreaId") int schoolAreaId,
                                                                      @Param("status") Integer status){
        Map<String, Object> map = new HashMap<>();
        if(StringUtils.isNullOrEmpty(queryName)){
            map.put("schoolAreaId",schoolAreaId);
        }
        map.put("status",status);
        map.put("name",queryName);
        return viewUserSchoolDao.queryList(map);
    }
}
