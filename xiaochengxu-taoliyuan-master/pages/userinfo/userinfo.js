// pages/userinfo/userinfo.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    eye: true,
    pageflag:0,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    if(options.pageflag){ //0标记是从index页面过来
       this.setData({
         pageflag: options.pageflag = 0?0:1
       })
    }
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
  clickFunc:function(){
     this.setData({
       pageflag:1
     })
  },
  getUserInfoFun: function (e) {
    // wx.setStorage({ //存token
    //   key: 'access_token',
    //   data: "111111",
    // });
    
    // // wx.setStorageSync('access_token', access_token);
    // var url = '/pages/homepage/homepage';
    // wx.reLaunch({
    //   url: url,
    // });
    // console.log(e);
      //带有签名值得信息
    wx.setStorageSync("userInfoAll", JSON.stringify(e.detail));
    var that= this;
    wx.getUserInfo({
        success: function (res) {
            app.getUserInfo(function (code, userInfo) {
              if (code) {
                that.setData({
                  userInfo: userInfo,
                });
                app.getToken(code, userInfo, function (accountInfo) {
                  var access_token = accountInfo.open_id || "";
                  if (access_token) {
                    that.setData({
                      userInfo: app.globalData.userInfo,
                      accountInfo: app.globalData.accountInfo,
                      open_id: app.globalData.accountInfo.open_id
                    });
                    wx.setStorage({ //存token
                      key: 'access_token',
                      data: access_token,
                    });
                    var url = '/pages/homepage/homepage';
                    wx.reLaunch({
                      url: url,
                    });
                    return;
                  }
                });
              }
            });
        }
      })
 
    
  },
  showPrePage: function () {
    this.setData({
      eye: false
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