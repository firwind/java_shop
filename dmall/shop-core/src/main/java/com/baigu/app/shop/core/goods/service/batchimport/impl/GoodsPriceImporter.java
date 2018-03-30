package com.baigu.app.shop.core.goods.service.batchimport.impl;

import java.util.Map;

import com.baigu.app.shop.core.goods.model.ImportDataSource;
import org.w3c.dom.Element;

public class GoodsPriceImporter implements com.baigu.app.shop.core.goods.service.batchimport.IGoodsDataImporter {

	public void imported(Object value, Element node, ImportDataSource importDs,
			Map goods) {
		if( value ==null || value.equals("")) value=0;
		
		if(importDs.isNewGoods()){
			if("mkprice".equals(node.getAttribute("type"))){
				goods.put("mktprice", value) ;
			}else
			goods.put("price", value) ;
		}
	}

}
