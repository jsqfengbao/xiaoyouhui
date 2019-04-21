const app = getApp();
const config = require('../../config.js');
import {fetchApi} from '../../api/api.js';

Page({

    /**
     * 页面的初始数据
     */

    data: {
        datalist: [],//校级下的分类
        school_id: '',
        page: 1,
        shollFlag: false,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        console.log(options);
        if (options.school_id) {
            this.selectList(options.school_id);
            this.setData({
                school_id: options.school_id
            })
        }
    },

    selectList(school_id) { //查询校级分会
        let params = {
            url: app.API_HOST + 'school/getSchoolArea',
            data: {
                schoolId: school_id,
            },
        }
        fetchApi(this, params, 'post').then(res => {
            var data = res.data;

            var school_list = data.data;
            /*for (let i=0;i<school_list.length;i++){
                if (school_list[i].regionValue.length==1){
                    let name = school_list[i].regionValue[0].schoolName;
                    school_list[i].regionValue[0].schoolName = name.substring(0,name.length-2)
                }
            } */
            this.setData({
                datalist: school_list
            })
        })
    },
    showDetail(e){
        let index = e.currentTarget.id
        this.data.datalist[index].show = !this.data.datalist[index].show
        this.setData({
            datalist:this.data.datalist
        })
    },
    apply(e) { //跳转到学校首页
        console.log(e);
        console.log(e.currentTarget.dataset.name)
        let id = e.currentTarget.id;
        let that = this;
        this.setData({
            modalVisible: true,
            modalTitle: '加入<'+e.currentTarget.dataset.name+"> ？",
            modalMsg: '只能加入一个校友分会，请谨慎选择，加入后可以看到全国各地本校校友',
            showOk: true,
            showCancel: true,
            okText: '确定',
            cancelText: '取消',
        })
        this.modalOk = function () {
            this.setData({modalVisible: false})
            let params = {
                url: app.API_HOST + 'school/addSchoolAssociation',
                data: {
                    "schoolId": id,
                }
            }
            fetchApi(that, params, 'post').then(res => {

                if (res.data.data.state==1){
                    that.setData({
                        modalVisible: true,
                        modalTitle: '温馨提示',
                        modalMsg: '申请成功，审核中',
                        showOk: true,
                        showCancel: false,
                        okText: '确定',
                        cancelText: '取消',
                    })
                    that.modalOk = function () {
                        that.setData({modalVisible: false})
                        wx.switchTab({
                            url: "/pages/homepage/homepage?school_id=" + id,
                        })
                    }
                }
                if (res.data.data.state==2){
                    that.setData({
                        modalVisible: true,
                        modalTitle: '温馨提示',
                        modalMsg: '已加入过该学校校友会',
                        showOk: true,
                        showCancel: false,
                        okText: '确定',
                        cancelText: '取消',
                    })
                    that.modalOk = function () {
                        that.setData({modalVisible: false})
                        wx.switchTab({
                            url: "/pages/homepage/homepage?school_id=" + id,
                        })
                    }
                }
            })
        },
        this.modalCancel=()=>{this.setData({modalVisible: false})}
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