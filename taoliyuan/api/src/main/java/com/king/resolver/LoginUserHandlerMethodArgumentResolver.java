package com.king.resolver;

import com.king.annotation.LoginUser;
import com.king.entity.MyUserEntity;
import com.king.interceptor.AuthorizationInterceptor;
//import com.king.service.ApiUserService;
import com.king.service.MyUserService;
import com.king.util.DateUtil;
import com.king.utils.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * 有@LoginUser注解的方法参数，注入当前登录用户
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 22:02
 */
public class LoginUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {
    private MyUserService myUserService;

    public void setUserService(MyUserService userService) {
        this.myUserService = userService;
    }

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(MyUserEntity.class) && parameter.hasParameterAnnotation(LoginUser.class);
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer container,
                                  NativeWebRequest request, WebDataBinderFactory factory) throws Exception {
        //获取用户ID
        Integer userId = (Integer) request.getAttribute(AuthorizationInterceptor.LOGIN_USER_KEY, RequestAttributes.SCOPE_REQUEST);
        Object inviteUserId = request.getAttribute(AuthorizationInterceptor.INVITE_USER_ID, RequestAttributes.SCOPE_REQUEST);
        if (userId == null) {
            return null;
        }

        //获取用户信息
        MyUserEntity user = myUserService.queryObject(userId);
        //如果未注册成功
        if(StringUtils.isNullOrEmpty(user.getStatus())){
            user.setInviteUserId((Integer) inviteUserId);
            user.setUpdateTime(DateUtil.date2Str(null, "yyyy-MM-dd HH:mm:ss"));

            myUserService.update(user);
        }

        return user;
    }
}
