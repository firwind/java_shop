package com.baigu.app.shop.front.tag.member;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.component.agent.service.IMemberSaleManager;
import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import com.baigu.framework.util.DateUtil;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Map;

/**
 * 我的销量
 * Created by baigu on 2018/4/10.
 */
@Component
@Scope("prototype")
public class MemberSaleTag extends BaseFreeMarkerTag {

    @Autowired
    private IMemberSaleManager memberSaleManager;

    @Override
    protected Object exec(Map params) throws TemplateModelException {
        Member member = UserConext.getCurrentMember();
        MonthSale ms;
        if (member == null) {
//            throw new TemplateModelException("未登录不能使用此标签[MemberSaleTag]");
            ms = new MonthSale();
            ms.setMember_id(0);
            ms.setMonth(DateUtil.getCurrentMonthString());
            ms.setPerson_sale(BigDecimal.ZERO);
            ms.setTeam_sale(BigDecimal.ZERO);
            ms.setPerson_daily_sale(BigDecimal.ZERO);
            ms.setTeam_daily_sale(BigDecimal.ZERO);
            return ms;
        }
        ms = memberSaleManager.getMemberMonthSale(DateUtil.getCurrentMonthString(), member.getMember_id());
        return ms;
    }
}
