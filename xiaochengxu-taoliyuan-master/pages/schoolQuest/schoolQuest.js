// pages/schoolQuest/schoolQuest.js
const app = getApp();
const config = require("../../config.js")
import {fetchApi} from '../../api/api.js';

Page({

    /**
     * 页面的初始数据
     */
    data: {
        winheight: app.globalData.winHeight,
        hotest: []
    },
    answarContent: function (e) { //跳转到回答页面
        var questId = e.currentTarget.id;
        var url = "/pages/schoolQuest/askAndAnswerContent/askAndAnswerContent?questId=" + questId;//有问必答
        wx.navigateTo({
            url: url,
        })
    },
    cancel: function (e) {
        var id = e.currentTarget.id; //问题id
        var that = this;
        var param = {
            //userId: getApp().globalData.accountInfo.user_id,
            page: that.data.page,
            size: 10
        }
        let params = {
            url: config.host,
            data: param,
        }
        fetchApi(this, params, 'post').then(res => {
            console.log("删除成功");
            var hotest = that.data.hotest;
            hotest.forEach(function (value, index) {
                if (value.ID == id) {
                    hotest.splice(index, 1);
                    that.setData({
                        hotest: hotest
                    })
                }
            })
        })

    },

    fetchData() {
        var that = this;
        let params = {
            url: app.API_HOST + "advice/submitQuestion",
            data: {
                "REQUESTS": [{
                    "REQ_MSG_HDR": {"SERVICE_ID": "1004", "OPERATE_TYPE": 3},
                    "REQ_COMM_DATA": {"USER_ID": getApp().globalData.accountInfo.user_id}
                }]
            },
        }
        fetchApi(this, params, 'post').then(res => {
            console.log(res);
            var data = res.data.ANSWERS[0].ANS_COMM_DATA;
            if (data) {
                wx.setStorage({
                    key: 'questList',
                    data: JSON.stringify(data),
                })
                that.setData({
                    hotest: data
                })
                setTimeout(function () {
                    that.setData({
                        hidden: true
                    })
                }, 300)
            }
        })


    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        this.setData({
            hidden: true
        })
        //this.fetchData();
    },
    askAQuestion: function () {
        var url = "/pages/schoolQuest/questContent/questContent";//有问必答
        wx.navigateTo({
            url: url,
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
        // this.fetchData();
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