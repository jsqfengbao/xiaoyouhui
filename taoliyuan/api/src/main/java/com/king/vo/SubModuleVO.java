package com.king.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * @author hhumhr
 */
@Data
public class SubModuleVO {
    @JsonProperty("name")
    private String typeName;

    @JsonProperty("subModuleId")
    private Integer id;
}
