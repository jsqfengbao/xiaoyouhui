package com.king.util;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;

/**
 * @author hhumhr
 * @param <T>
 */
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ServerResponse<T> implements Serializable {
    private int errno;
    private String errmsg;
    private T data;

    private ServerResponse(int errno) {
        this.errno = errno;
    }



    private ServerResponse(int errno, T data) {
        this(errno);
        this.data = data;
    }

    private ServerResponse(int errno, String errmsg, T data) {
        this(errno, data);
        this.errmsg = errmsg;
    }

    private ServerResponse(int errno, String errmsg) {
        this(errno);
        this.errmsg = errmsg;
    }
    @JsonIgnore
    public boolean isSuccess(){
        return errno == ResponseCode.SUCCESS.getCode();
    }


    public int getErrno() {
        return errno;
    }

    public T getData() {
        return data;
    }

    public String getErrmsg() {
        return errmsg;
    }


    public static <K> ServerResponse<K> createBySuccess(){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode());
    }

    public static <K> ServerResponse<K> createBySuccessMessage(String msg){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode(),msg);
    }
    public static <K> ServerResponse<K> createBySuccess(K data){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode(),data);
    }
    public static <K> ServerResponse<K> createBySuccess(String msg,K data){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode(),msg,data);
    }

    public static <K> ServerResponse<K> createByError(){
        return new ServerResponse<>(ResponseCode.ERROR.getCode(),ResponseCode.ERROR.getDesc());
    }
    public static <K> ServerResponse<K> createByErrorMessage(String errMsg){
        return new ServerResponse<>(ResponseCode.ERROR.getCode(),errMsg);
    }
    public static <K> ServerResponse<K> createByErrorCodeMessage(int errCode,String errMsg){
        return new ServerResponse<>(errCode,errMsg);
    }
}
