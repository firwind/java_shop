package com.baigu.app.base.core.upload;

import com.baigu.app.base.core.model.ClusterSetting;
import com.baigu.app.base.core.model.FastDfsSetting;
import com.baigu.framework.context.spring.SpringContextHolder;
import org.springframework.stereotype.Component;
@Component
public class UploadFacatory {

	private UploadFacatory(){}
	
	
	/**
	 * 上传图片
	 * @return
	 */
	public static IUploader getUploaer(){
		//默认使用虚拟路径上传
		IUploader uploade = (IUploader) SpringContextHolder.getBean("virtualPathUploader");
		
		//如果开启fastdfs
		if(ClusterSetting.getFdfs_open()==1){
			return new FastDFSUploader();
		}else if(FastDfsSetting.getFdfs_open()==1){
			return new FDFSUploader();
		}
		return uploade;
	}


}
