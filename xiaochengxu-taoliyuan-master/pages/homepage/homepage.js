// pages/homepage/homepage.js
const app = getApp();
const config = require('../../config.js');
import {fetchApi} from '../../api/api.js';
import {getYMD} from "../../utils/util";

Page({

    /**
     * 页面的初始数据
     */
    data: {
        background: ['../../images/banner1.jpg', '../../images/banner2.jpg', '../../images/banner3.jpg'],
        indicatorDots: true,
        autoplay: true, //是否自动切换
        interval: 3000,//切换时间
        duration: 1000, //滑动难过的时间
        vertical: false,//滑动方向
        circular: true,//是否衔接滑动
        mainNewsList: [],
        school_id: '',//校友标识
        loadMore: false,
        page: 1,
        size: 10,
        tip: '加载中',
        navList: [
            {
                'src': '/images/home1.png',
                'title': '校友汇',
                'func': 'schoolFellow'
            },
            {
                'src': '/images/home2.png',
                'title': '活动',
                'func': 'activity'
            },
            {
                'src': '/images/home3.png',
                'title': '校友企业',
                'func': 'companyList'
            },
            {
                'src': '/images/home4.png',
                'title': '有问必答',
                'func': 'redictAskandAnswer'
            }
        ]
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        //
        wx.showLoading({
            title: '加载中',
        })
        this.getList()
    },

    getList(school_id) {

        let params = {
            url: app.API_HOST + 'activity/getRecommendList',
            data: {
                page: this.data.page,
                size: this.data.size
            }
        }
        fetchApi(this, params, 'post').then(res => {
            let data = res.data;

            let list = data.data.data;

            console.log(list)
            for (let i=0;i<list.length;i++){
                // list[i].activityTime = getYMD(new Date(list[i].activityTime),'-')
                list[i].activityTime = list[i].activityTime.substring(0,10)
            }

            this.setData({
                mainNewsList: this.data.page === 1 ? list : this.data.mainNewsList.concat(list)
            });


            if (list.length >= this.data.size) { //当前页面加载到的数据条数
                this.data.page = this.data.page + 1
                this.setData({
                    loadMore: true
                })//上移加载的标识
            } else {
                this.setData({
                    loadMore: false,
                    tip: '已经到底了'
                }) //上移加载的标识
            }


        })
    },
    schoolFellow: function () {
        var url = "/pages/associationList/associationList?school_id=" + this.data.school_id;//校友会
        wx.navigateTo({
            url: url,
        })
    },
    companyList: function () {
        var url = "/pages/companyList/companyList?school_id=" + this.data.school_id;//校友企业
        wx.navigateTo({
            url: url,
        })
    },
    redictAskandAnswer: function () {
        var url = "/pages/schoolQuest/schoolQuest?school_id=" + this.data.school_id;//有问必答
        wx.navigateTo({
            url: url,
        })
    },
    activity: function () {
        var url = "/pages/activityList/activityList?school_id=" + this.data.school_id;//活动
        wx.navigateTo({
            url: url,
        })
    },
    toNewsDetail(e) {  //跳转到新闻详情
        var id = e.currentTarget.id;
        var url = "/pages/newsDetail/newsDetail?newsID=" + id;
        wx.navigateTo({
            url: url,
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
        this.data.page = 1;
        this.getList();

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {
        if (this.data.loadMore) {
            this.getList()
        }
    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function () {

    }
})