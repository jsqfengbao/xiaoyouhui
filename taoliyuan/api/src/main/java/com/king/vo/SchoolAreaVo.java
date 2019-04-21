package com.king.vo;

import lombok.Data;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/2 10:06
 * @Modified By
 **/
@Data
public class SchoolAreaVo {

    private String regionName;

    private List<SchoolArea> regionValue;

//    public String getRegionName() {
//        return regionName;
//    }
//
//    public void setRegionName(String regionName) {
//        this.regionName = regionName;
//    }
//
//    public Object getRegionValue() {
//        return regionValue;
//    }
//
//    public void setRegionValue(Object regionValue) {
//        this.regionValue = regionValue;
//    }
}
