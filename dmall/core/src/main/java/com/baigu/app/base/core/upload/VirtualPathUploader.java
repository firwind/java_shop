package com.baigu.app.base.core.upload;

import com.baigu.eop.SystemSetting;
import com.baigu.framework.util.DateUtil;
import com.baigu.framework.util.FileUtil;
import com.baigu.framework.util.StringUtil;
import org.springframework.stereotype.Component;

import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;

/**
 * 服务器虚拟路径上传
 * <p>
 * create by xt on 2018-08-02 17:15
 */
@Component
public class VirtualPathUploader implements IUploader {


    @Override
    public String upload(InputStream stream, String subFolder, String fileName) {
        String static_server_path = SystemSetting.getStatic_server_path(); //静态资源上传路径
        String static_server_domain = SystemSetting.getStatic_server_domain(); //静态资源访问路径

        String timePath = this.getTimePath();
        String ext = FileUtil.getFileExt(fileName);
        fileName = DateUtil.toString(new Date(), "mmss") + StringUtil.getRandStr(4) + "." + ext;
        String placeHolder = "/attachment/" + (subFolder == null ? "" : subFolder) + "/" + timePath + "/" + fileName;

        String accessPath = static_server_domain + placeHolder; //访问路径
        String filePath = static_server_path + placeHolder; //实际存储路径

        /**
         * 写入文件
         */
        FileUtil.write(stream, filePath);
        return accessPath;
    }

    @Override
    public void deleteFile(String filePath) {

    }

    @Override
    public String[] upload(InputStream stream, String subFolder, String fileName, int width, int height) {
        return new String[0];
    }

    private String getTimePath() {
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1;
        int date = now.get(Calendar.DAY_OF_MONTH);
        int minute = now.get(Calendar.HOUR_OF_DAY);
        String filePath = "";
        if (year != 0) {
            filePath += year + "/";
        }
        if (month != 0) {
            filePath += month + "/";
        }
        if (date != 0) {
            filePath += date + "/";
        }
        if (minute != 0) {
            filePath += minute + "/";
        }
        return filePath;
    }
}
