// hotest.js
//var Api = require('../../utils/api.js');
const config = require('../../../config.js');
const app = getApp();
Page({
  data: {
    title_str: '',
    content_str: '',
    phoneNum: '',
    hidden: true,
    user_id:'' //用户id
  },
  onShow:function(){
    var user_id = app.globalData.accountInfo.user_id||'';
    this.setData({ user_id: user_id });
  },
  formSubmit: function (e) {
    var that = this;
    var formData = e.detail.value;
    var user_id = that.data.user_id;
     that.setData({
       phoneNum: formData.phone_num,
       content_str: formData.question_content,
       title_str: formData.name
     })
    console.log(formData);
    var postData = { 
      "userId": user_id,
      adviceContent: formData.question_content
    };
    var pattern = /^(13|14|15|17|18)[0-9]{9}$/;
    var flag = pattern.test(formData.phone_num);
    if (formData.question_content.length == 0 || formData.name.length == 0 || formData.phone_num.length == 0) {
      wx.showModal({
        content: '姓名，建议内容，手机号码等不能为空!',
        showCancel:false,
        success: function () {
          return;
        }
      })

      setTimeout(function () {
        wx.hideToast()
      }, 2000)

    } else if (formData.phone_num.length != 11 || !flag) {
      wx.showModal({
        content: '请输入正确的11位手机号码!',
        showCancel:false,
        success:function(){
          return;
        }
      })

      setTimeout(function () {
        wx.hideToast()
      }, 2000)

    } else {
      console.log(postData);
      wx.request({ //提交建议
        url: config.host +"/api/advice/submitAdvice",
        data: postData,
        method: 'POST',
        header: {
          'content-type': 'application/json', // 默认值
          "tao-li-yuan-token": app.globalData.accountInfo.open_id,
        },
        success: function (res) {
          var data = res.data;
          if (data.errno == 0) { //标识请求成功
              wx.showToast({
                title: '提交成功!',
                icon: 'loading',
                duration: 1500
              })
              setTimeout(function () {
                wx.navigateBack({});
              }, 2000)
          }else{
            wx.showModal({
              title: '温馨提示',
              showCancel: false,
              content: data.errmsg,
            })
          }
        },
        fail: function () {
          wx.showToast({
            title: '提交失败，请稍后重试!',
            icon: 'loading',
            duration: 1500
          })

          setTimeout(function () {
            wx.navigateBack({});
          }, 2000)
        },
      })
    }
  },

  onLoad: function () {
  }
})
