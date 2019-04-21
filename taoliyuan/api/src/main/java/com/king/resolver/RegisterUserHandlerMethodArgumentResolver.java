package com.king.resolver;

import com.king.annotation.RegisterUser;
import com.king.dao.MySchoolUserDao;
import com.king.entity.MyUserEntity;
import com.king.entity.MySchoolUserEntity;
import com.king.enums.UserStatusEnum;
import com.king.interceptor.AuthorizationInterceptor;
import com.king.service.MyUserService;
import com.king.utils.ApiRRException;
import org.apache.commons.lang.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.annotation.Resource;

/**
 * 有@RegisterUser注解的方法参数，注入当前注册用户
 *
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/15 22:09
 * @Modified By
 **/
public class RegisterUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {
    @Resource
    private MyUserService myUserService;
    @Resource
    private MySchoolUserDao mySchoolUserDao;

    public void setUserService(MyUserService userService) {
        this.myUserService = userService;
    }

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(MyUserEntity.class) && parameter.hasParameterAnnotation(RegisterUser.class);
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer,
                                  NativeWebRequest request, WebDataBinderFactory webDataBinderFactory) throws Exception {
        //获取用户ID
        Object object = request.getAttribute(AuthorizationInterceptor.LOGIN_USER_KEY, RequestAttributes.SCOPE_REQUEST);
        if (object == null) {
            return null;
        }

        //获取用户信息
        Integer userId = Integer.valueOf(object.toString());
        MyUserEntity user = myUserService.queryObject(userId);

        Integer schoolParentId = (Integer) request.getAttribute(AuthorizationInterceptor.SCHOOL_PARENT_ID, RequestAttributes.SCOPE_REQUEST);

        MySchoolUserEntity mySchoolUserEntity = mySchoolUserDao.getOneBySchoolParentAndUserId(schoolParentId, userId);
        if (mySchoolUserEntity == null) {
            if (StringUtils.isEmpty(user.getTelephone())) {
                throw new ApiRRException("请填写基本信息后，申请加入校友会", 99);
            }
            throw new ApiRRException("尚未申请加入校友会，请先提交申请", 100);
        }

        if (mySchoolUserEntity.getStatus().equals(UserStatusEnum.APPLYING.getValue())) {
            throw new ApiRRException("校友会申请正在审核中，请稍候或联系管理员", 101);
        } else if (mySchoolUserEntity.getStatus().equals(UserStatusEnum.REFUSED.getValue()) || mySchoolUserEntity.getEnabled() == 0) {
            throw new ApiRRException("申请被拒绝或禁用，请联系管理员", 104);
        } else if (mySchoolUserEntity.getStatus().equals(UserStatusEnum.NEED_EDIT.getValue())) {
            if (StringUtils.isNotEmpty(mySchoolUserEntity.getRefuseReason())) {
                throw new ApiRRException(mySchoolUserEntity.getRefuseReason() + "。修改后重新提交申请", 103);
            }
            throw new ApiRRException("审核未通过，请修改基本信息后重新提交申请", 103);
        }


//            if (!UserStatusEnum.APPLIED.getValue().equals(user.getStatus())) {
//                throw new ApiRRException("请填写个人信息，加入校友会!", 401);
//            }

        return user;
    }
}
