package com.king.controller;


import com.king.annotation.RegisterUser;
import com.king.entity.MyCompanyEntity;
import com.king.entity.MySchoolEntity;
import com.king.entity.MyUserEntity;
import com.king.service.MyCompanyService;
import com.king.service.MySchoolService;
import com.king.util.ApiBaseAction;
import com.king.util.ApiPageUtils;
import com.king.utils.Query;
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
 * @Date: Created in 2018/12/16 13:23
 * @Modified By
 **/
@RestController
@RequestMapping("/api/company")
@Api(value = "公司管理", tags = { "API公司相关接口" })
public class CompanyController extends ApiBaseAction {

    private Logger logger = Logger.getLogger(getClass());

    @Autowired
    private MyCompanyService myCompanyService;
    @Autowired
    private MySchoolService mySchoolService;

    /**
     * 获取对应的校友企业列表
     * @param myUserEntity
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("getCompanyList")
    public Object getCompanyList(@RegisterUser MyUserEntity myUserEntity,
                                 @RequestParam(value = "page", defaultValue = "1") Integer page,
                                 @RequestParam(value = "size", defaultValue = "10") Integer size){
        Map<String,Object> param = new HashMap<>();
         param.put("page", page);
        param.put("limit", size);
        param.put("sidx", "id");
        param.put("order", "desc");
        int schoolId = myUserEntity.getSchoolId();
        MySchoolEntity mySchoolEntity = mySchoolService.getSchoolParentId(myUserEntity.getSchoolId());
        int schoolParentId = 0;
        if(null != mySchoolEntity){
            schoolParentId = mySchoolEntity.getParentId();
        }
        param.put("schoolParentId",schoolParentId);

        //查询列表数据
        Query query = new Query(param);

        query.put("schoolParentId",schoolParentId);
        List<MyCompanyEntity> myCompanyEntityList = myCompanyService.getCompanyList(query);
        int total = myCompanyService.queryTotal(query);
        if(null != myCompanyEntityList){
            ApiPageUtils pageUtil = new ApiPageUtils(myCompanyEntityList, total, query.getLimit(), query.getPage());
            return toResponseSuccess(pageUtil);
        }
        return toResponseFail("消息为空！");
    }

    @RequestMapping("getCompanyContent")
    public Object getCompanyContent(@RegisterUser MyUserEntity myUserEntity,@RequestParam Integer companyId){
        MyCompanyEntity myCompanyEntity = myCompanyService.getCompanyContentById(companyId);

        return toResponseObject(0,"请求成功！",myCompanyEntity);
    }
}
