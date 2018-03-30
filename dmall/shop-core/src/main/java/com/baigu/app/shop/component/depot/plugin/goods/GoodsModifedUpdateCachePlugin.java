package com.baigu.app.shop.component.depot.plugin.goods;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.baigu.app.shop.core.goods.plugin.IGoodsAfterAddEvent;
import org.springframework.stereotype.Component;

import com.baigu.app.shop.core.goods.plugin.IGoodsAfterEditEvent;
import com.baigu.framework.plugin.AutoRegisterPlugin;
@Component
public class GoodsModifedUpdateCachePlugin extends AutoRegisterPlugin implements
        IGoodsAfterAddEvent, IGoodsAfterEditEvent {
	
	public void updateCache(Map goods){
		int catid = Integer.valueOf(goods.get("cat_id").toString());
		int goodsid= Integer.valueOf(goods.get("goods_id").toString());
		
		String link ="";
	 
			link="/goods-"+goodsid+".html";
	 
//		HttpCacheManager.updateUrlModified(link);
//		HttpCacheManager.updateUriModified("/search-(.*).html");
	}

	
	@Override
	public void onAfterGoodsEdit(Map goods, HttpServletRequest request) {
		updateCache(goods);
	}

	@Override
	public void onAfterGoodsAdd(Map goods, HttpServletRequest request)
			throws RuntimeException {
		updateCache(goods);
	}

}
