package com.king.controller;

import com.king.annotation.LoginUser;
import com.king.annotation.RegisterUser;
import com.king.entity.MyForumPostEntity;
import com.king.entity.MyUserEntity;
import com.king.service.MyForumCommentService;
import com.king.service.MyForumPostService;
import com.king.util.ApiBaseAction;
import com.king.vo.MyForumCommentVO;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author hhumhr
 */
@RestController
@RequestMapping("api/forum/post")
public class ForumPostController extends ApiBaseAction {

    @Resource
    private MyForumPostService myForumPostService;

    @Resource
    private MyForumCommentService myForumCommentService;

    @GetMapping("followed")
    public Object getFollowedPostList(@LoginUser MyUserEntity myUserEntity,
                                      @RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "10") Integer size) {

        return toResponseSuccess(myForumPostService.getFollowedModulePostList(myUserEntity.getId(),page,size));
    }


    @PostMapping
    public Object submitPost(@RegisterUser MyUserEntity myUserEntity,
                             @RequestParam String title,
                             @RequestParam String content,
                             @RequestParam Integer moduleId,
                             @RequestParam Integer subModuleId,
                             String imgList ,
                             Integer top) {

        MyForumPostEntity myForumPostEntity = new MyForumPostEntity();
        myForumPostEntity.setUserId(myUserEntity.getId());
        myForumPostEntity.setModuleId(moduleId);
        myForumPostEntity.setSubModuleId(subModuleId);
        myForumPostEntity.setTitle(title);
        myForumPostEntity.setContent(content);
        myForumPostEntity.setImgs(imgList);
        myForumPostEntity.setTop(top);
        return myForumPostService.submitPost(myForumPostEntity);
    }

    @GetMapping("{id}")
    public Object getPostDetail(@RegisterUser MyUserEntity myUserEntity, @PathVariable Integer id) {
        return toResponseSuccess(myForumPostService.getPostDetailById(myUserEntity.getId(), id));
    }

    /**
     * 分享数加1
     *
     * @param id
     * @return
     */
    @PostMapping("{id}/share")
    public Object increaseShareNum(@PathVariable Integer id) {
        boolean b = myForumPostService.increaseShareNum(id);
        if (b) {
            return toResponseSuccess("share+1 success");
        }
        return toResponseFail("share+1 fail");

    }

    /**
     * 获取文章评论列表
     *
     * @param myUserEntity
     * @param id
     * @param page
     * @param size
     * @return
     */
    @GetMapping("{id}/comment")
    public Object getCommentList(@RegisterUser MyUserEntity myUserEntity, @PathVariable Integer id,
                                 @RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "10") Integer size) {
        return toResponseSuccess(myForumCommentService.getCommentListByPostId(myUserEntity.getId(), id, page, size));
    }

    /**
     * 提交评论
     * @param myUserEntity
     * @param content
     * @param id
     * @return
     */
    @PostMapping("{id}/comment")
    public Object submitComment(@RegisterUser MyUserEntity myUserEntity, @RequestParam String content, @PathVariable Integer id) {
        MyForumCommentVO myForumCommentVO = myForumCommentService.saveComment(myUserEntity, id, content);
        return toResponseSuccess(myForumCommentVO);

    }

    @PostMapping("{id}/zan")
    public Object zan(@RegisterUser MyUserEntity myUserEntity, @PathVariable Integer id) {
        boolean zan = myForumPostService.zan(myUserEntity.getId(), id);
        if (zan) {
            return toResponseMsgSuccess("success");
        }
        return toResponseFail("fail");
    }

    @PostMapping("{id}/unzan")
    public Object unZan(@RegisterUser MyUserEntity myUserEntity, @PathVariable Integer id) {
        boolean unZan = myForumPostService.unZan(myUserEntity.getId(), id);
        if (unZan) {
            return toResponseMsgSuccess("success");
        }
        return toResponseFail("fail");
    }


}
