// pages/datalist/associationList.js
import {fetchApi} from "../../api/api";

Page({

    /**
     * 页面的初始数据
     */
    data: {
        datalist: [],
        mine:''
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        this.getList()
    },
    getList() {
        let params = {
            url: 'school/getMyAndAllSchoolArea',
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data.data;
            for (let i=0;i<data.all.length;i++){
                if (data.all[i].regionValue.length===1){
                    data.all[i].show=true
                } else {
                    data.all[i].show=false
                }
            }
            this.setData({
                'datalist': data.all,
                'mine':data.mine
            })
        })
    },
    showDetail(e){
        let index = e.currentTarget.id
        this.data.datalist[index].show = !this.data.datalist[index].show
        this.setData({
            datalist:this.data.datalist
        })
    },
    showMap: function (e) {  //查看地图上显示的当前所在位置
        var url = '/pages/showMap/showMap';
        wx.navigateTo({
            url: url
        })
    },
    toAlumniList(e){
        console.log(e)
        let id = e.currentTarget.id
        wx.navigateTo({
            url:'/pages/alumniList/alumniList?schoolAreaId='+id
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