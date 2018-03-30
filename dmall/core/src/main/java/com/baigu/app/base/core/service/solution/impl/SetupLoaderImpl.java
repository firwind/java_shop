package com.baigu.app.base.core.service.solution.impl;

import java.io.File;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Service;

import com.baigu.app.base.core.service.solution.ISetupLoader;
import com.baigu.framework.util.FileUtil;
import com.baigu.framework.util.StringUtil;

@Service("setupLoader")
public class SetupLoaderImpl implements ISetupLoader {

	
	public Document load(String productId) {
		String app_apth = StringUtil.getRootPath(); 
		String xmlFile =app_apth+"/products/"+productId +"/setup.xml"; 
		Document document = null;
		SAXReader saxReader = new SAXReader();
		try {
			if (FileUtil.exist(xmlFile)) {
				document = saxReader.read(new File(xmlFile));
			}

		} catch (DocumentException e) {
		} 	
		return document;
		 
	}

}
