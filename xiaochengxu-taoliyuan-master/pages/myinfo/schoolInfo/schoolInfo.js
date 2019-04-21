var app = getApp();
const config = require("../../../config.js");
Page({
  data: {
    viewTitle: '完善个人信息',
    userInfo: {},
    userData: {},
    selected: true,
    region: ['广东省', '深圳市', '南山区'],
    userNativePlace: '广东省深圳市南山区',
    workPlace: '广东省深圳市南山区',
    selected1: false,
    eindex: 23, //入学时间编号id
    entranceyear: "请选择入学时间",
    gindex: 17,
    gyear: "请选择毕业时间",
    styleFlag:false,
    hidden: true,
    checkBox1: false,
    checkBox2: false,
    checkBox3: false,
    checkBox4: false,
    checkBox5: false,
    checkBox6: false,
    checkBox7: false,
    checkBox8: false,
    checkBox10: false,
    degree:'',
    array: ['1978前', '1978', '1979', '1980', '1981', '1982', '1983', '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992', '1993', '1994', '1995', '1996', '1997', '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020'],
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
      }
    ],
  },
  userNameInput:function(e){
    getApp().globalData.userData.SCHOOL_NAME = e.detail.value;
  },
  selectDegreeInfo: function(e) {
    this.data.degree = e.detail.value.join(',');
    console.log(this.data.degree);
    getApp().globalData.userData.DEGREE = this.data.degree;
    console.log(getApp().globalData.userData.DEGREE)
  }, 
  changeNativePlace: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      region: e.detail.value,
      userNativePlace: e.detail.value[0] + e.detail.value[1] + e.detail.value[2]
    })
    console.log(this.data.userNativePlace);
    getApp().globalData.userData.NATIVE_PLACE = e.detail.value[0] + e.detail.value[1] + e.detail.value[2];
    console.log("111");
    console.log(getApp().globalData.userData.NATIVE_PLACE);
  },
  changeNativeHighSchoolName: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.HIGH_SCHOOL_NAME = e.detail.value;
  },
 
  changeEntranceDay: function (e) {  
    var that = this;
    var gi = parseInt(e.detail.value)+4;
    this.setData({
      eindex: e.detail.value,
      entranceyear: that.data.objectArray[e.detail.value].name,
      gindex: gi,
      gyear: that.data.objectArray[gi].name,
      styleFlag:false
    })
    console.log(this.data.entranceyear)
    getApp().globalData.userData.ENTRANCE_DAY = this.data.entranceyear  
    getApp().globalData.userData.GRADUATION_DAY = this.data.gyear
  },
  changeGraduationDay: function (e) {
    console.log("aaaa");
    console.log(e.detail.value);
    console.log(this.data.objectArray[e.detail.value]);
    var that = this;
    var xx = this.data.objectArray[e.detail.value];
    console.log(xx);
    this.setData({
      gindex: e.detail.value,
      gyear: xx.name
    })
    console.log(this.data.gyear);
    getApp().globalData.userData.GRADUATION_DAY = this.data.gyear
  },
  changeDept: function (e) {
    getApp().globalData.userData.DEPT = e.detail.value; //系别
  },
  changeClass: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.CLASS = e.detail.value;
  },
  changeStudentID: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.STUDENT_ID = e.detail.value;
  },
  changeMasterTeacher: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.MASTER_TEACHER = e.detail.value;
  },
  changeDoctorTeacher: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.DOCTOR_TEACHER = e.detail.value;
  },
  changeProfession: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.PROFESSION = e.detail.value;
  },
  changeWorkCity: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      region: e.detail.value,
      workPlace: e.detail.value[0] + e.detail.value[1] + e.detail.value[2]
    })
    console.log(this.data.workPlace);
    getApp().globalData.userData.WORK_CITY = e.detail.value[0] + e.detail.value[1] + e.detail.value[2];
    console.log("111");
    console.log(getApp().globalData.userData.WORK_CITY);
  },
  changeWorkCompany: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.WORK_COMPANY = e.detail.value;
  },
  changeWorkTitle: function (e) {
    console.log(e.detail.value);
    getApp().globalData.userData.WORK_TITLE = e.detail.value;
  },

  submintData: function (e) {

    //打印所有关于点击对象的信息
    console.log(getApp().globalData.userData);
    this.data.userData = getApp().globalData.userData;
    if ((!this.data.userData.DEPT) || this.data.gyear.indexOf("请选择") > -1 || (!this.data.userData.DEGREE) || this.data.entranceyear.indexOf("请选择") > -1 )
    {
      wx.showModal({
        title: '',
        content: '为了方便校友交流，入校时间、学历等必须填写',
        showCancel: false,
        confirmText: '缺少信息',
        confirmColor: '#004b97',
        success: function (res) { }
      })
      return;
    }
    
    var that = this;
    var postData = {};
    var user = that.data.userData;
    postData={
      "userId": getApp().globalData.accountInfo.user_id,
      schoolName: user.SCHOOL_NAME,//校名
      education: user.DEGREE,//学历
      inSchool: user.ENTRANCE_DAY,//入学时间
      outSchool: user.GRADUATION_DAY,//毕业时间
      depart: user.DEPT,//系别
      userClass:user.CLASS,//班级
      studentNo: user.STUDENT_ID,//学号
      masterTutor: user.MASTER_TEACHER,//硕导
      doctorTutor: user.DOCTOR_TEACHER//博导
    }
    this.setData({
      hidden: false
    })
    wx.request({
      url: config.host +'/api/user/submitSchoolInfo',
      data: postData,
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": app.globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
        wx.setStorageSync('AAData', getApp().globalData.userData);
        if (res.statusCode == 200) {
          var data = res.data;
          if (data.errno == 0) {
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
              wx.navigateBack({});
            }, 2000)
          }else{
            wx.showModal({
              title: '温馨提示',
              content: data.errmsg,
            });
            that.setData({
              hidden: true
            })
          }
        }

      },
      fail: function () {
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
        }, 2000)
      },
    })
  },

  onShow: function () {
    console.log("page on show");
    console.log(this.data.entranceyear);
    if (this.data.entranceyear.indexOf("请选择")>-1){
      this.setData({styleFlag:true});
    }
  },
  onLoad: function (options) {
    // 生命周期函数--监听页面显示
    console.log("Page onLoad");
    var that = this;
    that.setData({
      userInfo: getApp().globalData.userInfo,
      userData: getApp().globalData.userData
    });
    wx.request({ //查询信息
      url: config.host +'/api/user/queryUser',
      data: {
        userId: getApp().globalData.accountInfo.user_id
      },
      header: {
        'content-type': 'application/json', // 默认值
        "tao-li-yuan-token": getApp().globalData.accountInfo.open_id,
      },
      method: 'POST',
      success: function (res) {
       console.log("学历：",res);
        var data = res.data;
        if (data.errno==0){
          var data = data.data;
          var userData = getApp().globalData.userData;
              userData.CLASS = data.userClass; //班级
              userData.STUDENT_ID = data.studentNo;//学号
              userData.STUDENT_NAME = data.schoolName;//学校姓名
              userData.DEPT = data.depart;//系别
              userData.ENTRANCE_DAY = data.inShool;//入学时间
              userData.GRADUATION_DAY = data.outShool;//毕业年限
              userData.DEGREE = data.education; //学历
              userData.masterTutor = data.masterTutor;//硕导
              userData.DOCTOR_TEACHER = data.doctorTutor;//博导

          that.setData({
            "userData": userData,
            "entranceyear": data.inShool,
            "gyear": data.outShool,
            "hidden": true
          });
          if (data.education){
            var degreeArray = data.education.toString();
            if (degreeArray.indexOf("0") != -1) {
              that.setData({ checkBox1: true });
            }
            if (degreeArray.indexOf("1") != -1) {
              that.setData({ checkBox2: true });
            }
            if (degreeArray.indexOf("2") != -1) {
              that.setData({ checkBox3: true });
            }
            if (degreeArray.indexOf("3") != -1) {
              that.setData({ checkBox4: true });
            }
            if (degreeArray.indexOf("4") != -1) {
              that.setData({ checkBox5: true });
            }
            if (degreeArray.indexOf("5") != -1) {
              that.setData({ checkBox6: true });
            }
            if (degreeArray.indexOf("6") != -1) {
              that.setData({ checkBox7: true });
            }
            if (degreeArray.indexOf("7") != -1) {
              that.setData({ checkBox8: true });
            }
            if (degreeArray.indexOf("8") != -1) {
              that.setData({ checkBox9: true });
            }
            // if (degreeArray.indexOf("9") != -1) {
            //   that.setData({ checkBox10: true });
            // }
            // if (degreeArray.indexOf("10") != -1) {
            //   that.setData({ checkBox11: true });
            // }
          }
          
        }else{
          wx.showModal({
            title: '温馨提示',
            showCancel:false,
            content: data.errmsg,
          })
        }
      }
    })

   
   
  }
})




