package com.king.vo;

import lombok.Data;

import java.util.List;

/**
 * @author hhumhr
 */
@Data
public class PageVO<T> {
    private Long count;
    private List<T> data;
}
