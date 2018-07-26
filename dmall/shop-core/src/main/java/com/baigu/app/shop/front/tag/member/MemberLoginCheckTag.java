package com.baigu.app.shop.front.tag.member;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.base.core.model.MemberBank;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import com.baigu.framework.util.RequestUtil;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Component
@Scope("prototype")
public class MemberLoginCheckTag extends BaseFreeMarkerTag {

	@Autowired
	private IDaoSupport daoSupport;
	
	/**
	 * 会员详细标签
	 * @param 无
	 * @return 返回当前会员,Member型
	 * 如果未登录，返回null
	 * {@link Member}
	 */
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		String loginUrl = (String) params.get("login_url");
		
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String curr_url = RequestUtil.getRequestUrl(request);
		
		String ctx = this.getRequest().getContextPath();
		if("/".equals(ctx)){
			ctx="";
		}
		if(loginUrl==null){
			loginUrl = ctx+"/login.html?forward=" + curr_url;
		}else{
			loginUrl=ctx+loginUrl;
		}
		Member member = UserConext.getCurrentMember();
		if (member == null) {
			HttpServletResponse response = ThreadContextHolder.getHttpResponse();
			try {
				response.sendRedirect(loginUrl);
				Member nullMember = new Member();
				nullMember.setMember_id(0);
				return nullMember;
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		} else {
			//追加银行卡信息
			MemberBank mb = this.daoSupport.queryForObject("SELECT * FROM es_member_bank WHERE member_id = " + member.getMember_id(), MemberBank.class);
			if (mb != null) {
				member.setBankaccount(mb.getBankaccount());
				member.setBankno(mb.getBankno());
				member.setBankname(mb.getBankname());
			}
			return member;
		}
	}
}
