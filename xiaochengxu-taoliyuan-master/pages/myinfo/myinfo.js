var app = getApp();
import {fetchApi} from '../../api/api.js';
import {showLoading} from '../../utils/util';

Page({
        data: {
            viewTitle: '我的',
            userInfo: {},
            selected: true,
            selected1: false,
            avatarUrl: "https://platform-wxmall.oss-cn-beijing.aliyuncs.com/upload/20180727/150547696d798c.png",
            localAvatar: '/images/my_avatar.png',
            url: {},
            rowList: [
                {
                    'image': '../../images/my_1.png',
                    'title': '基本信息'
                    , 'func': 'personInfo'
                    , 'icon': 'lianxi'
                },
                // {
                //     'image': '../../images/my2.png',
                //     'title': '学校信息',
                //     'func': 'schoolInfo'
                //     , 'icon': 'lianxi'
                // },
                // {
                //     'image': '../../images/my3.png',
                //     'title': '工作信息',
                //     'func': 'workInfo'
                //     , 'icon': 'lianxi'
                // },
                {
                    'image': '../../images/association.png',
                    'title': '加入校友会',
                    'func': 'toSchoolList'
                    , 'icon': 'lianxi'
                },
                {
                    'image': '../../images/invite.png',
                    'title': '我的邀请',
                    'func': 'toInviteList'
                    , 'icon': 'lianxi'
                },
                {
                    'image': '../../images/my_2.png',
                    'title': '联系我们',
                    'func': 'calling'
                    , 'icon': 'lianxi'
                },
                {
                    'image': '../../images/my6.png',
                    'title': '您的建议',
                    'func': 'suggest'
                    , 'icon': 'lianxi'
                },
                // {
                //     'image':'../../images/my_2.png',
                //     'title':'学校信息'
                // },
            ]
        },
        workInfo: function () {
            var url = "/pages/workInfo/workInfo";
            wx.navigateTo({
                url: url,
            })
        },
        schoolInfo() {
            var url = "/pages/schoolInfo/schoolInfo";
            wx.navigateTo({
                url: url,
            })
        },
        toSchoolList() {
            var url = "/pages/schoolList/schoolList";
            wx.navigateTo({
                url: url,
            })
        },
        requestGrom: function () {
            wx.showModal({
                content: '申请成立校友会需上传相关证明',
                success(res) {
                    if (res.confirm) {
                        var url = "/pages/myinfo/requestGrom/requestGrom";
                        wx.navigateTo({
                            url: url
                        })
                    } else if (res.cancel) {
                        console.log('用户点击取消')
                    }
                }
            })


        },
        personInfo: function () {
            wx.navigateTo({
                url: '/pages/baseInfo/baseInfo'
            });
        },
        suggest: function () {
            wx.navigateTo({
                url: '/pages/advice/advice'
            })
        },
        check() {
            wx.navigateTo({
                url: '/pages/checkList/checkList'
            })
        },
        calling: function () {
            wx.makePhoneCall({
                phoneNumber: '18675535470',
                success: function () {
                    console.log("拨打电话成功！")
                },
                fail: function () {
                    console.log("拨打电话失败！")
                }
            })
        },
        onLoad: function (options) {
            this.getInfo()
        },
        onGotUserInfo(e) {
            console.log(e)
            if (e.detail.errMsg.indexOf("auth den") !== -1 || e.detail.errMsg.indexOf("auth can") !== -1) {
                return
            }
            console.log(e.detail.errMsg)
            console.log(e.detail.userInfo)
            console.log(e.detail.rawData)
            let params = {
                url: 'auth/getUserInfo',
                data: {
                    userInfo: e.detail
                }
            }
            fetchApi(this, params, 'post').then(res => {
                //this.getInfo()
                this.data.user.avatar = e.detail.userInfo.avatarUrl
                this.data.user.nickname = e.detail.userInfo.nickName
                this.setData({
                    user: this.data.user
                })
            })
        },
        getUserInfo() {
            var that = this
            wx.getUserInfo({
                success(res) {
                    //const userInfo = res.userInfo
                    // const nickName = userInfo.nickName
                    // const avatarUrl = userInfo.avatarUrl
                    // const gender = userInfo.gender // 性别 0：未知、1：男、2：女
                    // const province = userInfo.province
                    // const city = userInfo.city
                    // const country = userInfo.country
                    let params = {
                        url: 'auth/getUserInfo',
                        data: {
                            userInfo: res
                        }
                    }
                    fetchApi(that, params, 'post').then(res => {
                        //that.getInfo()
                        that.data.user.avatar = res.userInfo.avatarUrl
                        that.data.user.nickname = res.userInfo.nickName
                        that.setData({
                            user: that.data.user
                        })
                    })
                }
            })
        },
        getInfo(userId) {
            let params = {
                url: 'user/queryUser',
            }
            fetchApi(this, params, 'post').then(res => {
                console.log(res.data.data)
                let user = res.data.data

                if (user.adminId) {
                    this.data.rowList.push({
                        'image': '../../images/check.png',
                        'title': '校友审核',
                        'func': 'check',
                        'icon': 'check'
                    })
                    this.setData({
                        'rowList': this.data.rowList
                    })
                }


                this.setData({
                    user
                })
            })
        },
        toInviteList(){
               wx.navigateTo({
                   url:'/pages/inviteList/inviteList'
               })
        }
    }
);
