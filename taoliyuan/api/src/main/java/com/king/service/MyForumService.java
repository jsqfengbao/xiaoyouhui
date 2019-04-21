package com.king.service;

import com.alibaba.fastjson.JSONObject;
import com.king.dao.MyForumDao;
import com.king.dao.MyForumModuleDao;
import com.king.dao.MyForumModuleSubclassDao;
import com.king.dao.annotation.IMyForumDao;
import com.king.entity.MyForumPostEntity;
import com.king.entity.MyForumModuleEntity;
import com.king.entity.MyForumModuleSubclassEntity;
import com.king.utils.StringUtils;
import com.king.vo.ForumDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service接口
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 10:54:21
 */
@Service
public class MyForumService {

    @Autowired
    private MyForumDao myForumDao;
    @Autowired
    private IMyForumDao iMyForumDao;
    @Autowired
    private MyForumModuleDao myForumModuleDao;
    @Autowired
    private MyForumModuleSubclassDao myForumModuleSubclassDao;

    public List<MyForumPostEntity> queryList(Map<String,Object> map){
        return myForumDao.queryList(map);
    }
    public int queryTotal(Map<String,Object> map){
        return myForumDao.queryTotal();
    }
    public MyForumPostEntity queryObject(Object id){
        return myForumDao.queryObject(id);
    }
    public ForumDetailVo queryDetailByObject(int id){
        JSONObject jsonObject = iMyForumDao.getForumDetailById(id);
        ForumDetailVo forumDetailVo = new ForumDetailVo();
        if(!StringUtils.isNullOrEmpty(jsonObject.getInteger("click_num"))){
            forumDetailVo.setClickNum(jsonObject.getInteger("click_num"));
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("create_time"))){
            forumDetailVo.setCreateTime(jsonObject.getString("create_time"));
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("forum_content"))){
            forumDetailVo.setForumContent(jsonObject.getString("forum_content"));
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("forum_pic"))){
            List<String> picList = Arrays.asList(jsonObject.getString("forum_pic").split(","));
            forumDetailVo.setForumPicList(picList);
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("forum_title"))){
            forumDetailVo.setForumTitle(jsonObject.getString("forum_title"));
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("if_topic"))){
            forumDetailVo.setIfTopic(jsonObject.getString("if_topic"));
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("nickname"))){
            forumDetailVo.setNickName(jsonObject.getString("nickname"));
        }
        if(!StringUtils.isNullOrEmpty(jsonObject.getString("create_time"))){
            forumDetailVo.setCreateTime(jsonObject.getString("create_time"));
        }
        int moduleId = jsonObject.getInteger("module_id");
        int moduleSubId = jsonObject.getInteger("module_sub_id");
        forumDetailVo.setModuleId(moduleId);
        forumDetailVo.setModuleSubId(moduleSubId);
        forumDetailVo.setModuleName(queryAllModule().get(moduleId));
        forumDetailVo.setModuleSubName(queryAllModuleSubclass().get(moduleSubId));
        return forumDetailVo;
    }
    private Map<String,String> queryAllModule(){
        Map<String,String> result = new HashMap<>();
        Map<String,Object> map = new HashMap<>();
        map.put("enabled","1");
        List<MyForumModuleEntity> myForumModuleEntityList = myForumModuleDao.queryList(map);
        for(MyForumModuleEntity moduleEntity : myForumModuleEntityList){
            result.put(moduleEntity.getId()+"",moduleEntity.getName());
        }
        return result;
    }
    private Map<String,String> queryAllModuleSubclass(){
        Map<String,String> result = new HashMap<>();
        Map<String,Object> map = new HashMap<>();
        map.put("enabled","1");
        List<MyForumModuleSubclassEntity> myForumModuleEntityList = myForumModuleSubclassDao.queryList(map);
        for(MyForumModuleSubclassEntity moduleEntity : myForumModuleEntityList){
            result.put(moduleEntity.getId()+"",moduleEntity.getName());
        }
        return result;
    }

    public int saveForum(MyForumPostEntity forumEntity){
        return myForumDao.save(forumEntity);
    }
}
