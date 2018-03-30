package com.baigu.app.base.core.plugin.user;

import com.baigu.eop.resource.model.AdminUser;

/**
 * 管理员页面展示事件
 * @author kingapex
 *
 */
public interface IAdminUserInputDisplayEvent {
	public String getInputHtml(AdminUser user);
	
}