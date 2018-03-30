package com.baigu.app.shop.core.order.service.promotion.impl;

import javax.servlet.http.HttpServletRequest;

import com.baigu.app.shop.core.order.model.Promotion;
import com.baigu.app.shop.core.order.service.promotion.IPromotionMethod;
import com.baigu.app.shop.core.order.service.promotion.IReducePriceBehavior;
import com.baigu.eop.processor.core.freemarker.FreeMarkerPaser;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.util.CurrencyUtil;

/**
 * 减价优惠方式
 * @author kingapex
 *2010-4-19下午04:03:42
 */
public class ReducePriceMethod implements IPromotionMethod,
		IReducePriceBehavior {

	
	public String getInputHtml(Integer pmtid, String solution) {
		FreeMarkerPaser freeMarkerPaser = FreeMarkerPaser.getInstance();
		freeMarkerPaser.setClz(this.getClass());
		freeMarkerPaser.putData("lessMoney", solution);
		return freeMarkerPaser.proessPageContent();
	}

	
	public String getName() {
		return "reducePrice";
	}

	
	public String onPromotionSave(Integer pmtid) {
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		String reducePrice = request.getParameter("lessMoney");
		return reducePrice==null?"":reducePrice;
	}

	
	public Double reducedPrice(Promotion pmt,Double price) {
		String solution = pmt.getPmt_solution();
		Double  lessMoney =  Double.valueOf(solution);
		return CurrencyUtil.sub(price, lessMoney);
	}


}
