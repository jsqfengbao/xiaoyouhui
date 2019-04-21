package com.king.service;

import com.king.dao.MyRegionDao;
import com.king.entity.MyRegionEntity;
import com.king.entity.MySchoolEntity;
import com.king.vo.SchoolArea;
import com.king.vo.SchoolAreaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/1 21:27
 * @Modified By
 **/
@Service
public class MyRegionService {
    @Autowired
    private MyRegionDao myRegionDao;

    public List<MyRegionEntity> getRegionList() {
        Map<String, Object> map = new HashMap<>();
        map.put("enabled", "1");
        return myRegionDao.queryList(map);
    }

    public List<SchoolAreaVo> queryRegionWithSchoolList(Integer schoolId) {
        List<SchoolAreaVo> schoolAreaVoList = new ArrayList<>();
        List<MyRegionEntity> myRegionEntityList = myRegionDao.queryRegionWithSchoolList(schoolId);
        for (MyRegionEntity region : myRegionEntityList) {
            SchoolAreaVo schoolAreaVo = new SchoolAreaVo();
            List<SchoolArea> schoolAreaList = new ArrayList<>();
            for (MySchoolEntity school : region.getSchoolEntityList()) {
                SchoolArea schoolArea = new SchoolArea();
                schoolArea.setSchoolId(school.getId());
                schoolArea.setSchoolName(school.getSchoolName());
                schoolAreaList.add(schoolArea);
            }
            schoolAreaVo.setRegionName(region.getRegionName());
            schoolAreaVo.setRegionValue(schoolAreaList);
            schoolAreaVoList.add(schoolAreaVo);
        }
        return schoolAreaVoList;

    }
}
