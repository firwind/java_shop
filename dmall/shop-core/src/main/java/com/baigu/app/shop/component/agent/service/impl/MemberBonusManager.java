package com.baigu.app.shop.component.agent.service.impl;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.component.agent.service.IMemberBonusManager;
import com.baigu.app.shop.component.agent.service.IMemberSaleManager;
import com.baigu.app.shop.core.agent.model.BonusRule;
import com.baigu.app.shop.core.agent.model.MonthBonus;
import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by lzg on 2018/4/10.
 */
@Service("memberBonusManager")
public class MemberBonusManager implements IMemberBonusManager {

    protected final Logger logger = Logger.getLogger(getClass());

    @Autowired
    private IDaoSupport daoSupport;
    @Autowired
    private IMemberSaleManager memberSaleManager;

    @Override
    public MonthBonus getMemberMonthBonus(String month, Integer memberId) {
        return daoSupport.queryForObject("select * from es_month_bonus where member_id = ? and month = ?",
                MonthBonus.class, memberId, month);
    }

    @Override
    public Page getTeamBonusList(Integer page, Integer pageSize, String month, Integer memberId) {
        return this.daoSupport.queryForPage("SELECT m.member_id, m.uname, s.`month`, IFNULL(s.person_bonus, 0) as person_bonus, " +
                        "IFNULL(s.team_bonus, 0) as team_bonus from es_member m " +
                        "left join es_month_bonus s on m.member_id = s.member_id and s.`month` = ? " +
                        "where m.parentid = ? order by team_bonus desc",
                page, pageSize, month, memberId);
    }

    @Override
    public void reCountMonthBonus(MonthBonus bonus) {
        MonthSale ms = memberSaleManager.getMemberMonthSale(bonus.getMonth(), bonus.getMember_id());
        List<BonusRule> bonusRules = this.daoSupport.queryForList("SELECT * FROM `es_bonus_rule`", BonusRule.class);
        bonus.setPerson_sale(ms.getPerson_sale());
        bonus.setTeam_sale(ms.getTeam_sale());
        bonus.setTeam_bonus(getTeamBonus(ms.getTeam_sale(), bonusRules));
        bonus.setPerson_bonus(getPersonBonus(bonus.getTeam_bonus(), bonusRules, bonus.getMonth(), bonus.getMember_id()));
        bonus.setRecount(MonthBonus.NOTRECOUNT);//计算完成，修改标识
        //更新数据库
        this.daoSupport.update("es_month_bonus", bonus, "member_id=" + bonus.getMember_id() + " AND `month`=" + bonus.getMonth());
    }

    /**
     * 计算个人奖金（团队奖金 - 所有直接下级的团队奖金）
     *
     * @param teamBonus
     * @param bonusRules
     * @param month
     * @param memberId
     * @return
     */
    private BigDecimal getPersonBonus(BigDecimal teamBonus, List<BonusRule> bonusRules, String month, Integer memberId) {
        List<Member> subMemberTrees = this.daoSupport.queryForList("SELECT * FROM es_member WHERE parentid = ?", Member.class, memberId);
        BigDecimal totalSubTeamBonus = BigDecimal.ZERO;
        for (Member sub : subMemberTrees) {
            MonthSale subMonthSale = memberSaleManager.getMemberMonthSale(month, sub.getMember_id());
            if (subMonthSale == null) {
                subMonthSale = new MonthSale();
                subMonthSale.setTeam_sale(BigDecimal.ZERO);
                subMonthSale.setPerson_sale(BigDecimal.ZERO);
            }
            BigDecimal subTeamBonus = this.getTeamBonus(subMonthSale.getTeam_sale(), bonusRules);
            totalSubTeamBonus = totalSubTeamBonus.add(subTeamBonus);
        }
        BigDecimal personBonus = teamBonus.subtract(totalSubTeamBonus);
        return personBonus;
    }

    /**
     * 计算团队奖金
     *
     * @param teamSale
     * @param bonusRules
     * @return
     */
    private BigDecimal getTeamBonus(BigDecimal teamSale, List<BonusRule> bonusRules) {
        if (CollectionUtils.isEmpty(bonusRules)) {
            this.logger.warn("奖金计算规则为空");
            return BigDecimal.ZERO;
        }
        if (teamSale.compareTo(BigDecimal.ZERO) <= 0) {
            return BigDecimal.ZERO;
        }
        BigDecimal percentage = null;
        BonusRule minRule = bonusRules.get(0);
        BonusRule maxRule = bonusRules.get(bonusRules.size() - 1);
        for (BonusRule rule : bonusRules) {
            if (teamSale.compareTo(rule.getBegin_money()) > 0 &&
                    teamSale.compareTo(rule.getEnd_money()) <= 0) {
                percentage = rule.getPercentage();
                break;
            }
        }
        if (percentage == null && teamSale.compareTo(minRule.getBegin_money()) < 0) {
            percentage = BigDecimal.ZERO;
        }
        if (percentage == null && teamSale.compareTo(minRule.getBegin_money()) == 0) {
            percentage = minRule.getPercentage();
        }
        if (percentage == null && teamSale.compareTo(maxRule.getEnd_money()) > 0) {
            percentage = maxRule.getPercentage();
        }
        return teamSale.multiply(percentage).setScale(2, BigDecimal.ROUND_FLOOR);
    }
}
