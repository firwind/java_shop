package com.baigu.app.shop.component.decorate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.service.ISiteMenuManager;
import com.baigu.eop.sdk.context.EopSetting;
import com.baigu.framework.component.IComponent;
import com.baigu.framework.component.IComponentStartAble;
import com.baigu.framework.component.IComponentStopAble;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.data.IDataOperation;
/**
 * 装修组件
 * @author    jianghongyan
 * @version   1.0.0,2016年6月20日
 * @since     v6.1
 */
@Component
public class DecorateComponent implements IComponent,IComponentStartAble,IComponentStopAble{

	@Autowired
	private IDataOperation dataOperation;
	
	
	@Autowired
	private ISiteMenuManager siteMenuDbManager;
	
	@Autowired
	private IDaoSupport daoSupport;
	
	public void install() {
		dataOperation.imported("file:com/enation/app/shop/component/decorate/decorate_install.xml");
	
		if("b2b2c".equals(EopSetting.PRODUCT)){
			this.installSubjectSiteMenu();
		}

	}

	public void unInstall() {
		dataOperation.imported("file:com/enation/app/shop/component/decorate/decorate_uninstall.xml");
	}
	
	
	

	
	
	public void installSubjectSiteMenu(){
		String sql="insert into es_site_menu (parentid,name,url,target,sort) values (?,?,?,?,?)";
		this.daoSupport.execute(sql, 0,"专题","subject/subject-index.html","",5);
	}
	/**
	 * 停用方法
	 */
	@Override
	public void stop() {

	}

	/**
	 * 启动方法
	 */
	@Override
	public void start() {

	}
	
}
