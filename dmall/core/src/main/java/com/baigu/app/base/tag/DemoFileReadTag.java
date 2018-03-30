package com.baigu.app.base.tag;

import java.util.Map;

import com.baigu.framework.taglib.BaseFreeMarkerTag;
import com.baigu.framework.util.FileUtil;
import com.baigu.framework.util.StringUtil;

import freemarker.template.TemplateModelException;

public class DemoFileReadTag extends BaseFreeMarkerTag {

	@Override
	protected Object exec(Map params) throws TemplateModelException {
		 String filename=(String)params.get("filename");
		 if(filename==null) return "文件名不能为空";
		 String app_apth = StringUtil.getRootPath();
		 String filePath = app_apth+"/docs/tags/demo/"+filename;
		 String content = FileUtil.read(filePath, "UTF-8");
		return content;
	}

}
