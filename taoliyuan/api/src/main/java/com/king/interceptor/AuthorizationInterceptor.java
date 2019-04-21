package com.king.interceptor;

import com.king.annotation.IgnoreAuth;
import com.king.entity.TokenEntity;
import com.king.service.TokenService;
import com.king.utils.ApiRRException;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

/**
 * 权限(Token)验证
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 15:38
 */
@Component
public class AuthorizationInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = Logger.getLogger(getClass());
    @Autowired
    private TokenService tokenService;

    public static final String LOGIN_USER_KEY = "LOGIN_USER_KEY";
    public static final String LOGIN_TOKEN_KEY = "tao-li-yuan-token";
    public static final String INVITE_USER_ID = "invite-user-id";
    public static final String SCHOOL_PARENT_ID = "school-parent-id";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.addHeader("Access-Control-Allow-Credentials", "true");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers","X-Requested-With,Host,User-Agent,Accept,Accept-Language,Accept-Encoding,Accept-Charset,Keep-Alive,Connection,Referer,Origin, Content-Type,authorization");
        // 用户访问的资源地址
    	String requestPath = getRequestPath(request);
    	if(requestPath.contains("swagger") || requestPath.contains("api-docs")){
			return true;
		}
    	
        IgnoreAuth annotation;
        if (handler instanceof HandlerMethod) {
            annotation = ((HandlerMethod) handler).getMethodAnnotation(IgnoreAuth.class);
        } else {
            return true;
        }

        //如果有@IgnoreAuth注解，则不验证token
        if (annotation != null) {
            return true;
        }

        //从header中获取token
        String token = request.getHeader(LOGIN_TOKEN_KEY);
        //如果header中不存在token，则从参数中获取token
        if (StringUtils.isBlank(token)) {
            token = request.getParameter(LOGIN_TOKEN_KEY);
        }
        //token为空
        if (StringUtils.isBlank(token)) {
            throw new ApiRRException("请先登录", 402);
        }
        String schoolParentIdString = request.getHeader(SCHOOL_PARENT_ID);
        if (StringUtils.isEmpty(schoolParentIdString)){
            schoolParentIdString = "1";
        }

        //查询token信息
        TokenEntity tokenEntity = tokenService.queryByToken(token);
        if (tokenEntity == null || tokenEntity.getExpireTime().getTime() < System.currentTimeMillis()) {
            throw new ApiRRException("token失效，请重新登录", 402);
        }



        //设置userId到request里，后续根据userId，获取用户信息
        request.setAttribute(LOGIN_USER_KEY, tokenEntity.getUserId());
        request.setAttribute(INVITE_USER_ID,request.getParameter("inviteUserId"));
        request.setAttribute(SCHOOL_PARENT_ID,Integer.valueOf(schoolParentIdString));

        return true;
    }
    
    /**
	 * 截取访问路径
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestPath(HttpServletRequest request) {
		ServletContext servletContext=request.getServletContext();
		//使用ServletContext获取指定目录下所有资源路径

		Set<String> paths=servletContext.getResourcePaths("/META-INF/resources");

		//System.out.println(paths);//[/WEB-INF/lib, /WEB-INF/classes,/WEB-INF/web.xml]
		String requestPath = request.getRequestURI();
		// 去掉其他参数
		if (requestPath.indexOf("&") > -1) {
			requestPath = requestPath.substring(0, requestPath.indexOf("&"));
		}
		// 去掉jsessionid参数
		if(requestPath.indexOf(";") > -1){
			requestPath = requestPath.substring(0, requestPath.indexOf(";"));
		}
		// 去掉项目路径
		requestPath = requestPath.substring(request.getContextPath().length() + 1);
		return requestPath;
	}
}
