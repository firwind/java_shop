package com.baigu.app.shop.front.tag.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.baigu.app.shop.core.order.service.ISellBackManager;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.model.Member;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.Page;
import com.baigu.framework.taglib.BaseFreeMarkerTag;

import freemarker.template.TemplateModelException;
/**
 * 退货申请列表标签
 * @author fenlongli
 *
 */
@Component
public class SellBackListTag extends BaseFreeMarkerTag {
	private ISellBackManager sellBackManager;
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String page = request.getParameter("page");
		page=page==null?"1":page;
		Member member =  UserConext.getCurrentMember();
		int pageSize = 5;
		
		Page webpage=sellBackManager.list(member.getMember_id(),Integer.parseInt(page), pageSize);
		Long totalCount = webpage.getTotalCount();

		Map result = new HashMap();
		List resultList = (List) webpage.getResult();
		resultList = resultList == null ? new ArrayList() : resultList;

		
		result.put("totalCount", totalCount);
		result.put("pageSize", pageSize);
		result.put("page", page);
		result.put("resultList", resultList);
		return result;
	}
	public ISellBackManager getSellBackManager() {
		return sellBackManager;
	}
	public void setSellBackManager(ISellBackManager sellBackManager) {
		this.sellBackManager = sellBackManager;
	}
	
}
