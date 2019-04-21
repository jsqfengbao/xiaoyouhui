const config = require("../../../config.js")
Page({

    /**
     * 页面的初始数据
     */
    data: {
        userInfo: '',
        userData: '',
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {

    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {

    },
    changeImg: function () {
        var timestamp = Date.parse(new Date());
        var that = this;
        wx.chooseImage({
            count: 1,  //最多可以选择的图片总数
            sourceType: ['album', 'camera'],
            success: function (res) {
                const tempFilePaths = res.tempFilePaths;
                wx.uploadFile({
                    url: 'https://ourtaoliyuan.com/uploadFile',
                    filePath: tempFilePaths[0],
                    name: timestamp + "_" + Math.random().toFixed(3) * 1000,
                    success: function (res) {
                        console.log("upload:", JSON.parse(res.data).base_url);
                        var base_url = JSON.parse(res.data).base_url;
                        wx.request({
                            url: config.host,
                            data: {
                                "REQUESTS": [{
                                    "REQ_MSG_HDR": {
                                        "SERVICE_ID": "1001",
                                        "OPERATE_TYPE": 2
                                    },
                                    "REQ_COMM_DATA": {
                                        "ID": getApp().globalData.accountInfo.user_id,
                                        "PHOTO_URL": 'https://ourtaoliyuan.com' + base_url

                                    }
                                }]
                            },
                            method: 'POST',
                            success: function (res) {
                                //  var data = res.data.ANSWERS[0].ANS_COMM_DATA[0];
                                getApp().globalData.userData.PHOTO_URL = tempFilePaths[0]
                                that.setData({
                                    hidden: true,
                                    userData: getApp().globalData.userData
                                });
                            }
                        })
                    }
                })
            },
            fail: function (res) {
                console.log("上传失败", res);
            }
        })
    },
    bindPhone: function () {//跳转到绑定手机号码
        console.log("changephone");
        var phoneFlag = this.data.phoneFlag;
        switch (phoneFlag) {
            case 0: //只有一个号码且是隐藏所以跳转到绑定页面
                wx.showModal({
                    content: '是否要绑定另一个手机号码？',
                    success: function (res) {
                        if (res.confirm) {
                            wx.navigateTo({
                                url: '/pages/bindCellphone/bindCellphone?phoneFlag=0'
                            });
                        } else {
                            wx.showModal({
                                content: '是否要显示/隐藏手机号码？',
                                success: function (res) {
                                    if (res.confirm) {
                                        wx.navigateTo({
                                            url: '/pages/myinfo/openPhone/openPhone?phoneFlag=0'
                                        });
                                    }
                                }
                            })
                        }
                    }

                })
                break;
            case 1:  //没有绑定任何号码
                wx.showModal({
                    content: '是否要绑定手机号',
                    success: function (res) {
                        if (res.confirm) {
                            wx.navigateTo({
                                url: '/pages/bindCellphone/bindCellphone?phoneFlag=1'
                            });
                        }
                    }
                })
                break;
            default:
                wx.navigateTo({
                    url: '/pages/myinfo/openPhone/openPhone'
                });
        }
    },
    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {
        var that = this;
        wx.request({
            url: config.host,
            data: {
                "REQUESTS": [{
                    "REQ_MSG_HDR": {"SERVICE_ID": "1001", "OPERATE_TYPE": 21},
                    "REQ_COMM_DATA": {"ID": getApp().globalData.accountInfo.user_id}
                }]
            },
            method: 'POST',
            success: function (res) {
                // FIRST_MOBILE_STATUS 1:显示第一个号码 0：隐藏第一个号码
                var data = res.data.ANSWERS[0].ANS_COMM_DATA[0];
                if (data.FIRST_MOBILE && data.FIRST_MOBILE_STATUS == 1) {
                    getApp().globalData.userData.FIRST_MOBILE = data.FIRST_MOBILE; //手机号码
                    that.setData({phoneFlag: 2})  //跳转到是否显示手机号码页面
                } else if (data.FIRST_MOBILE && data.FIRST_MOBILE_STATUS == 0) {
                    getApp().globalData.userData.FIRST_MOBILE = "******";
                    if (!data.SECOND_MOBILE) {
                        that.setData({phoneFlag: 0})  //跳转到绑定页面
                    }
                } else {
                    that.setData({phoneFlag: 1})  //跳转到绑定页面
                    //显示掩码
                    //  getApp().globalData.userData.TELPHONE = "******"; //手机号码
                }
                if (data.NAME) getApp().globalData.userData.NAME = data.NAME; //姓名
                if (data.INTRODUCTION) getApp().globalData.userData.INTRODUCTION = data.INTRODUCTION;//个人简介
                if (data.SECOND_MOBILE) getApp().globalData.userData.SECOND_MOBILE = data.SECOND_MOBILE; //第二个是手机号码
                if (data.PHOTO_URL) getApp().globalData.userData.PHOTO_URL = data.PHOTO_URL
                that.setData({
                    hidden: true,
                    userInfo: getApp().globalData.accountInfo,
                    userData: getApp().globalData.userData
                });

            }
        })
    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function () {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function () {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function () {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function () {

    }
})