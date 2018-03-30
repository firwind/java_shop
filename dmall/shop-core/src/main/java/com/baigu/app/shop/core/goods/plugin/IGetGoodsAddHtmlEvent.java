package com.baigu.app.shop.core.goods.plugin;

import javax.servlet.http.HttpServletRequest;

/**
 * 获取商品添加html事件
 * @author kingapex
 *
 */
public  interface IGetGoodsAddHtmlEvent {
	 
	 public String getAddHtml(HttpServletRequest request);
	
	
} 
