// hotest.js
const config = require('../../config.js');
import {fetchApi} from '../../api/api.js';

const app = getApp();
Page({
    data: {
        companyList: [],
        page: 1,
        size: 10,
        loadMore: false,
        tip: '加载中'
    },

    onLoad: function (options) {
        this.getList();
    },
    scroll: function () {
        if (this.data.loadMore) this.getList();

    },
    getList() {
        let params = {
            url: app.API_HOST + 'company/getCompanyList',
            data: {
                "page": this.data.page,
                "size": this.data.size
            },
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data;
            let list = res.data.data.data;
            //console.log(activityList)
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
            this.setData({
                companyList: this.data.page == 1 ? list : this.data.companyList.concat(list)
            });
        })
    },
    toDetail: function (e) {
        let id = e.currentTarget.dataset.id;
        let url = "/pages/companyDetail/companyDetail?companyId=" + id;
        wx.navigateTo({
            url: url
        })
    },
    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function () {
        this.data.page = 1;
        this.getList();

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {
        if (this.data.loadMore) {
            this.getList()
        }
    },
})
