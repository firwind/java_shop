package com.baigu.eop.resource.impl;

import java.util.Map;

import com.baigu.eop.resource.model.EopSite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baigu.app.base.core.service.ISettingService;
import com.baigu.eop.resource.ISiteManager;
import com.baigu.framework.util.ReflectionUtil;

/**
 * 站点管理
 * 
 * @author kingapex 2010-5-9下午07:56:03
 */
@Service("siteManager")
public class SiteManagerImpl implements ISiteManager {
	
	
	@Autowired
	private  ISettingService settingService;
	
	
	/* (non-Javadoc)
	 * @see ISiteManager#saveToDB()
	 */
	@Override
	public void saveToDB() {
		EopSite site  = EopSite.getInstance();
		Map map = ReflectionUtil.po2Map(site);
		Map<String,Map<String,String>> allSetting = settingService.getSetting();
		allSetting.put(EopSite.SITE_SETTING_KEY, map);//更新缓存
		this.settingService.save(EopSite.SITE_SETTING_KEY,map); //更新数据库
		
	} 
	
	
	
}
