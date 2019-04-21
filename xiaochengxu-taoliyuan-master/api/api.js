const app = getApp();
import {
    showToast,
    hideLoading
} from '../utils/util';

const noNeedLoginURLs = [
    'school/getSchoolArea',
    'school/getParentSchool',
    'auth/login_by_weixin',

];

export function fetchApi(page, params, method = 'GET') {

    if (!params.data) {
        params.data = {}
    }
    ;

    if (app.globalData.token) {
        return directRequest(page, params, method);
    } else {
        let url = params.url.replace(app.API_HOST, '');
        if (noNeedLoginURLs.indexOf(url) >= 0) {
            return directRequest(page, params, method);
        } else {
            return getToken(page).then((e) => {
                return directRequest(page, params, method)
            })
        }
    }
};

function directRequest(page, params, method = 'GET') {
    console.log('url=------------------page', page)

    let fetchApiPromise = new Promise(function (resolve, reject = () => {
    }) {
        if (params.url.indexOf(app.API_HOST) == -1) {
            params.url = app.API_HOST + params.url
        }
        //params.data['token'] = app.globalData.token;
        if (!params.data['userId']) {
            params.data['userId'] = app.globalData.uid;
        }
        params.data['_t'] = new Date().getTime();
        try {
            wx.request({
                url: params.url,
                data: params.data,
                method: method,
                header: {
                    'Content-Type': 'application/json',
                    'tao-li-yuan-token': app.globalData.token
                },
                success: function (res) {
                    console.log('请求成功');
                    hideLoading();
                    wx.hideToast();
                    wx.stopPullDownRefresh();
                    if (res.data.errno == 0) {
                        resolve(res);
                    } else if (res.data.errno == 402) {
                        //token失效 清楚机制
                        app.globalData.token = null;
                        app.globalData.uid = 0
                        wx.removeStorageSync("loginInfo" /*+ app.globalData.headquartersId*/);
                        //console.log('remove--------------->')

                        login(page).then(res => {
                            console.log('page-----------info', page)
                            page.setData({
                                modalVisible: false,
                            })
                            let options = page.options || {}
                            page.onLoad(options)
                            //wx.reLaunch({url:'/'+page.route})
                            // wx.navigateBack()
                        })
                        return;

                        page.setData({
                            modalVisible: true,
                            modalTitle: '温馨提示',
                            modalMsg: '登录过期，重新登录',
                            showOk: true,
                            showCancel: false,
                            okText: '确定',
                            cancelText: '取消',
                        })
                        page.modalOk = function (res) {
                            login(page).then(res => {
                                console.log('page-----------info', page)
                                page.setData({
                                    modalVisible: false,
                                })
                                let options = page.options || {}
                                page.onLoad(options)
                                //wx.reLaunch({url:'/'+page.route})
                                // wx.navigateBack()
                            })

                        }
                    } else if (res.data.errno == 401) {//未被加入校友会


                        page.setData({
                            modalVisible: true,
                            modalTitle: '温馨提示',
                            modalMsg: res.data && res.data.errmsg ? res.data.errmsg : 'error',
                            showOk: true,
                            showCancel: false,
                            okText: '确定',
                            cancelText: '取消',
                        })

                        page.modalOk = function (res) {
                            var url = "/pages/myinfo/myinfo";
                            wx.switchTab({
                                url: url,
                            })

                        }
                        return;


                    } else if (res.data.errno == 1) {
                        if (params.url.indexOf("school/addSchoolAssociation") != -1) {
                            page.setData({
                                modalVisible: true,
                                modalTitle: '温馨提示',
                                modalMsg: res.data && res.data.errmsg ? res.data.errmsg : 'error',
                                showOk: true,
                                showCancel: false,
                                okText: '确定',
                                cancelText: '取消',
                            })
                            page.modalOk = function (res) {
                                var url = "/pages/myinfo/myinfo";
                                wx.switchTab({
                                    url: url,
                                })

                            }
                            return;


                        } else if (params.url.indexOf("activity/getActivityList") != -1) {
                            page.setData({
                                modalVisible: true,
                                modalTitle: '温馨提示',
                                modalMsg: res.data && res.data.errmsg ? res.data.errmsg : 'error',
                                showOk: true,
                                showCancel: false,
                                okText: '确定',
                                cancelText: '取消',
                            })
                            page.modalOk = function (res) {
                                var url = "/pages/myinfo/myinfo";
                                wx.switchTab({
                                    url: url,
                                })

                            }
                            return;

                        } else {
                            page.setData({
                                modalVisible: true,
                                modalTitle: '温馨提示',
                                modalMsg: res.data && res.data.errmsg ? res.data.errmsg : 'error',
                                showOk: true,
                                showCancel: false,
                                okText: '确定',
                                cancelText: '取消',
                            })
                            page.modalOk = function (res) {
                                page.setData({modalVisible: false})

                            }
                            return;
                        }
                        reject('errno=1');
                    } else if (res.statusCode == 500 || res.statusCode == 404 || res.statusCode >= 400) {
                        showToast('服务器开小差了');
                    } else {
                        reject(res);
                        showToast(res.data.msg, page);
                    }
                },
                fail: function (error) {
                    hideLoading();
                    wx.stopPullDownRefresh();
                    showToast('网络发起失败')
                    reject(error);
                    if (page != 'app') {
                        page.setData({
                            showStyle: 3
                        })
                    }
                }
            })
        } catch (err) {
            hideLoading();
            showToast('网络错误');
            reject(err);
            if (page != 'app') {
                page.setData({
                    showStyle: 3
                })
            }
        }
    });
    return fetchApiPromise;
}

export function login(page) {
    let Loginpromise = new Promise(function (resolve, reject) {
        wx.login({
            success: function (res) {
                if (res.code) {
                    var code = res.code;
                    let loginData = {
                        /*beid: app.globalData.headquartersId,*/
                        code: code,
                        //nickname: userInfo.nickName,
                        //avatar: userInfo.avatarUrl
                    }
                    if (app.globalData.inviteUserId) {
                        loginData.inviteUserId = app.globalData.inviteUserId
                        console.log('app.globalData.inviteUserId---------->',app.globalData.inviteUserId)
                    }
                    let loginpParams = {
                        url: app.API_HOST + 'auth/login_by_weixin',
                        method: 'post',
                        header: {
                            'Content-Type': 'application/json',
                        },
                        data: loginData
                    }
                    directRequest(page, loginpParams, 'post').then((res) => {
                        console.log('换取token成功');
                        app.globalData.token = res.data.data.token;
                        app.globalData.uid = res.data.data.userId;
                        console.log(res)
                        // wx.setStorage({
                        //     key: "loginInfo" /*+ app.globalData.headquartersId*/,
                        //     data: {
                        //         'uid': res.data.userId,
                        //         'token': res.data.token,
                        //         'userInfo': res.data.userInfo
                        //         //'expire_time': Date.parse(new Date()) + 10 * 24 * 60 * 60 * 1000,
                        //     },
                        //     success: function () {
                        //         console.log('cache login info success');
                        //     },
                        //     fail: function () {
                        //         console.log('cache login info fail');
                        //     }
                        // });
                        wx.setStorageSync("loginInfo", {
                            'uid': res.data.data.userId,
                            'token': res.data.data.token,
                            //'userInfo': res.data.userInfo
                            //'expire_time': Date.parse(new Date()) + 10 * 24 * 60 * 60 * 1000,
                        });
                        resolve(res);
                    }).catch((e) => {
                        console.log('换取token失败')
                    })
                }
            },
            fail: function (res) {
                hideLoading();
                showToast('登录失败');
                reject(res)
            }
        })
    })
    return Loginpromise;
};

export function getToken(page) {
    let getTokenPromise = new Promise(function (resolve, reject) {
        try {
            var loginInfo = wx.getStorageSync('loginInfo' /*+ app.globalData.headquartersId*/);
            if (loginInfo /*&& Date.parse(new Date()) < loginInfo.expire_time*/) {
                app.globalData.token = loginInfo.token;
                app.globalData.uid = loginInfo.uid;
                resolve()
            } else {
                // if (loginInfo) {
                //     wx.removeStorageSync("loginInfo" /*+ app.globalData.headquartersId*/);
                // }
                // wx.hideLoading();
                // page.setData({
                //     showGetUserInfo: true
                // })


                // page.getUserInfo = function (e) {
                //     page.setData({
                //         showGetUserInfo: false
                //     })
                //     if (!e.detail.userInfo) {
                //         showToast('授权失败');
                //         return
                //     }
                //     let userInfo = e.detail.userInfo;
                //     login(userInfo).then(res => {
                //         resolve(res)
                //     })
                // }
                login(page).then(res => {
                    resolve(res)
                })
            }
        } catch (e) {
            reject('取同步缓存token失败');
        }
    })
    return getTokenPromise;
}

export function wxpay(page, formId = null, orderId) {
    let param = {
        url: app.API_HOST + 'order/wxpay',
        data: {
            orderId: orderId,
            formId: formId
        }
    };
    let wxpayPromise = new Promise(function (resolve, reject) {
        fetchApi(page, param, 'post').then((res) => {
            let payParam = res.data;
            wx.requestPayment({
                'timeStamp': payParam.timeStamp,
                'nonceStr': payParam.nonceStr,
                'package': payParam.package,
                'signType': payParam.signType,
                'paySign': payParam.paySign,
                success: function (_res) {
                    wx.showToast({
                        title: '支付成功',
                        icon: 'success',
                        duration: 1000,
                        success: function (_res) {
                            resolve(res);
                        }
                    });
                },
                fail: function (error) {

                    reject(error)
                }
            });
        }).catch((e) => {

            reject(e)
        });
    });
    return wxpayPromise;
}

export function getGlobalConfig(page) {
    var params = {
        url: app.API_HOST + 'config',
        data: {}
    };
    return new Promise(function (resolve, reject) {
        fetchApi(page, params).then(res => {
            app.globalConfig = res.data;
            resolve(res);
        }).catch(err => {
            reject(err)
        });
    })
}

export function addFormId(page, formId) {
    if (formId == 'the formId is a mock one') {
        return
    }
    var formIdList = app.globalData.formIdList;
    var len = formIdList.length;
    let item = {
        formId: formId,
        createTime: parseInt(new Date().getTime() / 1000)
    };
    if (len > 0) {
        formIdList[len - 1].createTime + 1 < item.createTime ? app.globalData.formIdList.push(item) : '';
    } else {
        app.globalData.formIdList.push(item);
    }
    if (app.globalData.formIdList.length >= 3 && !app.globalData.isPosting) {
        postFormId(page);
    }

}

export function postFormId(page) {
    let len = app.globalData.formIdList.length;
    var param = {
        url: app.API_HOST + 'formid/addFormid',
        data: {
            formid: JSON.stringify(app.globalData.formIdList)
        }
    }
    app.globalData.isPosting = true;
    directRequest(page, param, 'POST').then(res => {
        app.globalData.formIdList.splice(0, len);
        app.globalData.isPosting = false;
    }).catch(err => {
        app.globalData.isPosting = false;
    })

}
