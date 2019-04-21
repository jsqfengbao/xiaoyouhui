package com.king.service;

import com.king.dao.MyForumReplyDao;
import com.king.dao.annotation.IMyForumReplyDao;
import com.king.entity.MyForumReplyEntity;
import com.king.vo.GetPriseListVo;
import com.king.vo.GetReplyListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service接口
 *
 * @author william_w
 * @email 2366207000@qq.com
 * @date 2019-02-22 20:00:12
 */
@Service
public class MyForumReplyService {

    @Autowired
    private MyForumReplyDao myForumReplyDao;
    @Autowired
    private IMyForumReplyDao iMyForumReplyDao;

    public List<GetPriseListVo> getPriseList(int forumId, String type){
        return iMyForumReplyDao.getForumPriseById(forumId,type);
    }

    public List<MyForumReplyEntity> getForumReplyList(Map<String,Object> map){
        return myForumReplyDao.queryList(map);
    }

    public List<GetReplyListVo> getForumReplyList(int forumId,String type){
        return iMyForumReplyDao.getForumReplyById(forumId,type);
    }

    public int saveForumReply(MyForumReplyEntity forumReplyEntity){
        return myForumReplyDao.save(forumReplyEntity);
    }
}
