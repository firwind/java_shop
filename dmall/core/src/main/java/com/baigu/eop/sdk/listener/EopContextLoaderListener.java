package com.baigu.eop.sdk.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.baigu.app.base.core.model.FastDfsSetting;
import com.baigu.framework.component.IComponentManager;
import com.baigu.app.base.core.model.ClusterSetting;
import com.baigu.eop.SystemSetting;
import com.baigu.eop.resource.model.EopSite;
import com.baigu.eop.sdk.context.EopSetting;
import com.baigu.eop.sdk.utils.JavaReflection;
import com.baigu.framework.context.spring.SpringContextHolder;

/**
 * EopLinstener 负责初始化站点缓存
 * @author kingapex
 * 2010-7-18下午04:01:16
 */
public class EopContextLoaderListener implements ServletContextListener {

	
	public void contextDestroyed(ServletContextEvent event) {

	}
	
	public void contextInitialized(ServletContextEvent event) {
	 
	 
		if( EopSetting.INSTALL_LOCK.toUpperCase().equals("YES") ){

			ClusterSetting.load();//重新加载集群配置
			FastDfsSetting.load();//重新加载Fastdfs配置
			EopSite.reload(); //重新加载站点设置
			SystemSetting.load();
			
			//如果是多店产品,设置店铺设置
			if(EopSetting.PRODUCT.equals("b2b2c")){
				Object obj = SpringContextHolder.getBean("storeSetting");
				try {
					JavaReflection.invokeMethod(obj, "load", new Object[0]);
				} catch (Exception e) {
					e.printStackTrace(); 
				}
			}
			//订单设置
			Object obj = SpringContextHolder.getBean("orderSetting");
			try {
				JavaReflection.invokeMethod(obj, "load", new Object[0]);
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			
			IComponentManager componentManager = SpringContextHolder.getBean("componentManager");
			componentManager.startComponents(); //启动组件
		}
		
	}
	
	  

}
