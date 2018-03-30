package com.baigu.app.base.core.plugin.sms;

import com.baigu.framework.plugin.AutoRegisterPlugin;
import org.apache.log4j.Logger;

public abstract class AbstractSmsPlugin extends AutoRegisterPlugin {
	
	protected final Logger logger = Logger.getLogger(getClass());
	
	
	/**
	 * 为短信插件定义唯一的id
	 * @return
	 */
	public abstract String getId();
	
	
	/**
	 * 定义插件名称
	 * @return
	 */
	public abstract String getName();

}
