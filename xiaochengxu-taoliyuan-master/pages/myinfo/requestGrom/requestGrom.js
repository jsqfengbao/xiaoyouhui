Page({

    /**
     * 页面的初始数据
     */
    data: {
        region: ['请选择省', '市', '区'],
        uplodUrl: ''  //上传之后生成的图片路径
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {

    },
    uploadPhoto: function () {

    },
    uploadPhoto: function () {
        var timestamp = Date.parse(new Date());
        wx.chooseImage({
            sourceType: ['album', 'camera'],
            success: function (res) {
                var tempFilePaths = res.tempFilePaths;
                wx.uploadFile({
                    url: 'https://ourtaoliyuan.com/uploadFile',
                    filePath: tempFilePaths[0],
                    name: timestamp + "_" + Math.random().toFixed(3) * 1000,
                    success: function () {
                        console.log("不晓得上传到哪里");
                    }
                })
            },
        })
    },
    bindRegionChange: function (e) { //省市区的选择
        console.log('picker发送选择改变，携带值为', e.detail.value)
        this.setData({
            region: e.detail.value
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