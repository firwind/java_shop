package com.baigu.app.shop.core.goods.service.batchimport.impl;

import java.util.Map;

import com.baigu.app.shop.core.goods.model.ImportDataSource;
import org.w3c.dom.Element;


/**
 * 商品数据导入器接口
 * @author kingapex
 *
 */
public interface IGoodsDataImporter {
	
	/**
	 * 导入
	 * @param node
	 */
	public void imported(Object value, Element node, ImportDataSource importDs, Map goods);
	
	
}
