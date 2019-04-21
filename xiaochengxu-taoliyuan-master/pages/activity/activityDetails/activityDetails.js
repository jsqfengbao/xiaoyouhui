// hotest.js
//var Api = require('../../utils/api.js');
const config = require("../../../config.js");
Page({
  data: {
    viewTitle: '活动详情',
    AACDetail: [],
    hidden: true
  },

  fetchDetail: function (AACID) {
    console.log(AACID);
    var that = this;
    that.setData({
      hidden: false
    })
    wx.request({ //活动详情
      url: config.host +'/api/activity/getActivityContent',
      data: {
         userId: getApp().globalData.accountInfo.user_id,
          activityId: AACID, 
        },
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": getApp().globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        console.log(res);
        var data = res.data;
        if (data.errno == 0) {
          if (data.data.content) data.data.content = data.data.content.replace(/\<img/gi, '<img class="rich-img" '); 
            that.setData({
              AACDetail: data.data
            })
            setTimeout(function () {
              that.setData({
                hidden: true
              })
            }, 300)
          }else{
            wx.showModal({
              title: '温馨提示',
              showCancel:false,
              content: data.errmsg,
            })
          }

      }
    })
  },
  calling: function (e) {
    console.log(e.currentTarget.dataset.phone_num);
    wx.makePhoneCall({
      phoneNumber: e.currentTarget.dataset.phone_num,
      success: function () {
        console.log("拨打电话成功！")
      },
      fail: function () {
        console.log("拨打电话失败！")
      }
    })
  },
  onLoad: function (options) {
    this.setData({
      hidden: true
    })
    console.log(options);
    this.fetchDetail(options.ActivityID);
  }
})


