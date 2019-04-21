// pages/inviteList/inviteList.js
import {fetchApi} from "../../api/api";

const app = getApp();

Page({

    /**
     * 页面的初始数据
     */
    data: {
        inviteList: [],
        page: 1,
        size: 10,
        tip: '加载中',
        loading: true,
        total: 0
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        this.getList()
        console.log(app.globalData.uid)
    },
    getList() {
        let params = {
            url: 'user/getInviteUserList',
            data: {
                "page": this.data.page,
                "size": this.data.size
            },
        }
        fetchApi(this, params, 'post').then(res => {
            this.setData({
                total: res.data.data.count
            })
            let list = res.data.data.data;
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
                inviteList: this.data.page == 1 ? list : this.data.inviteList.concat(list)
            });
        })
    },
    toAlumniInfo(e) {
        console.log(e)
        wx.navigateTo({
            url: '/pages/alumniInfo/alumniInfo?userId=' + e.currentTarget.dataset.userId
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

        console.log(app.globalData.uid)
        let url = '/pages/homepage/homepage'
        if (app.globalData.uid) {
            url = url + '?inviteUserId=' + app.globalData.uid
        }

        return {
            title: '快来加入校友会吧',
            path: url,
            imageUrl:'/images/banner.jpg'
        }
    }
})