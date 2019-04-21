package com.king.vo;

import lombok.Data;

import java.util.List;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/17 16:47
 * @Modified By
 **/
@Data
public class MyAndAllSchoolAreaVo {

    private SchoolArea mine;
    private List<SchoolAreaVo> all;
}
