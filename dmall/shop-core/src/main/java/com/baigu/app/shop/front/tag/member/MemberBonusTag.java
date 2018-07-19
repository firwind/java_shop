package com.baigu.app.shop.front.tag.member;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.component.agent.service.IMemberBonusManager;
import com.baigu.app.shop.core.agent.model.MonthBonus;
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
 * 我的奖金
 * Created by baigu on 2018/4/10.
 */
@Component
@Scope("prototype")
public class MemberBonusTag extends BaseFreeMarkerTag {

    @Autowired
    private IMemberBonusManager memberBonusManager;

    @Override
    protected Object exec(Map params) throws TemplateModelException {
        Member member = UserConext.getCurrentMember();
        MonthBonus mb = null;
        if (member == null) {
//            throw new TemplateModelException("未登录不能使用此标签[MemberSaleTag]");
            mb = new MonthBonus();
            mb.setMember_id(0);
            mb.setMonth(DateUtil.getCurrentMonthString());
            mb.setPerson_sale(BigDecimal.ZERO);
            mb.setTeam_sale(BigDecimal.ZERO);
            mb.setTeam_bonus(BigDecimal.ZERO);
            mb.setPerson_bonus(BigDecimal.ZERO);
            return mb;
        }
        mb = memberBonusManager.getMemberMonthBonus(DateUtil.getCurrentMonthString(), member.getMember_id());
        if (mb == null) {
            mb = new MonthBonus();
            mb.setMember_id(member.getMember_id());
            mb.setMonth(DateUtil.getCurrentMonthString());
            mb.setPerson_sale(BigDecimal.ZERO);
            mb.setTeam_sale(BigDecimal.ZERO);
            mb.setTeam_bonus(BigDecimal.ZERO);
            mb.setPerson_bonus(BigDecimal.ZERO);
        } else {
            if (mb.getRecount() != null && mb.getRecount() == MonthBonus.RECOUNT) {//需要重新计算奖金
                memberBonusManager.reCountMonthBonus(mb);
            }
        }
        return mb;
    }
}
