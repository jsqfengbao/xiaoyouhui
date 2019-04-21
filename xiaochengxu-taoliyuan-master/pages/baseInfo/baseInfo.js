const app = getApp();
const config = require("../../config.js");
import {fetchApi} from '../../api/api.js';
import {geoFail} from "../../utils/util";

var pattern = /^(13|14|15|16|17|18|19)[0-9]{9}$/;
Page({
    data: {
        haveSubmitted:false,
        nativeCity: null,
        nativeProvince: null,
        nativePosition: null,
        nativePlace: ['请选择省', '市', '区'],
        viewTitle: '基本信息',
        //userInfo: {},
        personProfile: '',//简介
        name: '',
        telephone: '',//手机号码
        isShowMobile: 1, //手机号码显示的状态
        latitude: 0,
        longitude: 0,
        hasOldGeo: false,
        geoSuccess: false,
        oldPhone: '',
        showCode: false,
        codeSended: false,
        smsCode: '',
        sending: false,
        clicked:false,
        wechat:'',
        qq:'',

        // 学校信息
        userData: {},
        eindex: 23, //入学时间编号id
        entranceyear: "请选择入学时间",
        gindex: 27,
        gyear: "请选择毕业时间",
        hidden: true,
        checkBox1: false,
        checkBox2: false,
        checkBox3: false,
        checkBox4: false,
        checkBox5: false,
        checkBox6: false,
        checkBox7: false,
        checkBox8: false,
        checkBox9: false,
        checkBox10: false,
        degree: '',
        array: ['1978前', '1978', '1979', '1980', '1981', '1982', '1983', '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992', '1993', '1994', '1995', '1996', '1997', '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020','2021','2022','2023','2024','2025','2026','2027','2028'],
        objectArray: [
            {
                id: 0,
                name: '1978前'
            },
            {
                id: 1,
                name: '1978'
            },
            {
                id: 2,
                name: '1979'
            },
            {
                id: 3,
                name: '1980'
            },
            {
                id: 4,
                name: '1981'
            },
            {
                id: 5,
                name: '1982'
            },
            {
                id: 6,
                name: '1983'
            },
            {
                id: 7,
                name: '1984'
            },
            {
                id: 8,
                name: '1985'
            },
            {
                id: 9,
                name: '1986'
            },
            {
                id: 10,
                name: '1987'
            },
            {
                id: 11,
                name: '1988'
            },
            {
                id: 12,
                name: '1989'
            },
            {
                id: 13,
                name: '1990'
            },
            {
                id: 14,
                name: '1991'
            },
            {
                id: 15,
                name: '1992'
            },
            {
                id: 16,
                name: '1993'
            },
            {
                id: 17,
                name: '1994'
            },
            {
                id: 18,
                name: '1995'
            },
            {
                id: 19,
                name: '1996'
            },
            {
                id: 20,
                name: '1997'
            },
            {
                id: 21,
                name: '1998'
            },
            {
                id: 22,
                name: '1999'
            },
            {
                id: 23,
                name: '2000'
            },
            {
                id: 24,
                name: '2001'
            },
            {
                id: 25,
                name: '2002'
            },
            {
                id: 26,
                name: '2003'
            },
            {
                id: 27,
                name: '2004'
            },
            {
                id: 28,
                name: '2005'
            },
            {
                id: 29,
                name: '2006'
            },
            {
                id: 30,
                name: '2007'
            },
            {
                id: 31,
                name: '2008'
            },
            {
                id: 32,
                name: '2009'
            },
            {
                id: 33,
                name: '2010'
            }
            ,
            {
                id: 34,
                name: '2011'
            },
            {
                id: 35,
                name: '2012'
            },
            {
                id: 36,
                name: '2013'
            },
            {
                id: 37,
                name: '2014'
            },
            {
                id: 38,
                name: '2015'
            },
            {
                id: 39,
                name: '2016'
            },
            {
                id: 40,
                name: '2017'
            },
            {
                id: 41,
                name: '2018'
            },
            {
                id: 42,
                name: '2019'
            },
            {
                id: 43,
                name: '2020'
            },
            {
                id: 44,
                name: '2021'
            },
            {
                id: 45,
                name: '2022'
            },
            {
                id: 46,
                name: '2023'
            },
            {
                id: 47,
                name: '2024'
            },
            {
                id: 48,
                name: '2025'
            },
            {
                id: 49,
                name: '2026'
            },
            {
                id: 50,
                name: '2027'
            },
            {
                id: 51,
                name: '2028'
            }
        ],



        // 工作信息
        region: ['请选择省', '市', '区'],

    },

    // 加载三种信息
    onLoad(options) {

        let params = {
            url: app.API_HOST + 'user/queryUser', //查询个人信息
        }
        fetchApi(this, params, 'post').then(res => {


            // 基本信息
            var data = res.data;
            if (data.data.latitude && parseFloat(data.data.longitude.toString()) !== 0) {
                this.setData({
                    hasOldGeo: true
                })
                this.setData({
                    longitude: data.data.longitude,
                    latitude: data.data.latitude
                })
            }
            if (data.data.nativeCity && data.data.nativeProvince && data.data.nativePosition) {
                this.setData({
                    nativePlace: data.data.nativeProvince + data.data.nativeCity + data.data.nativePosition
                })
            }
            if (data.data.telephone) {
                this.setData({
                    oldPhone: data.data.telephone,
                    telephone: data.data.telephone
                }); //手机号码
            }
            if (data.data.name) {
                this.setData({
                    name: data.data.name,
                    haveSubmitted:true,//证明曾经提交过信息了
                });
            } //姓名
            if (data.data.personProfile) {
                this.setData({
                    personProfile: data.data.personProfile
                })
            }
            if (data.data.webchat) {
                this.setData({
                    wechat: data.data.webchat
                })
            }
            if (data.data.qq) {
                this.setData({
                    qq: data.data.qq
                })
            }
            if (data.data.isShowMobile == 1) {
                this.setData({
                    isShowMobile: 1
                })
            } else if (data.data.isShowMobile == 0) {
                this.setData({
                    isShowMobile: 0
                })
            }


            // 学校信息
            data = res.data.data;
            let userData = this.data.userData;
            userData.CLASS = data.userClass; //班级
            userData.STUDENT_ID = data.studentNo;//学号
            userData.SCHOOL_NAME = data.schoolName;//学校姓名
            userData.DEPT = data.depart;//系别
            userData.major = data.major;//系别
            userData.ENTRANCE_DAY = data.inShool;//入学时间
            userData.GRADUATION_DAY = data.outShool;//毕业年限
            userData.DEGREE = data.education; //学历
            userData.masterTutor = data.masterTutor;//硕导
            userData.DOCTOR_TEACHER = data.doctorTutor;//博导
            this.setData({
                //"userData": userData,
                "entranceyear": data.inShool,
                "gyear": data.outShool,
                "hidden": true
            });
            if (data.education) {
                var degreeArray = data.education.toString();
                if (degreeArray.indexOf("0") != -1) {
                    this.setData({checkBox1: true});
                }
                if (degreeArray.indexOf("1") != -1) {
                    this.setData({checkBox2: true});
                }
                if (degreeArray.indexOf("2") != -1) {
                    this.setData({checkBox3: true});
                }
                if (degreeArray.indexOf("3") != -1) {
                    this.setData({checkBox4: true});
                }
                if (degreeArray.indexOf("4") != -1) {
                    this.setData({checkBox5: true});
                }
                if (degreeArray.indexOf("5") != -1) {
                    this.setData({checkBox6: true});
                }
                if (degreeArray.indexOf("6") != -1) {
                    this.setData({checkBox7: true});
                }
                if (degreeArray.indexOf("7") != -1) {
                    this.setData({checkBox8: true});
                }
                if (degreeArray.indexOf("8") != -1) {
                    this.setData({checkBox9: true});
                }
                if (degreeArray.indexOf("9") != -1) {
                    this.setData({checkBox10: true});
                }
            }



            // 工作信息
            userData.WORK_TITLE = data.job;//职务
            userData.PROFESSION = data.industryDirection;//行业方向
            userData.WORK_CITY = data.workLocation;//城市
            userData.WORK_COMPANY = data.currentCompany;//公司名称
            this.setData({
                hidden: true,
                userData: userData
            });

        })

    },

    // 基本信息
    radioChange(res) {//监听是否显示手机号码
        this.setData({
            isShowMobile: this.data.isShowMobile ? 0 : 1
        })
    },
    switchChange(res) {//监听是否显示手机号码
        this.setData({
            isShowMobile: this.data.isShowMobile ? 0 : 1
        })
    },
    userNameInput(e) {
        console.log(e)
        console.log(e.detail.value);
        this.setData({
            name: e.detail.value
        })
    },
    changeSmsCode(e) {
        console.log(e.detail.value)
        this.setData({
            smsCode: e.detail.value
        })
    },
    changeWechat(e){
        this.setData({
            wechat: e.detail.value
        })
    },
    changeQQ(e){
        this.setData({
            qq: e.detail.value
        })
    },
    changePhone(e) {
        console.log(e.detail.value);
        let phone = e.detail.value;
        if (!pattern.test(phone)) {
            wx.showModal({
                title:'温馨提示',
                content:'请输入正确的手机号码',
                showCancel:false
            })
            return;
        }

        if (this.data.oldPhone) {
            if (phone != this.data.oldPhone) {
                this.setData({
                    showCode: true,
                    sending: false
                })
            } else {
                this.setData({
                    showCode: false,
                })
            }
        } else {
            this.setData({
                showCode: true
            })
        }

        this.setData({
            telephone: e.detail.value
        })
    },
    getSmsCode(e) {
        if (!this.data.sending) {
            let newPhone = this.data.telephone;
            if (!pattern.test(newPhone)) {
                wx.showModal({
                    title:'温馨提示',
                    content:'请输入正确的手机号码',
                    showCancel:false
                })
                return;
            }
            this.setData({
                newCodeStatus: '正在发送...',
                sending: true
            })
            let params = {
                url: app.API_HOST + "user/sendSms",
                data: {
                    "mobile": newPhone,//手机号码
                },
            }
            fetchApi(this, params, 'post').then(res => {
                console.log("获取验证码成功");
            })
        } else {
            wx.showModal({
                title:'温馨提示',
                content:'已经发送了',
                showCancel:false
            })
            return;
        }
    },
    changeProfile: function (e) {
        console.log(e.detail.value)
        this.setData({
            personProfile: e.detail.value
        })
    },


    // 学校信息
    schoolNameInput: function (e) {
        this.data.userData.SCHOOL_NAME = e.detail.value;
    },
    selectDegreeInfo: function (e) {
        this.data.degree = e.detail.value.join(',');
        console.log(this.data.degree);
        this.data.userData.DEGREE = this.data.degree;
    },
    changeNativeHighSchoolName: function (e) {
        console.log(e.detail.value);
        this.data.userData.HIGH_SCHOOL_NAME = e.detail.value;
    },
    changeEntranceDay: function (e) {
        var gindex = parseInt(e.detail.value) + 4;
        this.setData({
            eindex: e.detail.value,
            entranceyear: this.data.objectArray[e.detail.value].name,
            gindex: gindex,
            gyear: this.data.objectArray[gindex].name,
        })
        console.log(this.data.entranceyear)
        this.data.userData.ENTRANCE_DAY = this.data.entranceyear
        this.data.userData.GRADUATION_DAY = this.data.gyear
    },
    changeGraduationDay: function (e) {
        console.log(e.detail.value);
        console.log(this.data.objectArray[e.detail.value]);
        let gyearObj = this.data.objectArray[e.detail.value];
        if (parseInt(gyearObj.name)<parseInt(this.data.entranceyear)) {
            wx.showModal({
                tile:'提示',
                content:'毕业时间不能小于入学时间',
                showCancel:false
            })
            return
        }
        this.setData({
            gindex: e.detail.value,
            gyear: gyearObj.name
        })
        this.data.userData.GRADUATION_DAY = this.data.gyear
    },
    changeDept: function (e) {
        this.data.userData.DEPT = e.detail.value; //院系
    },
    changeMajor: function (e) {
        this.data.userData.major = e.detail.value; //专业
    },
    changeClass: function (e) {
        console.log(e.detail.value);
        this.data.userData.CLASS = e.detail.value;
    },
    changeStudentID: function (e) {
        console.log(e.detail.value);
        this.data.userData.STUDENT_ID = e.detail.value;
    },
    changeMasterTeacher: function (e) {
        console.log(e.detail.value);
        this.data.userData.MASTER_TEACHER = e.detail.value;
    },
    changeDoctorTeacher: function (e) {
        console.log(e.detail.value);
        this.data.userData.DOCTOR_TEACHER = e.detail.value;
    },


    // 工作信息
    bindRegionChange: function (e) {
        console.log('picker发送选择改变，携带值为', e.detail.value)
        this.setData({
            region: e.detail.value
        })
    },
    changeProfession: function (e) {
        console.log(e.detail.value);
        this.data.userData.PROFESSION = e.detail.value; //行业方向、
    },
    changeWorkCity: function (e) { //工作城市
        console.log('picker发送选择改变，携带值为', e.detail.value);
        this.data.userData.WORK_CITY = e.detail.value;
        this.setData({
            region: e.detail.value,
            userData: this.data.userData,
            workPlace: e.detail.value[0] + e.detail.value[1] + e.detail.value[2]
        })
        this.data.userData.WORK_CITY = e.detail.value[0] + e.detail.value[1] + e.detail.value[2];
    },
    changeWorkCompany: function (e) {  //公司
        console.log(e.detail.value);
        this.data.userData.WORK_COMPANY = e.detail.value;
    },
    changeWorkTitle: function (e) { //职务
        console.log(e.detail.value);
        this.data.userData.WORK_TITLE = e.detail.value;
    },


    // 提交三种信息
    submitData(e) {

        if ((!this.data.name) || (!this.data.telephone)) {
            wx.showModal({
                title:'温馨提示',
                content:'为了方便校友交流,请填写必填项',
                showCancel:false
            })
            return;
        }
        if (this.data.oldPhone != this.data.telephone && !this.data.smsCode) {
            wx.showModal({
                title:'温馨提示',
                content:'请填写手机验证码',
                showCancel:false
            })
            return;
        }

        if ((!this.data.userData.DEPT) || (!this.data.userData.major)  || this.data.gyear.indexOf("请选择") > -1 || (!this.data.userData.DEGREE) || this.data.entranceyear.indexOf("请选择") > -1) {
            wx.showModal({
                title:'温馨提示',
                content:'为了方便校友交流，请填写必填项',
                showCancel:false
            })
            return;
        }

        var that = this;
        var postData = {};

        var user = that.data.userData;
        postData = {
            // 基本信息
            "mobile": that.data.telephone,
            "name": that.data.name,
            "personProfile": that.data.personProfile || '',
            "isShowMobile": that.data.isShowMobile,
            'latitude': this.data.latitude,
            'longitude': this.data.longitude,
            'smsCode': this.data.smsCode,
            nativeCity: this.data.nativeCity,
            nativeProvince: this.data.nativeProvince,
            nativePosition: this.data.nativePosition,
            webchat:this.data.wechat,
            qq:this.data.qq,

            // 学校信息
            schoolName: user.SCHOOL_NAME,//校名
            education: user.DEGREE,//学历
            inSchool: user.ENTRANCE_DAY,//入学时间
            outSchool: user.GRADUATION_DAY,//毕业时间
            depart: user.DEPT,//系别
            major:user.major,
            userClass: user.CLASS,//班级
            studentNo: user.STUDENT_ID,//学号
            masterTutor: user.MASTER_TEACHER,//硕导
            doctorTutor: user.DOCTOR_TEACHER,//博导

            // 工作xinx
            workLocation: user.WORK_CITY, //工作城市
            industryDirection: user.PROFESSION,//行业方向
            currentCompany: user.WORK_COMPANY,//当前公司
            job: user.WORK_TITLE//职务
        }
        let params = {
            url: app.API_HOST + 'user/submitUserDetailInfo',
            data: postData,
        }
        fetchApi(this, params, 'post').then(res => {
            wx.showToast({
                title: '提交成功!',
                icon: 'loading',
                duration: 600
            })

            if (this.data.haveSubmitted){
                setTimeout(function () {
                    wx.switchTab({
                        url: '/pages/myinfo/myinfo',
                    });
                }, 800)
            } else {
                wx.navigateTo({
                    url:'/pages/schoolList/schoolList'
                })
            }
        }).catch(res => {
            console.log('-------------->err',res)
            wx.showToast({
                title: '提交失败，请稍后重试!',
                icon: 'loading',
                duration: 1000
            })

            setTimeout(function () {
                that.setData({
                    hidden: true
                })
                wx.navigateBack({});
            }, 1500)
        })
    },


    getGeo() {
        let that = this
        wx.getLocation({
            type: 'gcj02',
            success(res) {
                console.log(res)
                that.data.latitude = res.latitude
                that.data.longitude = res.longitude

                let params = {
                    url: 'alumni/updateLatAndLon',
                    data: {
                        latitude: res.latitude,
                        longitude: res.longitude
                    }
                }
                fetchApi(that, params, 'post').then(res => {
                    that.setData({
                        geoSuccess: true
                    })
                })
            },
            fail:geoFail
        })

    },
    showTip(){
        wx.showModal({
            'title':'提示',
            content:'有两种情形会获取位置信息：1、之前未获取过位置信息，点击了获取位置按钮，2、获取过位置信息，想要更新位置时，点击了更新位置按钮。' +
                '位置信息授权获取之后，仅用于校友距离和校友地图的显示，校友距离和校友地图仅供审核通过且授权获取了位置信息的校友查看，如果您未通过审核或未授权获取位置信息则无法查看校友距离和校友地图。',
            showCancel:false
        })
    },
    changeNativePlace: function (e) { //籍贯
        console.log('picker发送选择改变，携带值为', e.detail.value);
        this.setData({
            nativePlace: e.detail.value,
            nativeCity: e.detail.value[0],
            nativeProvince: e.detail.value[1],
            nativePosition: e.detail.value[2],
        })
    },


})




