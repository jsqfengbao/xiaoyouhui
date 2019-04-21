const config = require("../../../config.js");
Page({
  data: {
    viewTitle: '校友负责人列表',
    activityList: [],
    page: 1,
    shollFlag: false

  },
  onLoad: function (options) {

    this.getactity();//获取数据
  },
  scroll: function () {
    if (this.data.shollFlag) this.getactity();
  },
  getactity: function () {
    var that = this;
    that.setData({
      hidden: false
    })
    var param = {
      userId: getApp().globalData.accountInfo.user_id,
      page: that.data.page,
      size: 10
    }
    wx.request({ //活动列表
      url: config.host + '/api/alumni/getAlumniAdmin',
      data: param,
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": getApp().globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        console.log(res);
        var data = res.data;
        if (data.errno == 0) {
          var activityList = data.data.data;
          if (that.data.page > 1) {
            activityList = that.data.activityList.push(activityList);
          }
          if (data.data.count >= 10) { //当前页面加载到的数据条数
            that.setData({
              page: that.data.page + 1,
              shollFlag: true, //上移加载的标识

            })
          } else {
            that.setData({
              shollFlag: false, //上移加载的标识
            })
          }
          that.setData({
            activityList: activityList
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else {
          wx.showModal({
            title: '温馨提示',
            showCancel: false,
            content: data.errmsg,
          })
        }
      }
    })
  }
})
