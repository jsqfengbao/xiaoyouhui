package com.king.controller;


import com.king.annotation.LoginUser;
import com.king.entity.MyAdviceEntity;
import com.king.entity.MyUserEntity;
import com.king.enums.AdviceTypeEnum;
import com.king.service.MyAdviceService;
import com.king.util.ApiBaseAction;
import com.king.util.DateUtil;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/21 11:09
 * @Modified By
 **/
@RestController
@RequestMapping("/api/advice")
@Api(value = "建议管理", tags = { "API建议相关接口" })
public class AdviceController extends ApiBaseAction {

    @Autowired
    private MyAdviceService myAdviceService;

    /**
     * 提交建议
     * @param myUserEntity
     * @return
     */
    @RequestMapping("submitAdvice")
    public Object submitAdvice(@LoginUser MyUserEntity myUserEntity, @RequestParam String adviceContent){
        MyAdviceEntity myAdviceEntity = new MyAdviceEntity();
        myAdviceEntity.setUserId(myUserEntity.getId());
        myAdviceEntity.setAdviceContent(adviceContent);
        myAdviceEntity.setCreateTime(DateUtil.date2Str(null,"yyyy-MM-dd HH:mm:ss"));
        myAdviceEntity.setEnabled("1");
        myAdviceEntity.setAdviceType(AdviceTypeEnum.advice.getValue());
        myAdviceService.submitAdvice(myAdviceEntity);

        return toResponseMsgSuccess("提交成功！");
    }

    /**
     * 提交问题---有问必答
     * @param myUserEntity
     * @return
     */
    @RequestMapping("submitQuestion")
    public Object submitQuestion(@LoginUser MyUserEntity myUserEntity,@RequestParam String adviceContent){
        MyAdviceEntity myAdviceEntity = new MyAdviceEntity();
        myAdviceEntity.setUserId(myUserEntity.getId());
        myAdviceEntity.setAdviceContent(adviceContent);
        myAdviceEntity.setCreateTime(DateUtil.date2Str(null,"yyyy-MM-dd HH:mm:ss"));
        myAdviceEntity.setEnabled("1");
        myAdviceEntity.setAdviceType(AdviceTypeEnum.question.getValue());
        myAdviceService.submitAdvice(myAdviceEntity);

        return toResponseMsgSuccess("提交成功！");
    }
}
