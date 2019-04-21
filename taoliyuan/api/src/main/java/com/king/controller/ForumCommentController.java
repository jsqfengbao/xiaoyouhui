package com.king.controller;

import com.king.annotation.RegisterUser;
import com.king.entity.MyUserEntity;
import com.king.service.MyForumCommentService;
import com.king.util.ApiBaseAction;
import com.king.vo.MyForumCommentVO;
import com.king.vo.PageVO;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author hhumhr
 */
@RestController
@RequestMapping("/api/forum/comment")
public class ForumCommentController extends ApiBaseAction {

    @Resource
    private MyForumCommentService myForumCommentService;

    @PostMapping("{id}/zan")
    public Object zan(@RegisterUser MyUserEntity myUserEntity, @PathVariable Integer id) {
        boolean zan = myForumCommentService.zan(myUserEntity.getId(), id);
        if (zan) {
            return toResponseMsgSuccess("success");
        }
        return toResponseFail("fail");

    }

    @PostMapping("{id}/unzan")
    public Object cancelZan(@RegisterUser MyUserEntity myUserEntity, @PathVariable Integer id) {
        boolean unZan = myForumCommentService.unZan(myUserEntity.getId(), id);
        if (unZan) {
            return toResponseMsgSuccess("success");
        }
        return toResponseFail("fail");
    }

    @GetMapping("{id}/reply")
    public Object getReplyList(@RegisterUser MyUserEntity myUserEntity,
                               @PathVariable Integer id,
                               @RequestParam(defaultValue = "1") Integer page,
                               @RequestParam(defaultValue = "10") Integer size) {
        PageVO commentReplyListByCommentId = myForumCommentService.getCommentReplyListByCommentId(myUserEntity.getId(), id, page, size);
        return toResponseSuccess(commentReplyListByCommentId);
    }

    @PostMapping("{id}/reply")
    public Object saveCommentReply(@RegisterUser MyUserEntity myUserEntity,
                                   @RequestParam String content,
                                   @RequestParam Integer postId,
                                   @RequestParam Integer toUserId,
                                   String toUserName,
                                   @PathVariable Integer id){
        MyForumCommentVO myForumCommentVO = myForumCommentService.saveCommentReply(myUserEntity, postId, id, toUserId, toUserName,content);
        return toResponseSuccess(myForumCommentVO);


    }

}
