package com.king.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

/**
 * @author hhumhr
 */
@Data
public class ModuleWithSonVO {
    private Integer moduleId;

    @JsonProperty("name")
    private String moduleName;

    private List<SubModuleVO> subModuleList;
}
