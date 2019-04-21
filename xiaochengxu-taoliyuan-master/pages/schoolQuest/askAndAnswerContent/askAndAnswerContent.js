// hotest.js
//var Api = require('../../utils/api.js');
const config = require("../../../config.js");
Page({
    data: {
        viewTitle: '问答详情',
        AACDetail: [],
        hidden: true
    },

    fetchDetail: function (AACID) {
        //(AACID);
        var that = this;
        that.setData({
            hidden: false
        })
        wx.request({
            url: congif.host,
            data: {
                "REQUESTS": [{
                    "REQ_MSG_HDR": {"SERVICE_ID": "101", "OPERATE_TYPE": 3},
                    "REQ_COMM_DATA": {"ID": AACID}
                }]
            },
            method: 'POST',
            success: function (res) {
                //(res);
                that.setData({
                    AACDetail: res.data.ANSWERS[0].ANS_COMM_DATA[0]
                })

                setTimeout(function () {
                    that.setData({
                        hidden: true
                    })
                }, 300)
            }
        })
    },
    onLoad: function (options) {
        this.setData({
            hidden: true
        })
        var that = this;
        if (options.questId) {
            wx.getStorage({
                key: 'questList',
                success: function (res) {
                    var questList = JSON.parse(res.data);
                    questList.forEach(function (value, index) {
                        if (value.ID == options.questId) {
                            that.setData({
                                AACDetail: value
                            })
                        }
                    })
                },
            })
        }

        //(options);
        // this.fetchDetail(options.AACID);
    }
})


