package com.baigu.app.base.core.service.solution.impl;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import com.baigu.app.base.core.service.solution.IProfileLoader;
import com.baigu.framework.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;

/**
 * 产品profile加载器
 * @author kingapex
 * @version v2.0
 * 2016年2月17日下午8:45:48
 * @since v6.0
 */
@Service
public class ProfileLoaderImpl implements IProfileLoader {

	protected final Logger logger = Logger.getLogger(getClass());
	public Document load(String productId) {
		String app_apth = StringUtil.getRootPath();

		String xmlFile = app_apth+"/products/"+productId +"/profile.xml"; 
		try {
		    DocumentBuilderFactory factory = 
		    DocumentBuilderFactory.newInstance();
		    DocumentBuilder builder = factory.newDocumentBuilder();
		    Document document = builder.parse(xmlFile);
		    return document;
		}
		catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			throw new RuntimeException("load ["+productId +"] profile error" );
		} 	 
		 
	}

}
