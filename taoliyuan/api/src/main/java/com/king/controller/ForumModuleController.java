package com.king.controller;

import com.king.annotation.LoginUser;
import com.king.annotation.RegisterUser;
import com.king.entity.MyUserEntity;
import com.king.service.MyForumModuleService;
import com.king.service.MyForumModuleUserService;
import com.king.util.ApiBaseAction;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * @author hhumhr
 */
@RestController
@RequestMapping("api/forum/module")
public class ForumModuleController extends ApiBaseAction {

    @Resource
    private MyForumModuleService myForumModuleService;

    @Resource
    private MyForumModuleUserService myForumModuleUserService;


    /**
     * 不带关注状态的模块列表
     * @param myUserEntity
     * @return
     */
    @RequestMapping("all")
    public Object getModuleListWithSon(@RegisterUser MyUserEntity myUserEntity){
        return toResponseSuccess(myForumModuleService.getModuleListWithSon());

    }
    /**
     * 带关注状态的模块列表
     * @param myUserEntity
     * @return
     */
    @RequestMapping("allWithStatus")
    public Object getModuleListWithSonAndStatus(@LoginUser MyUserEntity myUserEntity){
        return toResponseSuccess(myForumModuleService.getModuleListWithSonAndStatus(myUserEntity.getId()));
    }

    @PostMapping("/follow")
    public Object followSubModule(@LoginUser MyUserEntity myUserEntity,Integer subModuleId){
        if (subModuleId == null) {
            toResponseFail("Id未传");
        }
        Integer userId = myUserEntity.getId();

        boolean res = myForumModuleUserService.followSubModule(userId, subModuleId);
        if (res){
            return toResponseMsgSuccess("success");
        }
        return toResponseFail("fail");
    }

    @PostMapping("/unfollow")
    public Object unFollowSubModule(@LoginUser MyUserEntity myUserEntity,@RequestParam Integer subModuleId){
        if (subModuleId == null) {
            toResponseFail("Id未传");
        }
        Integer userId = myUserEntity.getId();

        boolean res = myForumModuleUserService.unFollowSubModule(userId, subModuleId);
        if (res){
            return toResponseMsgSuccess("success");
        }
        return toResponseFail("fail");
    }


}
