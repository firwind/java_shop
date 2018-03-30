package com.baigu.app.shop.component.ordercore;

import org.springframework.stereotype.Component;

import com.baigu.app.base.core.service.solution.IInstaller;
import com.baigu.framework.component.IComponent;
import com.baigu.framework.context.spring.SpringContextHolder;

/**
 * 订单核心组件
 * @author kingapex
 *2012-2-13下午11:12:51
 */
@Component
public class OrderCoreComponent implements IComponent {

	@Override
	public void install() {
		IInstaller installer  = SpringContextHolder.getBean("orderSettingInstaller");
		
		installer.install("order", null);	
		
	}

	@Override
	public void unInstall() {

	}

}
