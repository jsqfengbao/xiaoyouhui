package com.king.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.king.dao.MyActivityDao;
import com.king.dao.MyActivityUserDao;
import com.king.entity.MyActivityEntity;
import com.king.entity.MyActivityUserEntity;
import com.king.util.DateUtil;
import com.king.utils.BeanUtils;
import com.king.utils.StringUtils;
import com.king.vo.MyActivityVo;
import com.king.vo.PageVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/15 21:57
 * @Modified By
 **/
@Service
public class MyActivityService {
    @Autowired
    private MyActivityDao myActivityDao;
    @Autowired
    private MyActivityUserDao myActivityUserDao;

    public List<MyActivityEntity> getActivityList(Map<String,Object> map){
        return myActivityDao.queryList(map);
    }
    public int queryTotal(Map<String,Object> map){
        return myActivityDao.queryTotal(map);
    }
    public MyActivityVo getActivityById(@Param("id") int id,int userId){
        MyActivityEntity myActivityEntity =  myActivityDao.queryObject(id);
        MyActivityVo activityVo  = new MyActivityVo();
        BeanUtils.copyProperties(myActivityEntity,activityVo);
        String activityEndTime = myActivityEntity.getActivityEndTime();
        if(StringUtils.isNotEmpty(activityEndTime)){
            String currentTime = DateUtil.date2Str(null,"yyyy-MM-dd HH:mm:ss").toString();
            if((activityEndTime.compareTo(currentTime)) > 0){
                activityVo.setIfOverdue(0);
            }else{
                activityVo.setIfOverdue(1);
            }
        }
        Map<String,Object> map = new HashMap<>();
        map.put("activityId",myActivityEntity.getId());
        List<MyActivityUserEntity> myActivityUserEntityList = myActivityUserDao.queryList(map);
        for(MyActivityUserEntity myActivityUserEntity : myActivityUserEntityList){
            if(myActivityUserEntity.getUserId() == userId && myActivityUserEntity.getEnabled().equals("1")){
                activityVo.setIfAddActivity("1");
                break;
            }
        }
        if(StringUtils.isNullOrEmpty(activityVo.getIfAddActivity())){
            activityVo.setIfAddActivity("0");
        }
        return activityVo;
    }

    public PageVO<MyActivityEntity> getRecommendedActivityList(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        List<MyActivityEntity> recommendedActivityList = myActivityDao.getRecommendedActivityList();
        PageVO<MyActivityEntity> pageVO = new PageVO<>();
        pageVO.setCount(((Page)recommendedActivityList).getTotal());
        pageVO.setData(recommendedActivityList);
        return pageVO;
    }
}
