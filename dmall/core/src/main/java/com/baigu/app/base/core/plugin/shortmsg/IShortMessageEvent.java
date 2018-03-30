package com.baigu.app.base.core.plugin.shortmsg;

import java.util.List;

import com.baigu.app.base.core.model.ShortMsg;

/**
 * 后台短消息获取事件
 * @author kingapex
 *
 */
public interface IShortMessageEvent  {
 
	public List<ShortMsg> getMessage();
 
}
