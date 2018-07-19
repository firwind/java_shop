package com.baigu.app.shop.front.tag.member;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.base.core.service.IMemberManager;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.Page;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 会员我的审核列表标签
 * @author
 *  member 当前登录会员
 *  invitesPage 会员审核分页列表
 */
@Component
@Scope("prototype")
public class MemberInviteListTag extends BaseFreeMarkerTag {
	
	@Autowired
	private IMemberManager memberManager;

	@Override
	protected Object exec(Map params) throws TemplateModelException {
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		
		Member member = UserConext.getCurrentMember();
		if(member==null){
			throw new TemplateModelException("未登录不能使用此标签[MemberInviteListTag]");
		}
		
		String page = request.getParameter("page");
		page = (page == null || page.equals("")) ? "1" : page;
		int pageSize = 5;

		String agentStatus = (String) params.get("agentStatus");

		Map result = new HashMap();

		Page invitesPage = memberManager.getInviteList(Integer.valueOf(page), pageSize,
				agentStatus == null ? null : Integer.valueOf(agentStatus), member.getMember_id());
		Long totalCount = invitesPage.getTotalCount();

		List<Map> inviteList = (List) invitesPage.getResult();
		inviteList = inviteList == null ? new ArrayList() : inviteList;
		
		result.put("totalCount", totalCount);
		result.put("pageSize", pageSize);
		result.put("page", page);
		result.put("inviteList", inviteList);
		return result;

	}


}
