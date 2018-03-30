package com.baigu.app.shop.front.tag.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.core.member.model.MemberAddress;
import com.baigu.app.shop.core.member.service.IMemberAddressManager;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.taglib.BaseFreeMarkerTag;

import freemarker.template.TemplateModelException;

/**
 * 会员地址
 * @author xulipeng
 * whj 0819 09：48修改如下：
 * 如果无默认地址，则返回一个String型 “0”。
 */

@Component
public class DefaultConsigneeTag extends BaseFreeMarkerTag{

	@Autowired
	private IMemberAddressManager memberAddressManager;
	
	@SuppressWarnings({ "rawtypes" })
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		Member member = UserConext.getCurrentMember();
		MemberAddress address = new MemberAddress();
		if(member == null){
			return address;
		}else{
			Integer memberid = member.getMember_id();
			address = this.memberAddressManager.getMemberDefault(memberid);
		}
		return address;
	}

}
