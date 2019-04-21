package com.king.controller;


import com.king.utils.ApiRRException;
import com.king.utils.ParamsException;
import org.springframework.web.bind.annotation.*;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/6 15:05
 * @Modified By
 **/
@RestController
@RequestMapping("/")
public class TestController {

    @RequestMapping("/")
    public String index(){
//        throw new ParamsException("hh");
        return "ok";
    }

    @RequestMapping(method = RequestMethod.POST,value = "post")
    public String postTest(@RequestParam String body){
        System.out.println(body);
        return "post";
    }
    @RequestMapping(method=RequestMethod.GET,value="get")
    public String getTest(){
        return "get";
    }
}
