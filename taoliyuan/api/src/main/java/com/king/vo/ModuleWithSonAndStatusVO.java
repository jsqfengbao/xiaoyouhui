package com.king.vo;

import lombok.Data;

import java.util.List;

/**
 * @author hhumhr
 */
@Data
public class ModuleWithSonAndStatusVO {

    private Integer moduleId;

    private String name;

    private List<SubModuleWithStatusVO> subModuleWithStatusList;
}
