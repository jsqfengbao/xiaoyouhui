// pages/alumniList/alumniList.js
import {fetchApi} from "../../api/api";

Page({

    /**
     * 页面的初始数据
     */
    data: {
        defaultImage: '/images/default.png',
        tip: '加载中',
        loadMore: true,
        page: 1,
        size: 10,
        alumniList: [],
        TotalCount: 0, //校友人数
        //selectallList: [],//查询到校友会成员
        searchList: [],//搜索后从所有人中筛选出来的数据
        noImage: "https://platform-wxmall.oss-cn-beijing.aliyuncs.com/upload/20180727/150547696d798c.png", //没有获取图片的时候用这个
        distance: 0,//校友距离自己当前的位置
        eduction: ["高中", "中专", "大专", "本科", "硕士", "博士", "博士后", "MBA", "EMBA", "其他"],
        schoolAreaId: 0,
        searchName: '',
        search:false

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        if (options.schoolAreaId) {
            let schoolAreaId = options.schoolAreaId
            this.data.schoolAreaId = schoolAreaId
            this.getList(schoolAreaId)
        }
    },


    getList(schoolAreaId, queryName) {
        let data = {
            schoolAreaId,

        }
        if (queryName) {
            data.queryName = queryName
            data.size = 9999
        } else {
            data.page = this.data.page
            data.size = this.data.size
        }
        let params = {
            url: 'alumni/getAlumniList',
            data
        }
        fetchApi(this, params, 'post').then(res => {
            let list = res.data.data.data

            for (let i = 0; i < list.length; i++) {
                let eduList = list[i].education.split(',');
                list[i].education = ''
                for (let j = 0; j < eduList.length; j++) {
                    list[i].education += this.data.eduction[parseInt(eduList[j])] + ''
                }
            }

            if (!queryName) {
                this.setData({
                    alumniList: this.data.page === 1 ? list : this.data.alumniList.concat(list),
                    totalCount: res.data.data.count
                })
                if (list.length >= this.data.size) { //当前页面加载到的数据条数
                    this.data.page = this.data.page + 1
                    this.setData({
                        loadMore: true
                    })
                } else {
                    this.setData({
                        loadMore: false,
                        tip: '已经到底了'
                    })
                }
            } else {
                this.setData({
                    alumniList: list,
                    totalCount: list.length,
                    search:true
                })
                this.setData({
                    loadMore: false,
                    tip: list.length==0?'未找到相关校友':'搜索完成'
                })
            }

        })
    },

    getAdmin() {
        let params = {
            url: 'alumni/getAlumniAdmin',

        }
    },

    changeSearchName(e) {
        this.setData({
            searchName: e.detail.value
        })
    },

    toAlumniSearch() {
        let searchName = this.data.searchName
        if (!searchName) {
            wx.showModal({
                'title': '提示',
                'content': '请输入要搜索的校友姓名',
                'showCancel': false
            })
            return;
        }
        this.getList(this.data.schoolAreaId, searchName)

        // wx.navigateTo({
        //     url:'/pages/alumniSearch/alumniSearch?searchName='+searchName+'&schoolAreaId='+this.data.schoolAreaId
        // })
    },

    previewImg(e) {

        let url = e.currentTarget.dataset.url;
        if (url) {
            wx.navigateTo({
                url: '/pages/previewImg/previewImg?url=' + url
            })
        }
    },
    toAlumniAdminList: function () {
        wx.navigateTo({
            url: "/pages/alumniAdminList/alumniAdminList",
        })
    },
    toPersonalInfo(e) {
        let userId = e.currentTarget.dataset.uid;
        console.log(userId)
        wx.navigateTo({
            url: "/pages/alumniInfo/alumniInfo?userId=" + userId,
        })
    },

    showMap: function (e) {  //查看地图上显示的当前所在位置
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
        this.setData({
            search:false
        })
        this.data.page = 1
        this.getList(this.data.schoolAreaId)
    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {
        if (this.data.loadMore) {
            this.getList(this.data.schoolAreaId)
        }
    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function () {

    }
})