package com.king.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 实体
 * 表名 my_user
 *
 * @author jinshuangqi
 * @email jsqfengbao@qq.com
 * @date 2018-12-06 16:45:16
 */
@Data
public class MyUserEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 校友审核
     */
    private Integer checker;




    /**
     * 关联my_school_user
     */
    private Integer schoolUserId;


    /**
     * 证书编号
     */
    private String certificateNo;

    /**
     * 审核方式
     */
    private Integer checkType;


    
    

    private Integer id;

    private Integer schoolParentId; //父学校ID

    private Integer schoolId; //区域学校ID

    private Integer adminId; //管理员ID

    private Integer inviteUserId; //邀请人ID
    //
    private String username;
    //
    private String password;
    //
    private Integer gender;
    //
    private Date registerTime;
    //
    private Date lastLoginTime;
    //
    private String lastLoginIp;
    //
    private String nickname;
    //
    private String registerIp;
    //
    private String avatar;
    //oppenid
    private String wxOppenid;
    //姓名
    private String name;
    //电话
    private String telephone;

    private String isShowMobile;
    //qq
    private String qq;
    //微信号
    private String webchat;
    //个人简介
    private String personProfile;
    //省
    private String nativeProvince;

    private String nativeCity;

    private String nativeCountry;

    private String nativePosition;
    //高中学校
    private String schoolName;

    private String education;
    //入学时间
    private String inShool;
    //毕业时间
    private String outShool;
    //系别
    private String depart;
    private String major;
    //用户班级
    private String userClass;
    //学号
    private String studentNo;
    //硕士导师
    private String masterTutor;
    //博士导师
    private String doctorTutor;
    //工作城市
    private String workLocation;

    //当前公司
    private String currentCompany;
    //行业方向
    private String industryDirection;
    //状态
    private Integer status;
    //职务
    private String job;
    //纬度
    private double latitude;
    //经度
    private double longitude;
    //0：无效，1：有效
    private String enabled;
    //Y:删除，N：没有
    private String isDelete;
    //创建时间
    private String createTime;
    //更新时间
    private String updateTime;


}
