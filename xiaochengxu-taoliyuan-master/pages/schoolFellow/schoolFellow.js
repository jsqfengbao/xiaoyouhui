// pages/schoolFellow/schoolFellow.js
const app = getApp();
const config = require('../../config.js');
import {fetchApi} from '../../api/api.js';
import {showLoading} from '../../utils/util';

Page({

    /**
     * 页面的初始数据
     */
    data: {
        TotalCount: 0, //校友人数
        selectallList: [],//查询到校友会成员
        searchList: [],//搜索后从所有人中筛选出来的数据
        page: 1,
        shollFlag: false,
        noimage: "https://platform-wxmall.oss-cn-beijing.aliyuncs.com/upload/20180727/150547696d798c.png", //没有获取图片的时候用这个
        distance: 0,//校友距离自己当前的位置
        eduction: ["高中", "中专", "大专", "本科", "硕士", "博士", "博士后", "MBA", "EMBA", "其他"],

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {

        this.selectfriend();//查询成员人数
    },
    toAlumniAdminList: function () {
        var url = "/pages/alumniAdminList/alumniAdminList";//各地校友手机列表
        wx.navigateTo({
            url: url,
        })
    },
    searchInput: function (res) { //输入的时候搜索内容
        var _this = this;
        var selectallList = _this.data.selectallList; //联系人列表
        console.log(res.detail.value);
        if (res.detail.value) {
            selectallList.forEach(function (value, index) {
                if (value.CHARGE_MAN.indexOf(res.detail.value) > -1 || value.mobile.indexOf(res.detail.value) > -1) {
                    _this.setData({searchList: value})
                }
            })
        } else {
            _this.setData({searchList: []})
        }

    },

    selectfriend() {
        var host = config.host;
        var that = this;
        var param = {
            //userId: getApp().globalData.accountInfo.user_id,
            page: that.data.page,
            size: 10
        }
        let params = {
            url: app.API_HOST + "alumni/getAlumniList",
            data: param,
        }
        fetchApi(this, params, 'post').then(res => {
            console.log('get------------------>', res)
            var data = res.data;

            var activityList = data.data.data;
            var eduction = that.data.eduction;
            // var longitude = app.globalData.userData.LATITUDE; //自己当前的位置
            // var latitude= app.globalData.userData.LONGITUDE;
            for (var i = 0; i < activityList.length; i++) {
                var educationList = activityList[i].education.split(",");
                for (var j = 0; j < eduction.length; j++) {
                    for (var k = 0; k < educationList.length; k++) {
                        if (educationList[k] == j) {
                            if (!activityList[i].flag) {
                                activityList[i].flag = true;
                                activityList[i].education = eduction[j];
                            } else {
                                activityList[i].flag = false;
                                activityList[i].education = activityList[i].education + ' ' + eduction[j];
                            }

                        }
                    }

                }
            }
            if (that.data.page > 1) {
                activityList = that.data.selectallList.push(activityList);
            }
            if (data.data.count >= 10) { //当前页面加载到的数据条数
                that.setData({
                    page: that.data.page + 1,
                    shollFlag: true, //上移加载的标识
                })
            } else {
                that.setData({
                    shollFlag: false, //上移加载的标识
                })
            }
            that.setData({
                selectallList: activityList,
                TotalCount: (data.data.totalPages - 1) * 10 + data.data.count
            });
            setTimeout(function () {
                that.setData({
                    hidden: true
                })
            }, 300);
        })
    },
    showMap: function (e) {  //查看地图上显示的当前所在位置
        wx.setStorageSync('AAListData', this.data.selectallList)
        var url = '/pages/showMap/showMap';
        wx.navigateTo({
            url: url
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