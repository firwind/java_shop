package com.baigu.app.base.core.plugin.user;

import com.baigu.eop.resource.model.AdminUser;


/**
 * 管理员登录事件
 * @author kingapex
 *
 */
public interface IAdminUserLoginEvent {
	
	public void onLogin(AdminUser user);
	
}
