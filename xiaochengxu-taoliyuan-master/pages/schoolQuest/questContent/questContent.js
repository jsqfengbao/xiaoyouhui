// hotest.js
//var Api = require('../../utils/api.js');
import {fetchApi} from "../../../api/api";

const config = require('../../../config.js');
const app = getApp();
Page({
    data: {
        title_str: '',
        content_str: '',
        phoneNum: '',
        hidden: true,
    },
    onShow: function () {

    },
    formSubmit: function (e) {
        var that = this;
        var formData = e.detail.value;
        console.log(formData)
        var postData = {
            //  "TITLE": formData.name,
            "adviceContent": formData.question_content,
            //  "mobile": formData.phone_num
        };
        var pattern = /^(13|14|15|17|18)[0-9]{9}$/;
        var flag = pattern.test(formData.phone_num);
        if (formData.question_content.length == 0 || formData.name.length == 0 || formData.phone_num.length == 0) {
            wx.showToast({
                title: '标题，问题内容，手机号码等不能为空!',
                icon: 'loading',
                duration: 1500
            })

            setTimeout(function () {
                wx.hideToast()
            }, 2000)

        } else if (formData.phone_num.length != 11 || !flag) {
            wx.showToast({
                title: '请输入11位手机号码!',
                icon: 'loading',
                duration: 1500
            })

            setTimeout(function () {
                wx.hideToast()
            }, 2000)

        } else {
            console.log(postData);
            let params = {
                url:'advice/submitQuestion',
                data: postData,

            }
            fetchApi(this,params,'post').then(res=>{
                wx.showToast({
                    title: '提交成功!',
                    icon: 'loading',
                    duration: 1500
                })

                setTimeout(function () {
                    wx.navigateBack({});
                }, 2000)
            }).catch(err=>{
                wx.showToast({
                    title: '提交失败，请稍后重试!',
                    icon: 'loading',
                    duration: 1500
                })

                setTimeout(function () {
                    wx.navigateBack({});
                }, 2000)
            })
        }
    },

    onLoad: function () {
    }
})
