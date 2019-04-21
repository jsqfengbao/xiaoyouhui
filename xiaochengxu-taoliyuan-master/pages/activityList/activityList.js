const config = require("../../config.js");
const app = getApp()
import {fetchApi} from '../../api/api.js';

Page({
    data: {
        viewTitle: '活动',
        activityList: [],
        page: 1,
        size: 10,
        tip: '加载中',
    },

    // 事件处理函数
    ActivityDetails: function (e) {
        var id = e.currentTarget.id;
        var url = '/pages/activityDetail/activityDetail?ActivityID=' + id;
        wx.navigateTo({
            url: url
        })
    },

    onLoad: function (options) {
        if (options.school_id) this.setData({school_id: options.school_id});
        this.getList();//获取数据
    },

    getList() {
        let params = {
            url: app.API_HOST + 'activity/getActivityList',
            data: {
                page: this.data.page,
                size: this.data.size
            }
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data;
            let list = res.data.data.data;
            this.setData({
                activityList: this.data.page === 1 ? list : this.data.activityList.concat(list)
            });
            if (list.length >= this.data.size) { //当前页面加载到的数据条数
                this.data.page = this.data.page + 1
                this.setData({
                    loadMore: true
                })
            } else {
                this.setData({
                    loadMore: false,
                    tip: '已经到底了'
                })
            }

        })

    },
    toDetail(e){
        console.log(e.currentTarget.dataset.id)
        let activityId = e.currentTarget.dataset.id;
        let url = '/pages/activityDetail/activityDetail?activityId=' + activityId;
        wx.navigateTo({
            url: url
        })
    }
})
