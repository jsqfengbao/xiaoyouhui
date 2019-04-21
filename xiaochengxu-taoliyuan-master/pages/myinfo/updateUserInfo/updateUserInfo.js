// hotest.js
const config = require("../../../config.js");

Page({
    data: {
        viewTitle: '修改个人简介',
        introdu: '',//查询出简介内容
        hidden: true
    },

    fetchDetail: function (op) {

    },
    formSubmit: function (e) {
        var that = this;
        var formData = e.detail.value;
        console.log('-------------------->', formData)
        if (formData.new_value.length == 0) {
            wx.showToast({
                title: '内容不能为空!',
                icon: 'loading',
                duration: 800
            })

            setTimeout(function () {
                wx.hideToast()
            }, 1200)

        } else {
            var url = '/pages/baseInfo/baseInfo?personProfile=' + formData.new_value;
            wx.navigateTo({
                url: url
            })
        }
    },
    onLoad: function (options) {
        console.log(options);
        if (options.personProfile) {
            this.setData({
                introdu: options.personProfile
            })
        }

    },
    onshow: function () {
        // 获取上次填写的内容,如果有就复制
        var value = wx.getStorage({
            key: 'introdu',
            success: function (res) {
                that.setData({
                    introdu: introdu
                })
            },
        })

    }
})


