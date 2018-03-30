package com.baigu.app.shop.component.receipt.tag;

import java.util.Map;

import com.baigu.app.shop.component.receipt.Receipt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.core.member.service.IMemberReceiptManager;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.taglib.BaseFreeMarkerTag;

import freemarker.template.TemplateModelException;

/**
 * 
 * 会员默认发票 ，如果无默认发票，则返回一个String型 “0”。
 * @author wanglu
 * @version v1.0
 * @since v1.0
 * 2017年6月27日 下午3:44:58
 */
@Component
public class DefaultReceiptTag extends BaseFreeMarkerTag{

	@Autowired
	private IMemberReceiptManager memberReceiptManager;
	
	@SuppressWarnings({ "rawtypes" })
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		Member member = UserConext.getCurrentMember();
		Receipt receipt = new Receipt();
		if(member == null){
			return receipt;
		}else{
			Integer memberid = member.getMember_id();
			receipt = this.memberReceiptManager.getDefultReceipt(memberid);
		}
		return receipt;
	}

}
