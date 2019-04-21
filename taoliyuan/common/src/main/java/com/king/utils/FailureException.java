package com.king.utils;

/**
 * @author hhumhr
 */
public class FailureException extends RuntimeException {
    private String errmsg = "失败，请稍后再试";
    private int errno = 1;

    public FailureException(String errmsg, int errno) {
        this.errmsg = errmsg + this.errmsg;
        this.errno = errno;
    }

    public FailureException(String errmsg) {
        this.errmsg = errmsg + this.errmsg;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public int getErrno() {
        return errno;
    }
}
