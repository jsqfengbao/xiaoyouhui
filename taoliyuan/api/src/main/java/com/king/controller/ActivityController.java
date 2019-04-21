package com.king.controller;

import com.king.annotation.IgnoreAuth;
import com.king.annotation.LoginUser;
import com.king.annotation.RegisterUser;
import com.king.entity.MyActivityEntity;
import com.king.entity.MyActivityUserEntity;
import com.king.entity.MySchoolEntity;
import com.king.entity.MyUserEntity;
import com.king.service.MyActivityService;
import com.king.service.MyActivityUserService;
import com.king.service.MySchoolService;
import com.king.util.ApiBaseAction;
import com.king.util.ApiPageUtils;
import com.king.util.DateUtil;
import com.king.utils.Query;
import com.king.vo.GetActivityUserVo;
import com.king.vo.MyActivityVo;
import com.king.vo.PageVO;
import io.swagger.annotations.Api;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/15 21:59
 * @Modified By
 **/
@RestController
@RequestMapping("/api/activity")
@Api(value = "活动管理", tags = {"API活动相关接口"})
public class ActivityController extends ApiBaseAction {

    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private MyActivityService myActivityService;
    @Autowired
    private MySchoolService mySchoolService;
    @Autowired
    private MyActivityUserService myActivityUserService;

    /**
     * 显示活动列表
     *
     * @param userEntity
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("getActivityList")
    public Object getActivityList(@RegisterUser MyUserEntity userEntity,
                                  @RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "size", defaultValue = "10") Integer size) {
        Map<String, Object> param = new HashMap<>(5);

        param.put("page", page);
        param.put("limit", size);
        param.put("sidx", "id");
        param.put("order", "desc");
        MySchoolEntity mySchoolEntity = mySchoolService.getSchoolParentId(userEntity.getSchoolId());
        int schoolParentId = 0;
        if (null != mySchoolEntity) {
            schoolParentId = mySchoolEntity.getParentId();
        }
        param.put("schoolParentId", schoolParentId);

        //查询列表数据
        Query query = new Query(param);
        List<MyActivityEntity> myActivityEntityList = myActivityService.getActivityList(query);
        query.put("schoolParentId", schoolParentId);
        int total = myActivityService.queryTotal(query);
        if (null != myActivityEntityList) {
            ApiPageUtils pageUtil = new ApiPageUtils(myActivityEntityList, total, query.getLimit(), query.getPage());
            return toResponseSuccess(pageUtil);
        }
        return toResponseFail("消息为空！");
    }

    /**
     * 显示活动内容
     *
     * @param myUserEntity
     * @return
     */
    @RequestMapping("getActivityContent")
    public Object getActivityContent(@LoginUser MyUserEntity myUserEntity, @RequestParam Integer activityId) {

        MyActivityVo activityVo = myActivityService.getActivityById(activityId, myUserEntity.getId());

        return toResponseObject(0, "请求成功！", activityVo);
    }

    /**
     * 显示推荐列表
     *
     * @param page
     * @param size
     * @return
     */
    @IgnoreAuth
    @RequestMapping("getRecommendList")
    public Object getRecommendList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                   @RequestParam(value = "size", defaultValue = "10") Integer size) {

        PageVO<MyActivityEntity> recommendedActivityList = myActivityService.getRecommendedActivityList(page, size);
        return toResponseSuccess(recommendedActivityList);
    }

    /**
     * 加入该活动
     *
     * @param userEntity
     * @param type:1加入，type:0取消
     * @return
     */
    @RequestMapping("addOrCancelActivity")
    public Object addOrCancelActivity(@RegisterUser MyUserEntity userEntity, @RequestParam Integer activityId, @RequestParam String type) {
        int userId = userEntity.getId();
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("activityId", activityId);
        map.put("enabled", "1");
        List<MyActivityUserEntity> myActivityUserEntityList = myActivityUserService.getOneByCondition(map);
        if ("1".equals(type)) {
            //如果加入活动了
            if (myActivityUserEntityList.size() > 0) {
                return toResponseFail("已加入该活动！");
            } else {
                MyActivityUserEntity activityUserEntity = new MyActivityUserEntity();
                activityUserEntity.setActivityId(activityId);
                activityUserEntity.setUserId(userId);

                activityUserEntity.setEnabled("1");
                Map<String, Object> mapResult = new HashMap<>(2);
                mapResult.put("activityId", activityId);
                mapResult.put("userId", userId);
                List<MyActivityUserEntity> activityUserEntities = myActivityUserService.getOneByCondition(mapResult);
                if (activityUserEntities.size() > 0) {
                    activityUserEntity.setId(activityUserEntities.get(0).getId());
                    activityUserEntity.setUpdateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
                    myActivityUserService.update(activityUserEntity);
                } else {
                    activityUserEntity.setCreateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
                    myActivityUserService.saveActivityUser(activityUserEntity);
                }

                return toResponseSuccess("加入成功！");
            }
            //取消加入
        } else if ("0".equals(type)) {
            if (myActivityUserEntityList.size() < 1) {
                return toResponseFail("未加入该活动！");
            } else {
                MyActivityUserEntity activityUserEntity = myActivityUserEntityList.get(0);
                activityUserEntity.setEnabled("0");
                myActivityUserService.update(activityUserEntity);
                return toResponseSuccess("取消活动成功！");
            }
        }
        return toResponseFail("未知状态");
    }

    /**
     * 获取参加活动人列表
     *
     * @param userEntity
     * @return
     */
    @RequestMapping("getAddActivityUser")
    public Object getAddActivityUser(@LoginUser MyUserEntity userEntity, @RequestParam Integer activityId) {
        List<GetActivityUserVo> getActivityUserVoList = myActivityUserService.getAllMyUserByActivityId(activityId);
        return toResponseSuccess(getActivityUserVoList);
    }
}
