package com.baigu.app.base.core.upload;

import com.baigu.framework.util.FileUtil;
import com.baigu.qiniu.QiniuUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;

/**
 * create by xt on 2018-08-02 16:53
 */
@Component
public class QiniuUploader implements IUploader {

    private static final QiniuUtil QINIU = QiniuUtil.getInstance();

    @Override
    public String upload(InputStream stream, String subFolder, String fileName) {
        /**
         * 参数校验
         */
        if (stream == null) {
            throw new IllegalArgumentException("file or filename object is null");
        }
        if (subFolder == null) {
            throw new IllegalArgumentException("subFolder is null");
        }
        if (!FileUtil.isAllowUpImg(fileName)) {
            throw new IllegalArgumentException("不被允许的上传文件类型");
        }
        String ext = FileUtil.getFileExt(fileName);
        String path = null;
        try {
            path = QINIU.upload(IOUtils.toByteArray(stream), ext);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return path;
    }

    @Override
    public void deleteFile(String filePath) {
//        FileUtil.delete(filePath);
//        FileUtil.delete(StaticResourcesUtil.getThumbPath(filePath, "_thumbnail"));
    }

    @Override
    public String[] upload(InputStream stream, String subFolder, String fileName, int width, int height) {
        return new String[0];
    }
}
