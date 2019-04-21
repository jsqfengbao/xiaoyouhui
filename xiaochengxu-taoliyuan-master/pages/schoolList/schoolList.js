//index.js
//获取应用实例
const app = getApp();
const config = require('../../config.js');
import {fetchApi} from '../../api/api.js';

Page({
    data: {
        userInfo: {},
        accountInfo: {},
        open_id: '',
        schoolList: [],//校友列表
        bannerHeigh: '',
        page: 1,//列表页数
        size:10,
        loadMore: true,
        tip:'加载中'

    },
    onLoad: function () {
        this.getList()
    },

    onShow: function () {
        var height = wx.getSystemInfoSync().screenWidth * 9 / 16;
        this.setData({
            bannerHeigh: height
        })
    },
    getList() {
        var that = this;
        let params = {
            url: app.API_HOST + 'school/getParentSchool',
            data: {
                page: this.data.page,
                size: this.data.size //每页显示的条数
            },
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data;
            let list = res.data.data.data;

            this.setData({
                schoolList: this.data.page === 1 ? list : this.data.schoolList.concat(list)
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
        // fetchApi(this, params, 'post').then(res => {
        //     let params = {
        //         url: app.API_HOST + 'school/getParentSchool',
        //         data: {
        //             "page": this.data.page,
        //             "size": this.data.size
        //         },
        //     }
        //
        //
        // })
    },
    next: function (e) {
        console.log(e);
        var school_id = e.currentTarget.dataset.schoolid;
        var url = '/pages/schoolAssociationList/schoolAssociationList?school_id=' + school_id;
        wx.navigateTo({
            url: url,
        })
    },
    getUserInfo: function (e) {
        console.log(e)
        app.globalData.userInfo = e.detail.userInfo
        this.setData({
            userInfo: e.detail.userInfo,
            hasUserInfo: true
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
    onUnload: function () {
        console.log("unload");
        var url = '/pages/homepage/homepage';
        /*wx.switchTab({
          url: url,
        })*/
    },
    onHide: function () {
        console.log("hide");
    }

})
