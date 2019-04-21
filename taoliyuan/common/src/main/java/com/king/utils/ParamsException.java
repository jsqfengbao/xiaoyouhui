package com.king.utils;

/**
 * @author hhumhr
 */

public class ParamsException extends RuntimeException {
    private String errmsg = "参数异常";
    private int errno = 1;

    public ParamsException(String errmsg, int errno) {
        this.errmsg = errmsg + this.errmsg;
        this.errno = errno;
    }

    public ParamsException(String errmsg) {
        this.errmsg = errmsg + this.errmsg;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public int getErrno() {
        return errno;
    }
}
