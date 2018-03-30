package com.baigu.app.shop.component.goodscore;

import org.springframework.stereotype.Component;

import com.baigu.app.base.core.service.solution.IInstaller;
import com.baigu.framework.component.IComponent;
import com.baigu.framework.context.spring.SpringContextHolder;

@Component
public class GoodsCoreComponent implements IComponent {

	@Override
	public void install() {
		IInstaller installer  = SpringContextHolder.getBean("warningSettingInstaller");
		
		installer.install("inventory", null);	
	}

	@Override
	public void unInstall() {
		 

	}

}
