const config = require("../../config.js");
import {fetchApi} from '../../api/api.js';

const app = getApp()
Page({
    data: {
        viewTitle: '校友负责人列表',
        adminList: [],
        page: 1,
        size:10,
        tip:'加载中',
        loadMore:true,


    },
    onLoad: function (options) {
        this.getList()
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
    getList() {
        let params = {
            url: 'alumni/getAlumniAdmin',
            data: {
                page: this.data.page,
                size: this.data.size,
            }
        }
        fetchApi(this, params, 'post').then(res => {
            let list = res.data.data.data


            this.setData({
                adminList: this.data.page === 1 ? list : this.data.adminList.concat(list),
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
    onReachBottom: function () {
        if (this.data.loadMore) {
            this.getList()
        }
    },
})
