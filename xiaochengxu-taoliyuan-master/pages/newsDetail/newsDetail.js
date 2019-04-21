// detail.js
const config = require("../../config.js");
import {fetchApi} from "../../api/api";

Page({
    data: {
        viewTitle: '校友新闻',
        newsDetail: {},
        loading: true,
        newsID: 0
    },

    onLoad: function (options) {
        this.setData({
            hidden: true
        })
        console.log(options);
        this.data.newsID = options.newsID
        var that = this;
        let params = {
            url: 'activity/getActivityContent',
            data: {
                'activityId': options.newsID
            }
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data.data
            //if (data.content) data.content = data.content.replace(/\<img/gi, '<img class="rich-img" ');
            //if (data.content) data.content = data.content.replace(/\<p/gi, '<p style="text-indent: 2em;" ');
            this.setData({
                newsDetail: data,
            })
        })

    },
    onShareAppMessage(e) {
        return {
            title: this.data.newsDetail.title,
            path: '/pages/newsDetail/newsDetail?newsID=' + this.data.newsID
        }
    },
    toHome(){
        console.log('--toHome--')
        wx.switchTab({
            url:'/pages/homepage/homepage'
        })
    }
})

