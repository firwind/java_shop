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
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 我的历史奖金
 * Created by baigu on 2018/4/10.
 */
@Component
@Scope("prototype")
public class MemberHistoryBonusTag extends BaseFreeMarkerTag {

    @Autowired
    private IMemberBonusManager memberBonusManager;

    @Override
    protected Object exec(Map params) throws TemplateModelException {
        Member member = UserConext.getCurrentMember();
        if (member == null) {
            throw new TemplateModelException("未登录不能使用此标签[MemberHistoryBonusTag]");
        }
        List<MonthBonus> mhb = new LinkedList<MonthBonus>();
        int showMonthCount = 3; //展示近3个月的奖金
        for (int i = 0; i < 3; i++) {
            String month = DateUtil.getMonthString(-i);
            MonthBonus mb = this.getMonthBonus(member.getMember_id(), month);
            mhb.add(mb);
        }
        return mhb;
    }

    private MonthBonus getMonthBonus(Integer memberId, String month) {
        MonthBonus mb = memberBonusManager.getMemberMonthBonus(month, memberId);
        if (mb == null) {
            mb = new MonthBonus();
            mb.setMember_id(memberId);
            mb.setMonth(month);
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
