package com.baigu.app.shop.core.member.plugin;

import com.baigu.app.base.core.model.Member;

/**
 * 会员注销事件
 * @author kingapex
 *
 */
public interface IMemberLogoutEvent {
	 
	public void onLogout(Member member);
	
	
}
