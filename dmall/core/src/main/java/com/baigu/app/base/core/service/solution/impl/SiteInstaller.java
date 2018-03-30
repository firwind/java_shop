/**
 * 
 */
package com.baigu.app.base.core.service.solution.impl;

import java.util.HashMap;
import java.util.Map;

import com.baigu.eop.resource.model.EopSite;
import com.baigu.framework.database.IDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.baigu.app.base.core.service.ISettingService;
import com.baigu.app.base.core.service.solution.IInstaller;

/**
 * 站点安装器
 * @author kingapex
 *2015-3-6
 */
@Service
public class SiteInstaller implements IInstaller {
	
	@Autowired
	private IDaoSupport daoSupport;
	
	@Autowired
	private ISettingService settingService;
	
	
	
	/* (non-Javadoc)
	 * @see IInstaller#install(java.lang.String, org.w3c.dom.Node)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void install(String productId, Node fragment) {
		daoSupport.execute("insert into es_settings (cfg_group) values ( '"+ EopSite.SITE_SETTING_KEY+"')");
		 
		Map siteSettings = new HashMap();
		
		NodeList nodeList = fragment.getChildNodes();
		for(int i=0,len=nodeList.getLength();i<len;i++){
			Node node = nodeList.item(i);
			if(node.getNodeType()==Node.ELEMENT_NODE) {
				Element element = (Element)node;
				String name = element.getAttribute("name");
				String value = element.getAttribute("value");
				siteSettings.put(name, value); 
			}
			
		}
		siteSettings.put("siteon", "1");
		
		this.settingService.save(EopSite.SITE_SETTING_KEY, siteSettings);//更新缓存并入库
		
		EopSite.reload(); //重新加载
	}


	
	
}
