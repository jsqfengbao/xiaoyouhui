let WxParse = require('../../wxParse/wxParse.js');
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    InRichTextData:{
      type:null,
      value:'',
      observer(newValue){
        WxParse.wxParse('OutRichTextData', 'html', this.data.InRichTextData, this, 0);
      }
    }
  },
  data: {
      
  },

  methods: {
    wxParseTagATap(e){
      // console.log(e,111)
    }

  },
  attached(){
    WxParse.wxParse('OutRichTextData', 'html', this.data.InRichTextData, this, 0);
  }
})
