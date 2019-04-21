package com.king.controller;

import com.alibaba.fastjson.JSONObject;
import com.king.annotation.IgnoreAuth;
import com.king.annotation.LoginUser;
import com.king.entity.FullUserInfo;
import com.king.entity.MyUserEntity;
import com.king.entity.UserInfo;
import com.king.service.MyUserService;
import com.king.service.TokenService;
import com.king.util.ApiBaseAction;
import com.king.util.ApiUserUtils;
import com.king.util.CommonUtil;
import com.king.util.DateUtil;
import com.king.utils.CharUtil;
import com.qiniu.util.StringUtils;
import io.swagger.annotations.Api;
import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/5 19:55
 * @Modified By
 **/
@RestController
@RequestMapping("/api/auth")
@Api(value = "认证管理", tags = { "API登录授权接口" })
public class AuthController extends ApiBaseAction {
    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private MyUserService myUserService;
    @Autowired
    private TokenService tokenService;

    /**
     * 登录
     */
    @IgnoreAuth
    @RequestMapping("login_by_weixin")
    public Object loginByWeixin(@RequestParam(defaultValue = "") Integer inviteUserId,
                                @RequestParam String code) {



        //获取openid //通过自定义工具类组合出小程序需要的登录凭证 code
        String requestUrl = ApiUserUtils.getWebAccess(code);
        logger.info("》》》组合token为：" + requestUrl);
        JSONObject sessionData = CommonUtil.httpsRequest(requestUrl, "GET", null);

        if (null == sessionData || StringUtils.isNullOrEmpty(sessionData.getString("openid"))) {
            return toResponseFail("登录失败");
        }

        Date nowTime = new Date();
        MyUserEntity userVo = myUserService.queryByOpenId(sessionData.getString("openid"));

        if (null == userVo) {
            userVo = new MyUserEntity();
            userVo.setUsername("微信用户" + CharUtil.getRandomString(12));
            userVo.setPassword(sessionData.getString("openid"));
            userVo.setRegisterTime(nowTime);
            userVo.setRegisterIp(this.getClientIp());
            userVo.setInviteUserId(inviteUserId);
            userVo.setLastLoginIp(userVo.getRegisterIp());
            userVo.setLastLoginTime(userVo.getLastLoginTime());
            userVo.setWxOppenid(sessionData.getString("openid"));
            userVo.setCreateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));
            myUserService.save(userVo);
        } else {
            userVo.setInviteUserId(inviteUserId);
            userVo.setLastLoginIp(this.getClientIp());
            userVo.setLastLoginTime(nowTime);
            userVo.setUpdateTime(DateUtil.date2Str(null,"yyyy-MM-dd HH:mm:ss"));
            myUserService.update(userVo);
        }
        Map<String, Object> tokenMap = tokenService.createToken(userVo.getId());
        String token = MapUtils.getString(tokenMap, "token");
        Map<String, Object> resultObj = new HashMap<>(2);
        resultObj.put("token", token);
        resultObj.put("userId", userVo.getId());

        return toResponseSuccess(resultObj);
    }

    /**
     * 微信获取用户头像等信息
     * @param myUserEntity
     * @return
     */
    @RequestMapping("getUserInfo")
    public Object getUserInfo(@LoginUser MyUserEntity myUserEntity,@RequestParam("userInfo") String userInfoString){
        Map<String, Object> resultObj = new HashMap<>();

///        JSONObject jsonParam = this.getJsonRequest();
//        FullUserInfo fullUserInfo = null;
//        if (null != jsonParam.get("userInfo")) {
//            fullUserInfo = jsonParam.getObject("userInfo", FullUserInfo.class);
//        }
//
//        UserInfo userInfo = fullUserInfo.getUserInfo();
        UserInfo userInfo = JSONObject.parseObject(userInfoString,UserInfo.class);
        myUserEntity.setAvatar(userInfo.getAvatarUrl());
        //性别 0：未知、1：男、2：女
        myUserEntity.setGender(userInfo.getGender());
        myUserEntity.setNickname(userInfo.getNickName());
        myUserEntity.setUpdateTime(DateUtil.date2Str(null,"yyyy-MM-dd HH:mm:ss"));
        myUserService.update(myUserEntity);
        resultObj.put("userInfo", userInfo);

        return toResponseSuccess(resultObj);
    }
}
