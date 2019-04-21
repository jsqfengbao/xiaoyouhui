
var app = getApp();
var pattern = /^(13|14|15|16|17|18)[0-9]{9}$/;
const config = require("../../../config.js");
Page({
  data: {
    hideVerifyPhone: true,
    hideBindNewPhone: true,
    oldCode: '',
    oldCodeBtnDisabled: false,
    oldCodeStatus: '获取验证码',
    nextStepDisabled: false,
    newPhone: '',
    newCode: '',
    newCodeBtnDisabled: false,
    newCodeStatus: '获取验证码',
    bindNewPhoneBtnDisabled: false,
    codeInterval: 60,
    hidden: true,
    numberFlag: 1 //默认第一个手机号码
  },
  onLoad: function (options) {
    // options.phoneFlag =0 表示新增第二个手机号码
    if (options.phoneFlag == 0) { //判断是哪个手机号码
      this.setData({
        numberFlag: 0
      })
    }
  },
  // sendCodeToOldPhone: function () {
  //   var that = this;
  //   if (this.data.oldCodeBtnDisabled) {
  //     return;
  //   }

  //   this.setData({
  //     oldCodeStatus: '正在发送...',
  //     oldCodeBtnDisabled: true
  //   })
  //   wx.request({
  //     url: config.host+'/api/user/sendSms',
  //     data:{
  //       userId: getApp.globalData.accountInfo.user_id,
  //       token: getApp.globalData.accountInfo.open_id
  //     },
  //     success: function () {
  //       if (data.errno==0){ //获取验证码成功
  //         var second = that.data.codeInterval,
  //           interval;
  //         interval = setInterval(function () {
  //           if (second < 0) {
  //             clearInterval(interval);
  //             that.setData({
  //               oldCodeStatus: '获取验证码',
  //               oldCodeBtnDisabled: false
  //             })
  //           } else {
  //             that.setData({
  //               oldCodeStatus: second + 's',
  //             })
  //             second--;
  //           }
  //         }, 1000);
  //       } else if (data.errno==1){  //验证码未过期提示语
  //         wx.showModal({
  //           title: '温馨提示',
  //           showCancel:false,
  //           content: data.errmsg,
  //         })
  //       }
  //     },
  //     complete: function () {
  //       that.setData({
  //         oldCodeStatus: '获取验证码',
  //         oldCodeBtnDisabled: false
  //       })
  //     }
  //   })
  // },
  inputPhone: function (e) {
    this.setData({
      newPhone: e.detail.value
    })
  },
  inputNewCode: function (e) {
    this.setData({
      newCode: e.detail.value
    })
  },
  sendCodeToNewPhone: function () {  //获取验证码
    var that = this,
      newPhone = that.data.newPhone;
    if (!pattern.test(newPhone)) {
      wx.showModal({
        title: '',
        content: '请输入正确的手机号码',
        showCancel: false,
        confirmText: '确定',
        confirmColor: '#004b97',
        success: function (res) { }
      })
      return;
    }
    that.setData({
      newCodeStatus: '正在发送...',
      newCodeBtnDisabled: true
    })
    var userid = getApp().globalData.accountInfo.user_id;
    wx.request({
      url: config.host +"/api/user/sendSms",
      data: { 
        "userId": userid,
        "mobile":newPhone,//手机号码
        },
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": app.globalData.accountInfo.open_id,
      },
      method:'POST',
      success: function (res) {
        var data = res.data;
        if (data.errno == 0) { //获取验证码成功
           console.log("获取验证码成功");
        } else {  //验证码未过期提示语
          wx.showModal({
            title: '温馨提示',
            showCancel: false,
            content: data.errmsg,
          })
        }
      }
    })
  },
  bindNewPhone: function () { //校验验证码
    var newPhone = this.data.newPhone,
        newCode = this.data.newCode;
    var that = this;
    if (!newPhone || !newCode) {
      return;
    }
    if (!pattern.test(newPhone)) {
      wx.showModal({
        title: '温馨提示',
        showCancel:false,
        content: '请输入正确的手机号码'
      });
      return false;
    }
    that.setData({
      hidden: false
    });
    var AACID = getApp().globalData.accountInfo.user_id;
    // var numberFlag = that.data.numberFlag;//1：标识第一个号码 0 第二个号码
    wx.request({
      url: config.host +"/api/user/validateSmsCode",
      data: {
        userId: app.globalData.accountInfo.user_id,
        mobile: newPhone,//手机号码
        smsCode: newCode//验证码
      },
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": app.globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        console.log(res);
        var data = res.data;
        if (data.errno==0) {
          getApp().globalData.userData.telephone = newPhone;
          wx.setStorageSync('AAData', getApp().globalData.userData);
          that.setData({
            hidden: true
          });
          wx.showToast({
            title: '验证成功!',
            icon: 'loading',
            duration: 1000
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            });
            wx.navigateBack({});
          }, 1000)
        }
        else {
          wx.showModal({
            title: "温馨提示",
            showCancel:false,
            content: data.errmsg,
          });
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 1000)
        }
      }
    })
  }
})
