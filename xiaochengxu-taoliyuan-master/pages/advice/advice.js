// hotest.js
//var Api = require('../../utils/api.js');
const config = require('../../config.js');
const app = getApp();
import {fetchApi} from '../../api/api.js';

Page({
    data: {
        title_str: '',
        content_str: '',
        phoneNum: '',
        hidden: true,
    },
    onShow: function () {

    },
    formSubmit(e) {
        var that = this;
        var formData = e.detail.value;
        that.setData({
            phoneNum: formData.phone_num,
            content_str: formData.question_content,
            title_str: formData.name
        })
        console.log(formData);
        var postData = {
            adviceContent: formData.question_content
        };
        var pattern = /^(13|14|15|17|18)[0-9]{9}$/;
        var flag = pattern.test(formData.phone_num);
        if (formData.question_content.length == 0 || formData.name.length == 0 || formData.phone_num.length == 0) {
            this.modalOk = () => {
                this.setData({modalVisible: false})
            }
            this.setData({
                modalVisible: true,
                modalTitle: '温馨提示',
                modalMsg: '姓名，建议内容，手机号码等不能为空!',
                showOk: true,
                showCancel: false,
                okText: '确定',
                cancelText: '取消',
            })
            return

        } else if (formData.phone_num.length != 11 || !flag) {
            this.modalOk = () => {
                this.setData({modalVisible: false})
            }
            this.setData({
                modalVisible: true,
                modalTitle: '温馨提示',
                modalMsg: '请输入正确的11位手机号码',
                showOk: true,
                showCancel: false,
                okText: '确定',
                cancelText: '取消',
            })
            return

        } else {
            console.log(postData);
            let params = {
                url: app.API_HOST + "advice/submitAdvice",
                data: postData,
            }
            fetchApi(this, params, 'post').then(res => {
                var data = res.data;

                wx.showToast({
                    title: '提交成功!',
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
