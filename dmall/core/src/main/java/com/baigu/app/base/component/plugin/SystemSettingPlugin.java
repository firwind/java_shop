package com.baigu.app.base.component.plugin;

import com.baigu.app.base.core.plugin.setting.IOnSettingInputShow;
import com.baigu.app.base.core.plugin.setting.IOnSettingSaveEnvent;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import org.springframework.stereotype.Component;

import com.baigu.eop.SystemSetting;

/**
 * 系统设置插件
 * @author kingapex
 *
 */
@Component
public class SystemSettingPlugin extends AutoRegisterPlugin implements
        IOnSettingInputShow,IOnSettingSaveEnvent {

	
	@Override
	public String onShow() {
		
		return "system-setting";
	}

	
	@Override
	public void onSave() {
		SystemSetting.load();
	}
	
	
	@Override
	public String getSettingGroupName() {
		
		return SystemSetting.setting_key;
	}

	@Override
	public String getTabName() {
		
		return "系统设置";
	}

	@Override
	public int getOrder() {
		
		return 5;
	}

	

}
