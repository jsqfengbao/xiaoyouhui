package com.king.controller;

import java.util.List;
import java.util.Map;

import com.king.service.PayWayService;
import com.king.utils.PageUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.king.entity.PayWayEntity;
import com.king.utils.Query;
import com.king.utils.R;

/**
 * Controller
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-05-24 18:01:14
 */
@Controller
@RequestMapping("payway")
public class PayWayController {
    @Autowired
    private PayWayService payWayService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("payway:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<PayWayEntity> payWayList = payWayService.queryList(query);
        int total = payWayService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(payWayList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("payway:info")
    @ResponseBody
    public R info(@PathVariable("id") String id) {
        PayWayEntity payWay = payWayService.queryObject(id);

        return R.ok().put("payWay", payWay);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("payway:save")
    @ResponseBody
    public R save(@RequestBody PayWayEntity payWay) {
        payWayService.save(payWay);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("payway:update")
    @ResponseBody
    public R update(@RequestBody PayWayEntity payWay) {
        payWayService.update(payWay);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("payway:delete")
    @ResponseBody
    public R delete(@RequestBody String[]ids) {
        payWayService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<PayWayEntity> list = payWayService.queryList(params);

        return R.ok().put("list", list);
    }
}
