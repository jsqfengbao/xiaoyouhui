// pages/myinfo/workInfo/workInfo.js
const config = require("../../../config.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    region: ['请选择省', '市', '区'],
    userData:{},
    hidden:true
  },


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },
  bindRegionChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      region: e.detail.value
    })
  },
  changeProfession: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.PROFESSION = e.detail.value; //行业方向、
  },
  changeWorkCity: function (e) { //工作城市
    console.log('picker发送选择改变，携带值为', e.detail.value);
    this.data.userData.WORK_CITY = e.detail.value;
    this.setData({
      region: e.detail.value,
      userData: this.data.userData,
      workPlace: e.detail.value[0] + e.detail.value[1] + e.detail.value[2]
    })
    console.log(this.data.workPlace);
    getApp().globalData.userData.WORK_CITY = e.detail.value[0] + e.detail.value[1] + e.detail.value[2];
    console.log("111");
    console.log(getApp().globalData.userData.WORK_CITY); 
  },
  changeWorkCompany: function (e) {  //公司
    console.log(e.detail.value);
    getApp().globalData.userData.WORK_COMPANY = e.detail.value;
  },
  changeWorkTitle: function (e) { //职务
    console.log(e.detail.value);
    getApp().globalData.userData.WORK_TITLE = e.detail.value;
  },
  submintData: function (e) {

    //打印所有关于点击对象的信息
    console.log(getApp().globalData.userData);
    this.data.userData = getApp().globalData.userData;
    if ((this.data.userData.WORK_TITLE == '') || (this.data.userData.WORK_COMPANY == '') || (this.data.userData.PROFESSION == '') || (this.data.userData.WORK_CITY == '')) {
      wx.showModal({
        title: '',
        content: '为了方便校友交流，请把工作城市，行业方向等信息填写完整',
        showCancel: false,
        confirmText: '缺少信息',
        confirmColor: '#004b97',
        success: function (res) { }
      })
      return;
    }

    var that = this;
    var postData = {};
    this.setData({
      hidden: false
    })
    postData={
      userId: getApp().globalData.accountInfo.user_id,
      workLocation: that.data.userData.WORK_CITY, //工作城市
      industryDirection: that.data.userData.PROFESSION,//行业方向
      currentCompany: that.data.userData.WORK_COMPANY,//当前公司
      job: that.data.userData.WORK_TITLE//职务
    };
    wx.request({ //提交工作信息
      url: config.host +'/api/user/submitJob',
      data: postData,
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": getApp().globalData.accountInfo.open_id,
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
          wx.navigateBack({});
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
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    var that = this;
    wx.request({
      url: config.host +'/api/user/queryUser',
      data: {
        userId: getApp().globalData.accountInfo.user_id
      },
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": getApp().globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        var userData = getApp().globalData.userData;
        var data = res.data;
        if (data.errno == 0) {
          var data = data.data;
          userData.WORK_TITLE = data.job;//职务
          userData.PROFESSION = data.industryDirection;//行业方向
          userData.WORK_CITY = data.workLocation;//城市
          userData.WORK_COMPANY = data.currentCompany;//公司名称
          that.setData({
            hidden: true,
            userData: userData
          });
        }else{
          wx.showModal({
            title: '温馨提示',
            showCancel: false,
            content: data.errmsg,
          })
        }
      },
      fail:function(res){
        console.log("查询工作信息",res);
      }
    })
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