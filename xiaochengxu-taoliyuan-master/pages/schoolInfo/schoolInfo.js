var app = getApp();
const config = require("../../config.js");
import {fetchApi} from '../../api/api.js';

Page({
    data: {
        viewTitle: '完善个人信息',
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
    },
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
        console.log(xx);
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
    changeProfession: function (e) {
        console.log(e.detail.value);
        this.data.userData.PROFESSION = e.detail.value;
    },
    changeWorkCompany: function (e) {
        console.log(e.detail.value);
        this.data.userData.WORK_COMPANY = e.detail.value;
    },
    changeWorkTitle: function (e) {
        console.log(e.detail.value);
        this.data.userData.WORK_TITLE = e.detail.value;
    },

    submitData(e) {

        if ((!this.data.userData.DEPT) || (!this.data.userData.major)  || this.data.gyear.indexOf("请选择") > -1 || (!this.data.userData.DEGREE) || this.data.entranceyear.indexOf("请选择") > -1) {

            this.modalOk = () => {
                this.setData({modalVisible: false})
            }
            this.setData({
                modalVisible: true,
                modalTitle: '温馨提示',
                modalMsg: '为了方便校友交流，请填写必填项',
                showOk: true,
                showCancel: false,
                okText: '确定',
                cancelText: '取消',
            })
            return;
        }

        var that = this;
        var postData = {};
        var user = that.data.userData;
        postData = {
            schoolName: user.SCHOOL_NAME,//校名
            education: user.DEGREE,//学历
            inSchool: user.ENTRANCE_DAY,//入学时间
            outSchool: user.GRADUATION_DAY,//毕业时间
            depart: user.DEPT,//系别
            major:user.major,
            userClass: user.CLASS,//班级
            studentNo: user.STUDENT_ID,//学号
            masterTutor: user.MASTER_TEACHER,//硕导
            doctorTutor: user.DOCTOR_TEACHER//博导

        }
        this.setData({
            hidden: false
        })
        let params = {
            url: app.API_HOST + 'user/submitSchoolInfo',
            data: postData,
        }
        fetchApi(this, params, 'post').then(res => {
            var data = res.data;

            that.setData({
                hidden: true
            });
            wx.showToast({
                title: '提交成功!',
                icon: 'loading',
                duration: 1000
            })
            setTimeout(function () {
                that.setData({
                    hidden: true
                })
                wx.navigateBack();
            }, 1000)
        }).catch(res => {
            that.setData({
                hidden: true
            })
            wx.showToast({
                title: '提交失败，请稍后重试!',
                icon: 'loading',
                duration: 1500

            })

            setTimeout(function () {
                that.setData({
                    hidden: true
                })
                wx.navigateBack({});
            }, 1000)
        })
    },


    onLoad(options) {
        // 生命周期函数--监听页面显示
        console.log("Page onLoad");
        var that = this;
        that.setData({
            userData: this.data.userData
        });
        let params = {
            url: app.API_HOST + 'user/queryUser',
        }
        fetchApi(this, params, 'post').then(res => {
            var data = res.data.data;
            var userData = this.data.userData;
            userData.CLASS = data.userClass; //班级
            userData.STUDENT_ID = data.studentNo;//学号
            userData.STUDENT_NAME = data.schoolName;//学校姓名
            userData.DEPT = data.depart;//系别
            userData.major = data.major;//系别
            userData.ENTRANCE_DAY = data.inShool;//入学时间
            userData.GRADUATION_DAY = data.outShool;//毕业年限
            userData.DEGREE = data.education; //学历
            userData.masterTutor = data.masterTutor;//硕导
            userData.DOCTOR_TEACHER = data.doctorTutor;//博导

            console.log('------------------>', data)
            that.setData({
                "userData": userData,
                "entranceyear": data.inShool,
                "gyear": data.outShool,
                "hidden": true
            });
            if (data.education) {
                var degreeArray = data.education.toString();
                if (degreeArray.indexOf("0") != -1) {
                    that.setData({checkBox1: true});
                }
                if (degreeArray.indexOf("1") != -1) {
                    that.setData({checkBox2: true});
                }
                if (degreeArray.indexOf("2") != -1) {
                    that.setData({checkBox3: true});
                }
                if (degreeArray.indexOf("3") != -1) {
                    that.setData({checkBox4: true});
                }
                if (degreeArray.indexOf("4") != -1) {
                    that.setData({checkBox5: true});
                }
                if (degreeArray.indexOf("5") != -1) {
                    that.setData({checkBox6: true});
                }
                if (degreeArray.indexOf("6") != -1) {
                    that.setData({checkBox7: true});
                }
                if (degreeArray.indexOf("7") != -1) {
                    that.setData({checkBox8: true});
                }
                if (degreeArray.indexOf("8") != -1) {
                    that.setData({checkBox9: true});
                }
                if (degreeArray.indexOf("9") != -1) {
                    that.setData({checkBox10: true});
                }
            }
        })

    }
})




