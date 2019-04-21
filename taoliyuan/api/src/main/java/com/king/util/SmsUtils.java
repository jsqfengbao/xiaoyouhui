package com.king.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.io.IOException;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/7 18:39
 * @Modified By
 **/
public class SmsUtils {
    public static final String SUCCESS_CODE = "2";
    private Logger logger = Logger.getLogger(getClass());

    private static final String SMS_ACCOUNT = "C37585370";
    private static final String SMS_PASSWORD = "53102a60e174a82cc0ae8eb168bb3d12";
    private static final String SMS_URL = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

    public static String sendSms(String mobilePhone) {
        int mobileCode = (int) ((Math.random() * 9 + 1) * 100000);
        String content = "验证码：" + mobileCode + "，请您在60分钟内填写。如非本人操作，请忽略本短信。";

        HttpClient client = getHttpClient();
        PostMethod method = getPostMethod(mobilePhone,content);
        try {
            String code = sendInternal(client, method);

            if (SUCCESS_CODE.equals(code)) {
                return mobileCode + "";
            }

        } catch (IOException | DocumentException e) {
            e.printStackTrace();
        } finally {
            // Release connection
            method.releaseConnection();
            ((SimpleHttpConnectionManager) client.getHttpConnectionManager()).shutdown();
        }
        return "0";
    }



    public static String notifySchoolAdmin(String schoolName, String schoolAreaName, String name, String studentPhone, String notifyPhone) {
        String content = "管理员:" + schoolName + schoolAreaName + "，有" + name + "（电话：" + studentPhone + "）申请加入，请尽快审批！";
        System.out.println("通知管理员短信内容：" + content + "管理员手机号：" + notifyPhone);

        HttpClient client = getHttpClient();
        PostMethod method = getPostMethod(studentPhone,content);

        return send(client, method);
    }

    private static String send(HttpClient client, PostMethod method) {

        try {
            String code = sendInternal(client, method);
            if (SUCCESS_CODE.equals(code)) {
                return code;
            }

        } catch (IOException | DocumentException e) {
            e.printStackTrace();
        } finally {
            // Release connection
            method.releaseConnection();
            ((SimpleHttpConnectionManager) client.getHttpConnectionManager()).shutdown();
        }
        return "0";
    }
    private static String sendInternal(HttpClient client, PostMethod method) throws IOException, DocumentException {
        client.executeMethod(method);
        String submitResult = method.getResponseBodyAsString();
        Document doc = DocumentHelper.parseText(submitResult);
        Element root = doc.getRootElement();
        String code = root.elementText("code");
        String msg = root.elementText("msg");
        String smsid = root.elementText("smsid");
        System.out.println(code);
        System.out.println(msg);
        System.out.println(smsid);
        return code;
    }

    private static NameValuePair[] getBody(String notifyPhone, String content) {
        //提交短信
        return new NameValuePair[]{
                //查看用户名是登录用户中心->验证码短信->产品总览->APIID
                new NameValuePair("account", SMS_ACCOUNT),
                //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
                new NameValuePair("password", SMS_PASSWORD),
                new NameValuePair("mobile", notifyPhone),
                new NameValuePair("content", content),
        };
    }

    /**
     * 通知申请加入的user
     *
     * @param schoolName
     * @param schoolAreaName
     * @param notifyPhone
     * @return
     */
    public static String notifyApplyUser(String schoolName, String schoolAreaName, String notifyPhone) {
        String content = "亲爱的校友：你申请加入" + schoolName + schoolAreaName + "已获批准，快去体验吧！";
        System.out.println("手机号：" + notifyPhone + ",短信内容：" + content);

        HttpClient client = getHttpClient();
        PostMethod method = getPostMethod(notifyPhone,content);

        return send(client, method);
    }

    private static PostMethod getPostMethod(String mobile,String content) {
        PostMethod method = new PostMethod(SMS_URL);
        method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=GBK");
        NameValuePair[] body = getBody(mobile, content);
        method.setRequestBody(body);
        return method;
    }

    private static HttpClient getHttpClient() {
        HttpClient client = new HttpClient();
        client.getParams().setContentCharset("GBK");
        return client;
    }
}
