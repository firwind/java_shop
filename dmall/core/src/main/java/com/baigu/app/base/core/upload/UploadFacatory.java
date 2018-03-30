package com.baigu.app.base.core.upload;

import com.baigu.app.base.core.model.FastDfsSetting;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.model.ClusterSetting;
import com.baigu.framework.context.spring.SpringContextHolder;
@Component
public class UploadFacatory {

	private UploadFacatory(){}
	
	
	/**
	 * 上传图片
	 * @return
	 */
	public static IUploader getUploaer(){
		IUploader uploade =(IUploader)SpringContextHolder.getBean("localUploader");
		
		//如果开启fastdfs
		if(ClusterSetting.getFdfs_open()==1){
			return new FastDFSUploader();
		}else if(FastDfsSetting.getFdfs_open()==1){
			return new FDFSUploader();
		}
		return uploade;
	}


}
