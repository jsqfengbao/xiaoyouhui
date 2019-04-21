import {hideLoading, showToast} from "./utils/util";

const util = require('utils/util.js');
const config = require('config.js');
let updateManager = '';
if (wx.getUpdateManager) {
    updateManager = wx.getUpdateManager()
}
App({
    HOST: config.host,
    API_HOST: config.host + '/api/',
    globalData: {
        'userInfo': {},//用户信息

        'winWidth': '',//手机宽
        'winHeight': '',//手机高

        "joinFlag": 0,//是否加入校友会的标识
        "inviteUserId": 0

    },
    onHide: function () {
        console.log("==========appOnHide============");
    },
    onLaunch: function (option) {
        console.log('option', option)
        if (option.query.inviteUserId) {
            this.globalData.inviteUserId = option.query.inviteUserId
            console.log('this.globalData.inviteUserId',this.globalData.inviteUserId)
        }
        if (updateManager != '') {
            updateManager.onCheckForUpdate(function (res) {
                // 请求完新版本信息的回调
                if (res.hasUpdate) {
                    updateManager.onUpdateReady(function () {
                        wx.showModal({
                            title: '更新提示',
                            content: '新版本已经准备好，是否重启应用？',
                            success: function (res) {
                                if (res.confirm) {
                                    // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
                                    updateManager.applyUpdate()
                                }
                            }
                        })
                    })
                }
            })
        }
        // wx.login({
        //     success: function (res) {
        //         if (res.code) {
        //             var code = res.code;
        //             wx.request({
        //                 url: app.API_HOST + 'auth/login_by_weixin',
        //                 method: 'post',
        //                 data: {
        //                     code: code,
        //                 },
        //                 header: {'Content-Type': 'application/json'},
        //                 success(res) {
        //                     if (res.errno === 0) {
        //                         wx.setStorageSync("loginInfo", {
        //                             'uid': res.data.userId,
        //                             'token': res.data.token,
        //                             'expire_time': Date.parse(new Date()) + 12 * 60 * 60 * 1000 -20,
        //                         });
        //                     }
        //                 }
        //             })
        //         }
        //     },
        //     fail: function (res) {
        //         hideLoading();
        //         showToast('登录失败');
        //         reject(res)
        //     }
        // })

        // wx.checkSession({
        //     success(res) {
        //         console.log(res)
        //         console.log("未失效")
        //     },
        //     fail() {
        //         console.log("已失效")
        //     }
        // })
        //
        // wx.getSetting({
        //     success(res) {
        //         console.log(res.authSetting)
        //         // res.authSetting = {
        //         //   "scope.userInfo": true,
        //         //   "scope.userLocation": true
        //         // }
        //     }
        // })
        /*wx.chooseAddress({
            success(res) {
                console.log(res.userName)
                console.log(res.postalCode)
                console.log(res.provinceName)
                console.log(res.cityName)
                console.log(res.countyName)
                console.log(res.detailInfo)
                console.log(res.nationalCode)
                console.log(res.telNumber)
            }
        })*/
        //wx.getRecorderManager().start()
        /*wx.getSetting({
            success(res) {
              console.log(res)
                if (!res.authSetting['scope.record']) {
                    wx.authorize({
                        scope: 'scope.record',
                        success() {
                        },
                        fail(){
                          wx.showModal({'title':'','content':'为授权录音权限','confirmText':'前往设置',success(){
                            wx.openSetting({
                                success(res) {
                                    console.log(res.authSetting)

                                }
                            })
                              }})
                        }
                    })
                }
            }
        })*/
    },
    onShow: function (options) {
        //获取手机屏幕大小
        this.winSize();
    },

    winSize: function (cb) {
        var that = this;
        var sysInfo = wx.getSystemInfoSync();
        var winWidth = sysInfo.windowWidth || "";
        var winHeight = sysInfo.windowHeight || "";
        that.globalData.winWidth = winWidth;
        that.globalData.winHeight = winHeight;
        if (typeof cb == 'function') cb(winWidth, winHeight);
    },


})
