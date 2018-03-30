package com.baigu.app.shop.core.member.service.impl;

import com.baigu.app.shop.core.member.model.MessageBg;
import com.baigu.app.shop.core.member.service.IMessageBgManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baigu.eop.resource.model.AdminUser;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import com.baigu.framework.util.DateUtil;

/**
 * 后台站内消息 
 * @author fk
 * @version v1.0
 * @since v6.1
 * 2016年12月5日 下午1:29:45
 */
@Service
public class MessageBgManager  implements IMessageBgManager {

	@Autowired
	private IDaoSupport daoSupport;

	/*
	 * (non-Javadoc)
	 * @see IMessageBgManager#add(MessageBg)
	 */
	@Override
	public void add(MessageBg messageBg) throws Exception{
		AdminUser adminUser=UserConext.getCurrentAdminUser();
		messageBg.setAdminuser_name(adminUser.getUsername());
		messageBg.setAdminuser_id(adminUser.getUserid());
		messageBg.setSend_time(DateUtil.getDateline());
		daoSupport.insert("es_message_bg", messageBg);
	}

	/*
	 * (non-Javadoc)
	 * @see IMessageBgManager#getAllMessage(int, int)
	 */
	@Override
	public Page getAllMessage(int page, int pageSize) {
		String sql = "select msg_id msgid, msg_content content,msg_title title,send_time sendtime,send_type sendtype,adminuser_id adminid "
				+ " from es_message_bg order by msg_id desc";
		return this.daoSupport.queryForPage(sql, page, pageSize, null);
	}
	
	
	
	
	
	
}
