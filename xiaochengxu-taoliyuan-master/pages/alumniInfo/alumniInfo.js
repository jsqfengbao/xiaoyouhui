import {fetchApi} from "../../api/api";
const { $Message } = require('../../dist/base/index');

Page({

    /**
     * 页面的初始数据
     */
    data: {
        user:{},
        eduction: ["高中", "中专", "大专", "本科", "硕士", "博士", "博士后", "MBA", "EMBA", "其他"],
        check:0,
        userId:0,
        showEdit:false,
        needEdit:'',
        applyId:0
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        console.log('alumniInfo-options',options)
        console.log('info-userId',options.userId)
        if (options.userId) {
            this.setData({
                userId:options.userId
            })
            this.getInfo(options.userId)

        }
        if (options.applyId) {
            this.setData({
                applyId:options.applyId,
                check:1
            })

        }

    },
    getInfo(userId) {
        let params = {
            url: 'user/queryUser',
            data:{
                queryUserId:userId
            }
        }
        fetchApi(this, params, 'post').then(res => {
            console.log(res.data.data)
            let user =res.data.data
            let eduList = user.education.split(',');
            user.education = ''
            for (let j = 0; j < eduList.length; j++) {
                user.education += this.data.eduction[parseInt(eduList[j])] + ''
            }
            if (user.isShowMobile != 1){
                let telephone = user.telephone
                if (telephone){
                    telephone = telephone.substring(0,3)+"****"+telephone.substring(7)
                    user.telephone = telephone
                }
            }
            this.setData({
                user
            })
        })
    },
    changeNeedEdit(e){
        this.setData({
            needEdit:e.detail.value
        })
    },
    handleEditCancel(){
        this.setData({
            showEdit:false
        })
    },
    checkSuccess(){
        let params = {
            url:'user/approvalUser',
            data:{
                applyId:this.data.applyId,
                status:2,
            }
        }
        fetchApi(this,params,'post').then(res=>{
            console.log('res',res)
            console.log('-------------------')
            wx.redirectTo({
                url:'/pages/checkList/checkList'
            })
        })
    },
    showEdit(){
        this.setData({
            showEdit:true
        })
    },
    handleEditOk(){
        if (!this.data.needEdit){
            $Message({
                content: '需修改内容不能为空',
                type: 'error'
            });
            return
        }
        let params = {
            url:'user/approvalUser',
            data:{
                applyId:this.data.applyId,
                status:3,
                refusedReason:this.data.needEdit
            }
        }
        this.setData({
            showEdit:false
        })
        fetchApi(this,params,'post').then(res=>{
            console.log('res',res)
            wx.redirectTo({
                url:'/pages/checkList/checkList'
            })
        })
    },
    handleSuccess(){

    },
    handleFail(){

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