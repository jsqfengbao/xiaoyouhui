package com.king.service;

import com.king.BaseJUnitTest;
import com.king.vo.SchoolAreaVo;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author hhumhr
 */

public class MyRegionServiceTest extends BaseJUnitTest {

    @Resource
    private MyRegionService myRegionService;

    @Test
    public void getRegionList() {
    }

    @Test
    public void queryRegionWithSchoolList() {
        List<SchoolAreaVo> schoolAreaVoList = myRegionService.queryRegionWithSchoolList(1);
        System.out.println(1);
    }
}