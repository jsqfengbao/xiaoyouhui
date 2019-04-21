const app = getApp();
import {fetchApi} from '../../api/api.js';

var pattern = /^(13|14|15|16|17|18)[0-9]{9}$/;
const config = require("../../config.js");
Page({
    data: {
        hideVerifyPhone: true,
        hideBindNewPhone: true,
        oldCode: '',
        oldCodeBtnDisabled: false,
        oldCodeStatus: '获取验证码',
        nextStepDisabled: false,
        newPhone: '',
        newCode: '',
        newCodeBtnDisabled: false,
        newCodeStatus: '获取验证码',
        bindNewPhoneBtnDisabled: false,
        codeInterval: 60,
        hidden: true,
        numberFlag: 1 //默认第一个手机号码
    },
    onLoad: function (options) {

    },

    inputPhone: function (e) {
        this.setData({
            newPhone: e.detail.value
        })
    },
    inputNewCode: function (e) {
        this.setData({
            newCode: e.detail.value
        })
    },
    sendCodeToNewPhone() {  //获取验证码
        var that = this,
            newPhone = that.data.newPhone;
        if (!pattern.test(newPhone)) {
            this.modalOk = () => {
                this.setData({modalVisible: false})
            }
            this.setData({
                modalVisible: true,
                modalTitle: '温馨提示',
                modalMsg: '请输入正确的手机号码',
                showOk: true,
                showCancel: false,
                okText: '确定',
                cancelText: '取消',
            })
            return;
        }
        that.setData({
            newCodeStatus: '正在发送...',
            newCodeBtnDisabled: true
        })
        let params = {
            url: app.API_HOST + "user/sendSms",
            data: {
                "mobile": newPhone,//手机号码
            },
        }
        fetchApi(this, params, 'post').then(res => {
            console.log("获取验证码成功");
        })

    },
    bindNewPhone() { //校验验证码
        var newPhone = this.data.newPhone,
            newCode = this.data.newCode;
        var that = this;
        if (!newPhone || !newCode) {
            return;
        }
        if (!pattern.test(newPhone)) {
            this.modalOk = () => {
                this.setData({modalVisible: false})
            }
            this.setData({
                modalVisible: true,
                modalTitle: '温馨提示',
                modalMsg: '请输入正确的手机号码',
                showOk: true,
                showCancel: false,
                okText: '确定',
                cancelText: '取消',
            })
            return false;
        }
        // that.setData({
        //     hidden: false
        // });

        let params = {
            url: app.API_HOST + "user/validateSmsCode",
            data: {
                mobile: newPhone,//手机号码
                smsCode: newCode//验证码
            }
        }
        fetchApi(this, params, 'post').then(res => {
            var data = res.data
            that.setData({
                hidden: true
            });
            wx.showToast({
                title: '验证成功!',
                icon: 'loading',
                duration: 1000
            })
            let pages = getCurrentPages();//当前页面
            let prevPage = pages[pages.length - 2];//上一页面
            prevPage.setData({//直接给上移页面赋值
                telephone: newPhone
            });

            setTimeout(function () {
                that.setData({
                    hidden: true
                });
                wx.navigateBack({delta: 1})
            }, 800)
        }).catch(res => {
            setTimeout(function () {
                that.setData({
                    hidden: true
                })
            }, 800)
        })
    }
})
