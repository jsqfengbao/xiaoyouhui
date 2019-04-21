// pages/alumniSearch/alumniSearch.js
import {fetchApi} from "../../api/api";

Page({

    /**
     * 页面的初始数据
     */
    data: {
        searchName: '',
        schoolAreaId:0
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        if (options.searchName && options.schoolAreaId) {
            this.data.schoolAreaId = options.schoolAreaId
            this.setData({
                searchName: options.searchName
            })
        }
        if (this.data.searchName && this.data.schoolAreaId) {
            this.getList()
        }
    },

    getList() {
        let params = {
            url: 'alumni/getAlumniList',
            data: {
                schoolAreaId:this.data.schoolAreaId,
                queryName:this.data.searchName,
                page: this.data.page,
                size: this.data.size,
            }
        }
        fetchApi(this, params, 'post').then(res => {
            let list = res.data.data.data

            for (let i = 0; i < list.length; i++) {
                let eduList = list[i].education.split(',');
                list[i].education = ''
                for (let j = 0; j < eduList.length; j++) {
                    list[i].education += this.data.eduction[parseInt(eduList[j])] + ''
                }
            }

            this.setData({
                alumniList: this.data.page === 1 ? list : this.data.alumniList.concat(list),
                totalCount: res.data.data.count
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