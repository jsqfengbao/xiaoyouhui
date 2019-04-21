package com.king.service;

import com.king.dao.MyForumModuleSubclassDao;
import com.king.entity.MyForumModuleSubclassEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service接口
 *
 * @author jsq
 * @email jsqfengbao@qq.com
 * @date 2019-02-22 10:54:21
 */
@Service
public class MyForumModuleSubclassService {

   @Autowired
    private MyForumModuleSubclassDao myForumModuleSubclassDao;

   public List<MyForumModuleSubclassEntity> queryList(Map<String,Object> map){
       return myForumModuleSubclassDao.queryList(map);
   }
}
