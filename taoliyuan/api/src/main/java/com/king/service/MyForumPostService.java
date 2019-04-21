package com.king.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.king.dao.MyForumPostDao;
import com.king.dao.MyForumPostZanUserDao;
import com.king.entity.MyForumCommentEntity;
import com.king.entity.MyForumCommentZanUserEntity;
import com.king.entity.MyForumPostEntity;
import com.king.entity.MyForumPostZanUserEntity;
import com.king.util.DateTimeUtil;
import com.king.vo.MyForumPostDetailVO;
import com.king.vo.MyForumPostVO;
import com.king.vo.PageVO;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author hhumhr
 */
@Component
public class MyForumPostService {

    @Resource
    private MyForumPostDao myForumPostDao;

    @Resource
    private MyForumPostZanUserDao myForumPostZanUserDao;

    public PageVO<MyForumPostVO> getFollowedModulePostList(Integer userId,Integer page,Integer size) {

        List<MyForumPostVO> myForumPostVOList = new ArrayList<>();

        PageHelper.startPage(page,size);
        List<MyForumPostEntity> followedModulePostList = myForumPostDao.getFollowedModulePostList(userId);

        List<Integer> idList = new ArrayList<>();
        for (MyForumPostEntity comment : followedModulePostList) {
            if (comment.getZanNum() > 0) {
                idList.add(comment.getId());
            }
        }
        List<Integer> zanedPostIdList = new ArrayList<>();
        if (idList.size() > 0) {
            zanedPostIdList = myForumPostDao.getZanedPostIdListInSelectedPostIdListByUserId(idList, userId);
        }

        for (MyForumPostEntity myForumPostEntity : followedModulePostList) {
            MyForumPostVO myForumPostVO = assembleMyForumPostVO(myForumPostEntity);
            myForumPostVO.setZaned(0);
            for (Integer id : zanedPostIdList) {
                if (id.equals(myForumPostEntity.getId())) {
                    myForumPostVO.setZaned(1);
                    break;
                }
            }

            myForumPostVOList.add(myForumPostVO);
        }
        PageVO<MyForumPostVO> pageVO = new PageVO<>();
        pageVO.setCount(((Page)followedModulePostList).getTotal());
        pageVO.setData(myForumPostVOList);
        return pageVO;
    }

    public boolean increaseShareNum(Integer id) {
        int i = myForumPostDao.increaseShareNum(id);
        return i > 1;
    }

    /**
     * 获取文章详情，当前用户是否点赞，阅读数增加1
     *
     * @param userId 当前用户id
     * @param postId 当前访问文章id
     * @return
     */
    @Transactional
    public MyForumPostVO getPostDetailById(Integer userId, Integer postId) {
        myForumPostDao.increaseViewNum(postId);

        MyForumPostEntity myForumPostEntity = myForumPostDao.getPostDetailById(postId);

        MyForumPostVO myForumPostVO = assembleMyForumPostVO(myForumPostEntity);
        myForumPostVO.setZaned(0);
        if (myForumPostEntity.getZanNum() > 0) {
            Integer zanedPostId = myForumPostDao.getZanedPostIdByUserIdAndPostId(postId, userId);
            if (zanedPostId != null) {
                myForumPostVO.setZaned(1);
            }

        }
        return myForumPostVO;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean zan(Integer userId, Integer postId) {
        MyForumPostZanUserEntity myForumPostZanUserEntity = myForumPostZanUserDao.checkZan(userId, postId);
        if (myForumPostZanUserEntity != null) {
            if (myForumPostZanUserEntity.getEnabled() == 1) {
                return true;
            } else {
                myForumPostDao.increaseZanNum(postId);
                return myForumPostZanUserDao.reZan(myForumPostZanUserEntity.getId()) == 1;
            }
        }
        myForumPostDao.increaseZanNum(postId);
        return myForumPostZanUserDao.zan(userId, postId) == 1;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean unZan(Integer userId, Integer postId) {
        MyForumPostZanUserEntity myForumPostZanUserEntity = myForumPostZanUserDao.checkZan(userId, postId);
        if (myForumPostZanUserEntity != null) {
            if (myForumPostZanUserEntity.getEnabled() == 0) {
                return true;
            } else {
                myForumPostDao.decreaseZanNum(postId);
                return myForumPostZanUserDao.unZan(myForumPostZanUserEntity.getId()) == 1;
            }
        }
        return true;
    }

    private MyForumPostVO assembleMyForumPostVO(MyForumPostEntity myForumPostEntity) {
        MyForumPostVO myForumPostVO = new MyForumPostVO();

        myForumPostVO.setName(myForumPostEntity.getMyUserEntity().getName());
        myForumPostVO.setAvatar(myForumPostEntity.getMyUserEntity().getAvatar());

        myForumPostVO.setSubModuleName(myForumPostEntity.getMyForumModuleSubclassEntity().getName());

        //todo 要加图片及图片封面 字段
        myForumPostVO.setId(myForumPostEntity.getId());
        myForumPostVO.setUserId(myForumPostEntity.getUserId());
        myForumPostVO.setTitle(myForumPostEntity.getTitle());
        myForumPostVO.setContent(myForumPostEntity.getContent());
        myForumPostVO.setTop(myForumPostEntity.getTop());
        myForumPostVO.setCommentNum(myForumPostEntity.getCommentNum());
        myForumPostVO.setZanNum(myForumPostEntity.getZanNum());
        myForumPostVO.setShareNum(myForumPostEntity.getShareNum());
        myForumPostVO.setViewNum(myForumPostEntity.getViewNum());
        myForumPostVO.setCreateTime(DateTimeUtil.toHumanDateTimeStr(myForumPostEntity.getCreateTime()));
        myForumPostVO.setUpdateTime(DateTimeUtil.toHumanDateTimeStr(myForumPostEntity.getUpdateTime()));
        return myForumPostVO;
    }


    public boolean submitPost(MyForumPostEntity myForumPostEntity) {
        int i = myForumPostDao.save(myForumPostEntity);
        return 1==i;
    }
}
