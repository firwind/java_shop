package com.baigu.app.shop.core.goods.utils;

import com.baigu.app.shop.core.goods.model.support.SpecJson;
import com.baigu.eop.sdk.context.UserConext;
import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class GoodsUtils {
	
	
	public static List getSpecList(String specString){
		if(specString==null || specString.equals("[]") ||specString.equals("") ){
			return new ArrayList();
		} 
		JSONArray j1 = JSONArray.fromObject(specString);
		List<SpecJson> list =(List) JSONArray.toCollection(j1, SpecJson.class);		
		return list;
	}

	/**
	 * 处理商品映射值
	 *
	 * @param goods
	 */
	public static void handleGoodsMap(Map goods) {
		if (goods == null) {
			return;
		}
		if (UserConext.getCurrentMember() == null && goods.get("price") != null && goods.get("mktprice") != null) {
			goods.put("price", goods.get("mktprice"));
		}
	}

	public static void handleGoodsMap(List<Map> goodsList) {
		if (goodsList == null) {
			return;
		}
		for (Map goods : goodsList) {
			handleGoodsMap(goods);
		}
	}
}
