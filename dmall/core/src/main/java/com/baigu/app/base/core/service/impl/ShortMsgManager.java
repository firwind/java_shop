package com.baigu.app.base.core.service.impl;

import java.util.List;

import com.baigu.app.base.core.plugin.shortmsg.ShortMsgPluginBundle;
import com.baigu.app.base.core.service.IShortMsgManager;
import com.baigu.framework.database.IDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baigu.app.base.core.model.ShortMsg;

/**
 * 短消息管理
 * @author kingapex
 *
 */
@Service
public class ShortMsgManager   implements IShortMsgManager {

	@Autowired
	private ShortMsgPluginBundle shortMsgPluginBundle;
	
	@Autowired
	protected IDaoSupport daoSupport;
	
	
	@Override
	public List<ShortMsg> listNotReadMessage() {
		return shortMsgPluginBundle.getMessageList();
	}

	
}
