package com.king.dao;


import com.king.BaseJUnitTest;
import com.king.entity.MyRegionEntity;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author hhumhr
 */
public class MyRegionDaoTest extends BaseJUnitTest {
    @Autowired
    private MyRegionDao myRegionDao;

    @Test
    public void queryRegionWithSchoolList() {
        List<MyRegionEntity> myRegionEntities = myRegionDao.queryRegionWithSchoolList(1);
        System.out.println(1);
    }


}
