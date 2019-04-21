// pages/nextschoolList/nextschoolList.js
const app = getApp();
const config = require('../../config.js');
Page({

  /**
   * 页面的初始数据
   */
  
  data: {
    datalist:[],//校级下的分类


    
    accountInfo: {},
    school_id:'',
    page:1,
    shollFlag:false,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(app.globalData.accountInfo);
    this.setData({
      accountInfo: app.globalData.accountInfo
    })
    console.log(options);
    if (options.school_id) {
      this.selectList(options.school_id);
      this.setData({
        school_id: options.school_id
      })
    }
  },
  scroll:function(){
    this.selectList(this.data.school_id);//滑动时执行
  },
  selectList: function (school_id){ //查询校级分会
    var host = config.host;
    // console.log(this.data.accountInfo.user_id);
    var that = this;
    wx.request({
      url: host +'/api/school/getSchoolArea',
      data: {
        schoolId: school_id,
      },
      method: 'POST',
      success: res => {
        if (res.statusCode == 200) {
          var data = res.data;
          if (data.errno == 0) {
            var school_list = data.data;
            // if (that.data.page > 1) {
            //   school_list = that.data.school_list.push(school_list);
            // }
            // if (school_list.length >= 10) { //多个页面
            //   that.setData({
            //     page: that.data.page + 1,
            //     shollFlag: true, //上移加载的标识

            //   })
            // } else {
            //   that.setData({
            //     shollFlag: false, //上移加载的标识
            //   })
            // }

            this.setData({
              datalist: school_list
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
  homepage:function(e){ //跳转到学校首页
    console.log(e);
    var id = e.currentTarget.id;
    var that = this; 
    var host = config.host;
    wx.showModal({
      title: '温馨提示',
      content: '是否确定加入该校友会',
      success:function(res){
        if(res.confirm){
          wx.request({ //加入校友会
            url: host + '/api/school/addSchoolAssociation',
            data: {
              "schoolId": id,
              "userId": that.data.accountInfo.user_id,
            },
            header: {
              'content-type': 'application/json', // 默认值
              "tao-li-yuan-token": that.data.accountInfo.open_id
            },
            method: 'POST',
            success: res => {
              if (res.statusCode == 200) {
                var data = res.data;
                // data.errno =1:正在审核 2:申请成功 3，修改信息，重新提交 4，拒绝 0
                if (data.errno == 4) {
                  wx.showModal({
                    title: '温馨提示',
                    showCancel: false,
                    content: data.errmsg,
                  })

                } else if (data.errno == 3  ||data.errno == 0 || data.errno == 1) {
                  wx.showModal({
                    title: '温馨提示',
                    showCancel: false,
                    content: data.errmsg,
                    success: function (res) {
                      if (res.confirm) { //去补充信息
                        var url = "/pages/myinfo/myinfo";
                        wx.switchTab({
                          url: url,
                        })
                      }
                    }
                  })
                } else { //成功
                  var url = "/pages/homepage/homepage?school_id=" + id;
                  wx.navigateTo({
                    url: url,
                  })
                }
              }
            }
          }) 
        }else{
          console.log("取消加入。。。");
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