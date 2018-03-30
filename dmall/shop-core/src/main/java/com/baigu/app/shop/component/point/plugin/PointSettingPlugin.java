package com.baigu.app.shop.component.point.plugin;

import org.springframework.stereotype.Component;

import com.baigu.app.base.core.plugin.setting.IOnSettingInputShow;
import com.baigu.framework.plugin.AutoRegisterPlugin;

/**
 * 积分设置插件
 * @author kingapex
 *2012-3-31上午10:31:16
 */
@Component
public class PointSettingPlugin extends AutoRegisterPlugin implements
		IOnSettingInputShow {


	public String getSettingGroupName() {
	
		return "point";
	}

	
	public String onShow() {
	
		return "setting";
	}



	@Override
	public String getTabName() {
		 
		return "积分设置";
	}


	@Override
	public int getOrder() {
	 
		return 20;
	}

}
