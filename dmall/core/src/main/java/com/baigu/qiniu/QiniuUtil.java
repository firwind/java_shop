package com.baigu.qiniu;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

import java.io.File;


public class QiniuUtil {

    private QiniuUtil() {
    }

    private static class NeiBu {

        private static QiniuUtil qiniuUtil = new QiniuUtil();

    }

    public static QiniuUtil getInstance() {
        return NeiBu.qiniuUtil;
    }


    /**
     * 基本配置-从七牛管理后台拿到
     */
    //设置好账号的ACCESS_KEY和SECRET_KEY
//    String ACCESS_KEY = "MShV-dG7ToSBWb1N-cXTDAfuY88cpPrZXJg6w1YL";
//    String SECRET_KEY = "A7Y8DCdqHJubWdz-dvPoUvZrKXrx6bayV0Hj50Im";
    String ACCESS_KEY = "5_qf-thVIKQzk5qpF2FmL5WZCqZxJTmxiFjbS26l";
    String SECRET_KEY = "Xxfd5w7ZUVI80Q8NYs03kJmuXYl-j14YjuFybSBP";
    //要上传的空间名--
    String bucketname = "tanbaye";


    /**指定保存到七牛的文件名--同名上传会报错  {"error":"file exists"}*/
    /**
     * {"hash":"FrQF5eX_kNsNKwgGNeJ4TbBA0Xzr","key":"aa1.jpg"} 正常返回 key为七牛空间地址 http:/xxxx.com/aa1.jpg
     */
    //上传文件的路径
    //上传到七牛后保存的文件名    访问为：http://7xj89v.com1.z0.glb.clouddn.com/daimo6.png
    String key = null;
    String url = "https://cdn.tanbaye.com/";

    //密钥配置
    Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
    //创建上传对象
    UploadManager uploadManager = new UploadManager(new Configuration());


    //简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public String getUpToken() {
        StringMap policy = new StringMap();
//        policy.put("saveKey", "$(year)$(mon)$(day)/$(etag)$(ext)");
        policy.put("saveKey", "$(etag)$(ext)");
//        policy.put("persistentOps", "vframe/jpg/offset/3/rotate/auto");
        return auth.uploadToken(bucketname, null, 3600, policy);
    }

    public String upload(File file) {
        try {
            //调用put方法上传
//            String endPathfile = file.getName().substring(file.getName().lastIndexOf("."), file.getName().length());
//            key = UUID.randomUUID().toString().replaceAll("-", "") + endPathfile;
            Response res = uploadManager.put(file, null, getUpToken());
            //打印返回的信息
            System.out.println(res.bodyString());
            System.out.println(res.statusCode);//200为上传成功
            if (res.statusCode == 200) {
                return url + res.jsonToMap().get("key");
            } else {
                return "七牛上传异常";
            }

        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
        }
        return null;
    }

    public String upload(byte[] bytes, String endPathfile) {
        try {
            //调用put方法上传
//            key = UUID.randomUUID().toString().replaceAll("-", "") + endPathfile;
            Response res = uploadManager.put(bytes, null, getUpToken());
            //打印返回的信息
            if (res.statusCode == 200) {
                return url + res.jsonToMap().get("key");
            }
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
        }
        return null;
    }

//    public static void main(String args[]) throws IOException{
//        System.out.println(new QiniuUtil().upload());
//    }
}
