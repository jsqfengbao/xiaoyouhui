//index.js
//获取应用实例
const app = getApp();
const config = require('../../config.js');
Page({
  data: {
    userInfo: {},
    accountInfo:{},
    open_id:'',
    school_list:[],//校友列表
    bannerHeigh:'',
    page:1,//列表页数
    shollFlag:false,

  },
  onLoad: function () {
    if (app.globalData.accountInfo.open_id) {
      this.setData({
        userInfo: app.globalData.userInfo,
        accountInfo: app.globalData.accountInfo
      });
      this.getData();//加载数据
    } else{
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      console.log("page_app");
        var that = this;
      var url = "/pages/userinfo/userinfo?pageflag=0";  //重新授权
        wx.navigateTo({
          url: url,
        })
    //   app.getUserInfo(function (code, userInfo) {
    //     if (code) {
    //       that.setData({
    //         userInfo: userInfo,
    //       });
    //       app.getToken(code, userInfo, function (accountInfo) {
    //         var access_token = accountInfo.open_id || "";
    //         if (access_token) {
    //           that.setData({
    //             userInfo: app.globalData.userInfo,
    //             accountInfo: app.globalData.accountInfo,
    //             open_id: app.globalData.accountInfo.open_id
    //           })
    //         }
    //       });
    //     }
    //   });
    }

  },
  top:function(){console.log("yop")},
  scroll:function(){  //滚动时触发事件
     console.log("scoll");
    if (this.data.shollFlag){
      this.getData();
    }
  },
  onShow:function(){
    var height = wx.getSystemInfoSync().screenWidth*9/16;
    this.setData({
      bannerHeigh:height
    })
    // var that = this;
    // this.getData();//加载数据
  },
  getData:function(){
    var host = config.host;//查询学校列表
    var that = this;
    wx.request({
      url: host + '/api/school/getParentSchool',
      data: {
        page: that.data.page,
        size: 10 //每页显示的条数
      },
      method: 'POST',
      success: res => {
        if (res.statusCode == 200) {
          var data = res.data;
          if (data.errno == 0) {
            var school_list = data.data.data;
            if (that.data.page > 1) {
              school_list = that.data.school_list.push(school_list);
            }
            if (school_list.length >= 10) { //多个页面
              that.setData({
                page: that.data.page + 1,
                shollFlag: true, //上移加载的标识

              })
            } else {
              that.setData({
                shollFlag: false, //上移加载的标识
              })
            }

            this.setData({
              school_list: school_list
            });
          } else { //接口报错
            wx.showModal({
              title: '温馨提示',
              showCancel: false,
              content: data.errmsg,
            })
          }

        }
      }
    })
  },
  next:function(e){
    console.log(e);
    var school_id = e.currentTarget.dataset.schoolid;
    var url = '/pages/nextschoolList/nextschoolList?school_id=' + school_id;
    wx.navigateTo({
      url: url,
    })
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  onUnload:function(){
    console.log("unload");
    var url = '/pages/homepage/homepage';
    wx.switchTab({
      url: url,
    })
  },
  onHide: function () {
    console.log("hide");
  }

})
