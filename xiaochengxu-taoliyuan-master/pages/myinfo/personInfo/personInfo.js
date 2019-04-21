var app = getApp();
const config = require("../../../config.js");
Page({
  data: {
    viewTitle: '基本信息',
    userInfo: {},
    userData: {},
    hidden: true,
    PHONE_NUM:'',//手机号码
    INTRODUCTION:'', //简介
    isShowMobile:0, //手机号码显示的状态
    checkBox: false, //false:显示 true：不显示
  },
  radioChange:function(res){//监听是否显示手机号码
      this.setData({
        checkBox: !this.data.checkBox
      })
  },
  userNameInput: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.NAME = e.detail.value;
  },
  userPhoneInput: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.telephone = e.detail.value;
    this.setData({
      PHONE_NUM: e.detail.value
    })
    console.log(getApp().globalData.userData.telephone);
  },

  changePhone : function () {
    console.log("changephone")
    var url = '/pages/myinfo/bindCellphone/bindCellphone'
    wx.navigateTo({
      url: url
    })
  },
  openPhone:function(res){
    // var phoneFlag = 
    var url = '/pages/myinfo/openPhone/openPhone?isShowMobile=' + this.data.isShowMobile;
    wx.navigateTo({
      url: url
    })
  },
  changeAbstract: function () {
    var url = '/pages/myinfo/updateUserInfo/updateUserInfo?personProfile=' + this.data.personProfile; 
    wx.navigateTo({
      url: url
    })
  },
  submintData: function (e) {
    //打印所有关于点击对象的信息
    console.log("ddddd",getApp().globalData.userData);
    this.data.userData = getApp().globalData.userData;
    if ((!this.data.userData.NAME) || (!this.data.userData.telephone) )
    {
      wx.showModal({
        title: '',
        content: '为了方便校友交流名字、手机请分别填写！',
        showCancel: false,
        confirmText: '缺少信息',
        confirmColor: '#004b97',
        success: function (res) { }
      })
      return;
    }

    var that = this;
    var postData = {};
   
    postData={
      'userId': getApp().globalData.accountInfo.user_id,
      // 'tao-li-yuan-token': getApp().globalData.accountInfo.open_id,
      "mobile": getApp().globalData.userData.telephone, 
      "name": that.data.userData.NAME,
      "personProfile": getApp().globalData.userData.INTRODUCTION||'',
      "isShowMobile": getApp().globalData.userData.isShowMobile
    }
    this.setData({
      hidden: false
    })
    wx.request({
      url: config.host +'/api/user/submitUser',
      data: postData,
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": app.globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        wx.setStorageSync('AAData', getApp().globalData.userData);
        that.setData({
          hidden: true
        });
        wx.showToast({
          title: '提交成功!',
          icon: 'loading',
          duration: 1000
        })

        setTimeout(function () {
          that.setData({
            hidden: true
          })
          wx.redirectTo({
            url: '/pages/myinfo/myinfo',
          });
        }, 2000)

      },
      fail: function () {
        that.setData({
          hidden: true
        })
        wx.showToast({
          title: '提交失败，请稍后重试!',
          icon: 'loading',
          duration: 1500
        })

        setTimeout(function () {
          that.setData({
            hidden: true
          })
          wx.navigateBack({});
        }, 2000)
      },
    })
  },

  onShow: function () {
    console.log("page on show");
    console.log("show", app.globalData.userData);
    var that = this;
    this.setData({
      userInfo: getApp().globalData.accountInfo,
      userData: getApp().globalData.userData
    });
  },
  onLoad: function (options) {
    // 生命周期函数--监听页面显示
    console.log("Page onLoad");
    var that = this;
    var param ={
      "userId": getApp().globalData.accountInfo.user_id,
    };
   
    wx.request({
      url: config.host +'/api/user/queryUser', //查询个人信息
      data: param,
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": app.globalData.accountInfo.open_id,
      },
      method:'POST',
      success: function (res) {
        // FIRST_MOBILE_STATUS 1:显示第一个号码 0：隐藏第一个号码
        var data = res.data;
        if (data.errno==0){
            // getApp().globalData.userData.FIRST_MOBILE_STATUS = data.FIRST_MOBILE_STATUS;
            // if (data.FIRST_MOBILE && data.FIRST_MOBILE_STATUS == 1) {
            //   getApp().globalData.userData.FIRST_MOBILE = data.FIRST_MOBILE; //手机号码 
            //   that.setData({ phoneFlag: 2 })  //跳转到是否显示手机号码页面
            // }
            // else if (data.FIRST_MOBILE && data.FIRST_MOBILE_STATUS == 0) {
            //   getApp().globalData.userData.FIRST_MOBILE = "******";
            //   if (!data.SECOND_MOBILE) {
            //     that.setData({ phoneFlag: 0 })  //跳转到绑定页面
            //   }
            // } else {
            //   that.setData({ phoneFlag: 1 })  //跳转到绑定页面
            // }
         
            // if (data.SECOND_MOBILE) getApp().globalData.userData.SECOND_MOBILE = data.SECOND_MOBILE; //第二个是手机号码
            // if (data.PHOTO_URL) getApp().globalData.userData.PHOTO_URL = data.PHOTO_URL


          if (data.data.telephone) getApp().globalData.userData.telephone = data.data.telephone; //手机号码
          if (data.data.name) getApp().globalData.userData.NAME = data.data.name; //姓名 
          if (data.data.personProfile) getApp().globalData.userData.INTRODUCTION = data.data.personProfile;//个人简介
          if (data.data.isShowMobile) getApp().globalData.userData.isShowMobile = data.data.isShowMobile;//号码显示还是隐藏
            that.setData({
              hidden: true,
              userInfo: getApp().globalData.accountInfo,
              userData: getApp().globalData.userData,
              isShowMobile: data.data.isShowMobile
            });
        }else{
          wx.showModal({
            title: '温馨提示',
            showCancel:false,
            content: data.errmsg,
          })
        }
      }

    })
    if (options.isShowMobile) {
      that.setData({ isShowMobile: options.isShowMobile });
      getApp().globalData.userData.isShowMobile = options.isShowMobile;//号码显示还是隐藏
    }
  }  
   
    
})




