package com.baigu.app.shop.core.order.plugin.promotion;

import java.util.List;

import org.springframework.stereotype.Service;

import com.baigu.framework.plugin.AutoRegisterPluginsBundle;

/**
 * 优惠规则插件桩
 * @author kingapex
 *2010-4-15下午03:50:35
 */
@Service("promotionPluginBundle")
public class PromotionPluginBundle extends AutoRegisterPluginsBundle {

	
	public String getName() {
		 
		return "优惠规则插件桩";
	}
	
	public List getPluginList(){
		
		return this.getPlugins();
	}
	

}
