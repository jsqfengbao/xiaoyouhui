package com.king.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.king.dao.MyForumCommentDao;
import com.king.dao.MyForumCommentZanUserDao;
import com.king.dao.MyForumPostDao;
import com.king.entity.MyForumCommentEntity;
import com.king.entity.MyForumCommentZanUserEntity;
import com.king.entity.MyUserEntity;
import com.king.util.DateTimeUtil;
import com.king.vo.MyForumCommentVO;
import com.king.vo.PageVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author hhumhr
 */
@Service
public class MyForumCommentService {

    @Resource
    private MyForumCommentDao myForumCommentDao;

    @Resource
    private MyForumPostDao myForumPostDao;

    @Resource
    private MyForumCommentZanUserDao myForumCommentZanUserDao;

    @Transactional
    public MyForumCommentVO saveComment(MyUserEntity myUserEntity, Integer postId, String content) {

        Integer floor = myForumCommentDao.getMaxFloorByPostId(postId);
        if (floor == null) {
            floor = 1;
        } else {
            floor += 1;
        }

        MyForumCommentEntity myForumCommentEntity = new MyForumCommentEntity();
        myForumCommentEntity.setPostId(postId);
        myForumCommentEntity.setUserId(myUserEntity.getId());
        myForumCommentEntity.setContent(content);
        myForumCommentEntity.setFloor(floor);
        myForumCommentDao.saveComment(myForumCommentEntity);

        //文章评论数加1
        myForumPostDao.increaseCommentNum(postId);

        MyForumCommentVO myForumCommentVO = new MyForumCommentVO();
        myForumCommentVO.setId(myForumCommentEntity.getId());
        myForumCommentVO.setContent(content);
        myForumCommentVO.setPostId(postId);
        myForumCommentVO.setFloor(floor);

        myForumCommentVO.setUserId(myUserEntity.getId());
        myForumCommentVO.setReplyNum(0);
        myForumCommentVO.setZanNum(0);
        myForumCommentVO.setName(myUserEntity.getName());
        myForumCommentVO.setAvatar(myUserEntity.getAvatar());
        myForumCommentVO.setCreateTime(DateTimeUtil.RIGHT_NOW);
        return myForumCommentVO;
    }
    @Transactional
    public MyForumCommentVO saveCommentReply(MyUserEntity myUserEntity, Integer postId,Integer commentId,Integer toUserId, String toUserName,String content){
        MyForumCommentEntity myForumCommentEntity = new MyForumCommentEntity();
        myForumCommentEntity.setPostId(postId);
        myForumCommentEntity.setUserId(myUserEntity.getId());
        myForumCommentEntity.setContent(content);
        myForumCommentEntity.setToUserId(toUserId);
        myForumCommentEntity.setParentId(commentId);

        myForumCommentDao.saveCommentReply(myForumCommentEntity);
        //文章评论数加1
        myForumPostDao.increaseCommentNum(postId);
        // 评论回复数加一
        myForumCommentDao.increaseReplyNum(commentId);


        MyForumCommentVO myForumCommentVO = new MyForumCommentVO();
        myForumCommentVO.setId(myForumCommentEntity.getId());
        myForumCommentVO.setContent(content);
        myForumCommentVO.setPostId(postId);
        myForumCommentVO.setUserId(myUserEntity.getId());
        myForumCommentVO.setToUserId(toUserId);
        myForumCommentVO.setToUserName(toUserName);
        myForumCommentVO.setZanNum(0);
        myForumCommentVO.setName(myUserEntity.getName());
        myForumCommentVO.setAvatar(myUserEntity.getAvatar());
        myForumCommentVO.setCreateTime(DateTimeUtil.RIGHT_NOW);
        return myForumCommentVO;
    }


    public PageVO getCommentListByPostId(Integer userId, Integer postId, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<MyForumCommentEntity> commentList = myForumCommentDao.getCommentListByPostId(postId);
        List<MyForumCommentVO> myForumCommentVOList = new ArrayList<>();
        List<Integer> zanedCommentIdList = getZanedCommentIdList(userId, commentList);


        for (MyForumCommentEntity comment : commentList) {
            MyForumCommentVO myForumCommentVO = assembleMyForumCommentVOForList(zanedCommentIdList, comment);

            myForumCommentVOList.add(myForumCommentVO);
        }

        PageVO<MyForumCommentVO> pageVO = new PageVO<>();
        pageVO.setData(myForumCommentVOList);
        pageVO.setCount(((Page) commentList).getTotal());
        return pageVO;
    }

    public PageVO getCommentReplyListByCommentId(Integer userId, Integer commentId, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<MyForumCommentEntity> commentList = myForumCommentDao.getCommentReplyListByCommentId(commentId);
        List<MyForumCommentVO> myForumCommentVOList = new ArrayList<>();
        List<Integer> zanedCommentIdList = getZanedCommentIdList(userId, commentList);


        for (MyForumCommentEntity comment : commentList) {
            MyForumCommentVO myForumCommentVO = assembleMyForumCommentVOForList(zanedCommentIdList, comment);
            myForumCommentVO.setToUserId(comment.getToUserId());
            myForumCommentVO.setToUserName(comment.getToUserName());
            myForumCommentVOList.add(myForumCommentVO);
        }

        PageVO<MyForumCommentVO> pageVO = new PageVO<>();
        pageVO.setData(myForumCommentVOList);
        pageVO.setCount(((Page) commentList).getTotal());
        return pageVO;


    }

    private MyForumCommentVO assembleMyForumCommentVOForList(List<Integer> zanedCommentIdList, MyForumCommentEntity comment) {
        MyForumCommentVO myForumCommentVO = assembleMyForumCommentVO(comment);
        myForumCommentVO.setZaned(0);
        for (Integer id : zanedCommentIdList) {
            if (id.equals(comment.getId())) {
                myForumCommentVO.setZaned(1);
                break;
            }
        }
        return myForumCommentVO;
    }

    private MyForumCommentVO assembleMyForumCommentVO(MyForumCommentEntity comment) {
        MyForumCommentVO myForumCommentVO = new MyForumCommentVO();
        myForumCommentVO.setId(comment.getId());
        myForumCommentVO.setContent(comment.getContent());
        myForumCommentVO.setPostId(comment.getPostId());
        myForumCommentVO.setReplyNum(comment.getReplyNum());
        myForumCommentVO.setZanNum(comment.getZanNum());
        myForumCommentVO.setFloor(comment.getFloor());
        myForumCommentVO.setUserId(comment.getUserId());
        myForumCommentVO.setName(comment.getMyUserEntity().getName());
        myForumCommentVO.setAvatar(comment.getMyUserEntity().getAvatar());
        myForumCommentVO.setCreateTime(DateTimeUtil.toHumanDateTimeStr(comment.getCreateTime()));
        return myForumCommentVO;
    }

    private List<Integer> getZanedCommentIdList(Integer userId, List<MyForumCommentEntity> commentList) {
        List<Integer> idList = new ArrayList<>();
        for (MyForumCommentEntity comment : commentList) {
            if (comment.getZanNum() > 0) {
                idList.add(comment.getId());
            }
        }
        List<Integer> zanedCommentIdList = new ArrayList<>();
        if (idList.size() > 0) {
            zanedCommentIdList = myForumCommentDao.getZanedCommentIdListInSelectedCommentIdListByUserId(idList, userId);
        }
        return zanedCommentIdList;
    }


    @Transactional(rollbackFor = Exception.class)
    public boolean zan(Integer userId, Integer commentId) {
        MyForumCommentZanUserEntity myForumCommentZanUserEntity = myForumCommentZanUserDao.checkZan(userId, commentId);
        if (myForumCommentZanUserEntity != null) {
            if (myForumCommentZanUserEntity.getEnabled() == 1) {
                return true;
            } else {
                myForumCommentDao.increaseZanNum(commentId);
                return myForumCommentZanUserDao.reZan(myForumCommentZanUserEntity.getId()) == 1;
            }
        }
        myForumCommentDao.increaseZanNum(commentId);
        return myForumCommentZanUserDao.zan(userId, commentId) == 1;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean unZan(Integer userId, Integer commentId) {
        MyForumCommentZanUserEntity myForumCommentZanUserEntity = myForumCommentZanUserDao.checkZan(userId, commentId);
        if (myForumCommentZanUserEntity != null) {
            if (myForumCommentZanUserEntity.getEnabled() == 0) {
                return true;
            } else {
                myForumCommentDao.decreaseZanNum(commentId);
                return myForumCommentZanUserDao.unZan(myForumCommentZanUserEntity.getId()) == 1;
            }
        }
        return true;
    }
}
