package com.baigu.app.shop.component.bonus.tag;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.component.bonus.service.IBonusManager;
import com.baigu.app.shop.core.order.service.ICartManager;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.Page;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import com.baigu.framework.util.JsonResultUtil;

import freemarker.template.TemplateModelException;

/**
 * 结算页——读取我的优惠券，不可用列表
 * @author xulipeng
 * @version v1.0
 * @since v6.2.1
 */
@Component
@Scope("prototype")
public class MyBonusByNotUsableTag extends BaseFreeMarkerTag {

	@Autowired
	private IBonusManager BonusManager;
	
	@Autowired
	private ICartManager cartManager;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		Map result = new HashMap();
		
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		
		Member member = UserConext.getCurrentMember();
		if(member ==null){
			return JsonResultUtil.getErrorJson("未登录，不能使用此api");
		}
		
		//第几页
		String page = request.getParameter("page");
		page = (page == null || page.equals("")) ? "1" : page;
		
		//每页多少条
		String pageSize = request.getParameter("pageSize");
		pageSize = (pageSize == null || pageSize.equals("")) ? "10" : pageSize;
		
		//商品价格
		Double goodsprice = cartManager.countGoodsTotal(ThreadContextHolder.getSession().getId());
		
		//不可用优惠券列表
		Page webpage = this.BonusManager.getMyUsableBonus(member.getMember_id(), goodsprice, Integer.parseInt(page), Integer.parseInt(pageSize), 0);
		
		Long totalCount = webpage.getTotalCount();
		List<Map> bonusList = (List) webpage.getResult();
		bonusList = bonusList == null ? new ArrayList() : bonusList;
		
		result.put("totalCount", totalCount);
		result.put("pageSize", pageSize);
		result.put("page", page);
		result.put("noUseBonusList", bonusList);
		
		return result;
	}

}
