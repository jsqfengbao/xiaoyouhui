// pages/schoolCompany/companyDetail/companyDetail.js
const config = require("../../../config.js");
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    AACDetail:[],
    page:1,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    if (options.companyId){
      that.companyDetail(options.companyId); //获取企业详情
    }
  },
  companyDetail: function (AACID) {
    console.log(AACID);
    var that = this;
    that.setData({
      hidden: false
    })
    wx.request({ //企业详情
      url: config.host + '/api/company/getCompanyContent',
      data: {
        userId: getApp().globalData.accountInfo.user_id,
        companyId: AACID,
      },
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": getApp().globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        var data = res.data;
        if (data.errno == 0) {
          var activityList = data.data;
          that.setData({
            AACDetail: activityList
          })

          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        }else{
          wx.showModal({
            title: '温馨提示',
            showCancel: false,
            content: data.errmsg,
          })
        }
      }
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

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