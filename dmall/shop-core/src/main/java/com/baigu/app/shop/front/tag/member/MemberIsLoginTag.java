package com.baigu.app.shop.front.tag.member;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.model.Member;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.taglib.BaseFreeMarkerTag;

import freemarker.template.TemplateModelException;
/**
 * 判断会员是否登录的标签
 * @author lina
 *
 */
@Component
@Scope("prototype")
public class MemberIsLoginTag extends BaseFreeMarkerTag {
	/**
	 * @param 无
	 * @return  isLogin boolean型 
	 */
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		Member member = UserConext.getCurrentMember();
		boolean isLogin = false;
		if(member!=null){
			isLogin = true;
		}
		return isLogin;
	}

}
