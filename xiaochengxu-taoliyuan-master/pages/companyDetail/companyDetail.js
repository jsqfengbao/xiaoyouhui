// pages/companyList/getDetail/getDetailconst config = require("../../config.js");
const app = getApp();
import {fetchApi} from '../../api/api.js';

Page({

    /**
     * 页面的初始数据
     */
    data: {
        AACDetail: [],
        page: 1,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        if (options.companyId) {
            this.getDetail(options.companyId); //获取企业详情
        }
    },
    getDetail: function (companyId) {
        this.setData({
            hidden: false
        })
        let params = {
            url: app.API_HOST + 'company/getCompanyContent',
            data: {
                companyId
            },
        }
        fetchApi(this, params, 'post').then(res => {
            let detail = res.data.data;
            this.setData({
                detail
            })

        })
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