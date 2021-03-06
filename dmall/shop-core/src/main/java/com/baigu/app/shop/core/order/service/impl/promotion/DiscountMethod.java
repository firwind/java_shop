package com.baigu.app.shop.core.order.service.impl.promotion;

import javax.servlet.http.HttpServletRequest;

import com.baigu.app.shop.core.order.service.promotion.IDiscountBehavior;
import com.baigu.app.shop.core.order.service.promotion.IPromotionMethod;

import com.baigu.app.shop.core.order.model.Promotion;
import com.baigu.eop.processor.core.freemarker.FreeMarkerPaser;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.util.CurrencyUtil;

/**
 * 对指定的商品直接打拆
 * @author kingapex
 *2010-4-18上午09:14:58
 */
public class DiscountMethod implements IPromotionMethod,IDiscountBehavior {

	
	public String getInputHtml(Integer pmtid, String solution) {
		FreeMarkerPaser freeMarkerPaser = FreeMarkerPaser.getInstance();
		freeMarkerPaser.setClz(this.getClass());
		freeMarkerPaser.putData("discount",  solution );
		return freeMarkerPaser.proessPageContent();
	}

	
	public String getName() {
		return "discount";
	}

	
	public String onPromotionSave(Integer pmtid) {
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		String discount = request.getParameter("discount");
		return discount==null?"":discount;
	}

	
	public Double discount(Promotion promotion, Double  goodsPrice) {
		String solution = promotion.getPmt_solution();
		Double  discount =  Double.valueOf(solution);
		return CurrencyUtil.mul(goodsPrice, discount);
	}


}
