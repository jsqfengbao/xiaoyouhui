var app = getApp();
import {fetchApi} from "../../api/api";
import {geoFail} from "../../utils/util";

Page({
    data: {
        url: '',
        listData: [],
        scale: '15',
        Height: '0',
        controls: '40',
        latitude: '',
        longitude: '',
        markers: [],
        geoSuccess:false,
        noGeo:false
    },
    onReady: function (e) {
        // 使用 wx.createMapContext 获取 map 上下文
        this.mapCtx = wx.createMapContext('map');
    },
    onLoad: function (options) {
        this.getLocations()
    },
    getLocations(update){
        var that = this;
        fetchApi(this, {url: 'alumni/getAllLonAndLat'}, 'post').then(res => {
            console.log(res,'------------')
            if (!res.data.data){
                that.setData({
                    noGeo:true
                })
                return;
            }else {
                that.setData({
                    noGeo:false
                })
            }


            let list = res.data.data.data
            let len = list.length

            for (let i = 0; i < len; i++) {
                let dic = [];
                dic['id'] = i;
                dic['placeName'] = list[i].name;
                dic['placeImageUrl'] = list[i].avatar;
                dic['placeLongitude'] = list[i].longitude;
                dic['placeLatitude'] = list[i].latitude;
                this.data.listData.push(dic);

            }
            wx.getLocation({
                type: 'gcj02', //返回可以用于wx.openLocation的经纬度
                success: (res) => {
                    if (update){
                        that.setData({
                            geoSuccess:true
                        })
                    }
                    that.setData({
                        markers: that.getSchoolMarkers(),
                        scale: 12,
                        longitude: res.longitude,
                        latitude: res.latitude
                    })
                },
                fail:geoFail
            });
        })
    },
    updateLocation(e){
        let that = this
        wx.getLocation({
            type: 'gcj02',
            success(res) {
                console.log(res)
                that.data.latitude = res.latitude
                that.data.longitude = res.longitude
                that.setData({
                    geoSuccess: true
                })
                let params = {
                    url:'alumni/updateLatAndLon',
                    data:{
                        latitude:res.latitude,
                        longitude:res.longitude
                    }
                }
                fetchApi(that,params,'post').then(res=>{

                    that.getLocations(1)
                })
            },
            fail:geoFail
        })
    },
    controltap(e) {
        console.log(e)
        this.moveToLocation();
    },
    getSchoolMarkers() {
        var markers = [];
        for (let item of this.data.listData) {
            let marker = this.createMarker(item);
            markers.push(marker)
        }
        return markers;
    },
    moveToLocation: function () {
        this.mapCtx.moveToLocation()
    },
    strSub: function (a) {
        var str = a.split(".")[1];
        str = str.substring(0, str.length - 1)
        return a.split(".")[0] + '.' + str;
    },
    createMarker(point) {
        let latitude = point.placeLatitude;
        let longitude = point.placeLongitude;
        let anchorX = -6*point.placeName.length;
        let anchorY = -38;

        return {
            id: point.id || 0,
            name: point.placeName || '',
            title: point.placeName || '',
            latitude: latitude,
            longitude: longitude,
            iconPath: '/images/location.png',
            //iconPath:point.placeImageUrl,
            callout: {
                content: point.placeName
            },
            color: 'red',
            label: {
                anchorX,
                anchorY,
                content: point.placeName,
                color: 'red',
                textAlign: 'center',
                //borderColor: 'blue',
                //bgColor: 'blue'

            },
            width: 30,
            height: 30
        }
    },

})