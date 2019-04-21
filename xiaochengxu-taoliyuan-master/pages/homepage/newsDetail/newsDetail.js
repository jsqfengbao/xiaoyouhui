// detail.js
const config = require("../../../config.js");
Page({
  data: {
    viewTitle: '校友新闻',
    newsDetail: [],
    hidden: true
  },

  onLoad: function (options) {
    this.setData({
      hidden: true
    })
    console.log(options);
    var that = this;
    wx.getStorage({
      key: 'mainNewsList',
      success: function(res) {
        var newsList = JSON.parse(res.data);
        newsList.forEach(function(value,index){
          if (value.id == options.newsID){
            if (value.content) value.content = value.content.replace(/\<img/gi, '<img class="rich-img" '); 

            that.setData({
              newsDetail: value,
            })
          }
        })
      },
    })
   
  }
})

