// pages/checkList/checkList.js
import {fetchApi} from "../../api/api";

Page({

    /**
     * 页面的初始数据
     */
    data: {
        noData:false,
        page:1,
        size:10,
        loadMore:true,
        tip:'加载中',
        userList:[]
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        console.log('111111111111111111111111111111111111111')

        this.getList()
    },
    getList() {
        let params = {
            url:  'user/getApplyingUser',
            data: {
                "page": this.data.page,
                "size": this.data.size
            },
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data;
            let list = res.data.data;
            console.log(list)
            this.setData({
                userList:  list
            });
            if (list.length==0){
                this.setData({
                    noData:true
                })
            }
        })
    },
    toAlumniInfo(e){
        wx.navigateTo({
            url: '/pages/alumniInfo/alumniInfo?userId='+e.currentTarget.dataset.userId+'&applyId='+e.currentTarget.dataset.applyId
        })
    },
    checkSuccess(e){
        let params = {
            url:'user/approvalUser',
            data:{
                applyId:e.currentTarget.dataset.applyId,
                status:2,
            }
        }
        fetchApi(this,params,'post').then(res=>{
            console.log('res',res)
            this.getList()
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