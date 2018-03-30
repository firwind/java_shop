package com.baigu.app.shop.core.order.service.impl.promotion;

import javax.servlet.http.HttpServletRequest;

import com.baigu.app.shop.core.order.model.Promotion;
import com.baigu.app.shop.core.order.service.promotion.IPromotionMethod;
import com.baigu.app.shop.core.order.service.promotion.ITimesPointBehavior;
import com.baigu.eop.processor.core.freemarker.FreeMarkerPaser;
import com.baigu.framework.context.webcontext.ThreadContextHolder;

/**
 * 翻倍积分优惠方式实现
 * @author kingapex
 *2010-4-25下午10:32:44
 */
public class TimesPointMethod implements IPromotionMethod, ITimesPointBehavior {

	
	public String getInputHtml(Integer pmtid, String solution) {
		FreeMarkerPaser freeMarkerPaser = FreeMarkerPaser.getInstance();
		freeMarkerPaser.setClz(this.getClass());
		freeMarkerPaser.putData("multiple",  solution );
		return freeMarkerPaser.proessPageContent();
	}

	
	public String getName() {
		 
		return "timesPoint";
	}

	
	public String onPromotionSave(Integer pmtid) {
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		String multiple = request.getParameter("multiple");
		return multiple==null?"":multiple;
	}

	
	public Integer countPoint(Promotion promotion,Integer point) {
		String solution = promotion.getPmt_solution();
		Integer multiple = Integer.valueOf(solution);
		
		return point*multiple;
	}

}
