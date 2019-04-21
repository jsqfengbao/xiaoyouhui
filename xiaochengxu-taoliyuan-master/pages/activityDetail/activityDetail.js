const app = getApp()
const config = require("../../config.js");
import {fetchApi} from '../../api/api.js';

Page({
    data: {
        detail: {},
        users: [],
        outOfData: false,
        joined: false,
        buttonColor: '',
        buttonText: '',
        loading:true,
        activityId:0
    },
    onLoad: function (options) {
        if (options.activityId) {
            this.data.activityId=options.activityId
            this.getDetail(options.activityId);
            this.getJoinedUsers(options.activityId)
        }
    },

    getDetail(activityId) {
        let params = {
            url: app.API_HOST + 'activity/getActivityContent',
            data: {
                activityId,
            },
        }
        fetchApi(this, params, 'post').then(res => {
            var data = res.data;
            //if (data.data.content) data.data.content = data.data.content.replace(/\<img/gi, '<img class="rich-img" ');
            //if (data.data.content) data.data.content = data.data.content.replace(/\<p/gi, '<p style="text-indent: 2em;" ');
            if (data.data.ifOverdue) {
                this.setData({
                    outOfData: true
                })
            }
            if (data.data.ifAddActivity == 1) {
                this.data.joined = true
            }else {
                this.data.joined = false
            }

            if (this.data.joined) {
                this.setData({
                    // buttonColor:'#ed3f14',
                    buttonColor:'#ff9900',
                    buttonText:'取消报名'
                })
            } else {
                this.setData({
                    buttonColor:'#2d8cf0',
                    buttonText:'报名参加'
                })
            }
            if (this.data.outOfData) {
                this.setData({
                    buttonColor:'#bbbec4',
                    buttonText:'结束报名'
                })
            }
            this.setData({
                detail: data.data
            })
        })
    },
    getJoinedUsers(activityId) {

        let params = {
            url: app.API_HOST + 'activity/getAddActivityUser',
            data: {
                activityId,
            },
        }
        fetchApi(this, params, 'post').then(res => {
            let users = res.data.data;
            this.setData({
                users
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
    join(e) {
        if (this.data.outOfData) {
            this.setData({
                modalVisible: true,
                modalTitle: '温馨提示',
                modalMsg: '该活动已结束报名',
                showOk: true,
                showCancel: false,
                okText: '确定',
                cancelText: '取消',
            })
            this.modalOk = function (res) {
                this.setData({
                    modalVisible: false
                })

            }
            return;
        }
        console.log(e.currentTarget.dataset.id)
        let activityId = e.currentTarget.dataset.id;
        let params = {
            url: app.API_HOST + 'activity/addOrCancelActivity',
            data: {
                activityId,
                type: this.data.joined ? 0 : 1
            },
        }
        fetchApi(this, params, 'post').then(res => {
           this.getDetail(activityId)
            this.getJoinedUsers(activityId)
        })
    },
    onShareAppMessage(e){
        return{
            title:this.data.detail.title,
            path:'/pages/activityDetail/activityDetail?activityId='+this.data.activityId
        }
    },
    toHome(){
        wx.switchTab({
            url:'/pages/homepage/homepage'
        })
    }
})


