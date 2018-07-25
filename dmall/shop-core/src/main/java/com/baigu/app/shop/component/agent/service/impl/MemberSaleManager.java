package com.baigu.app.shop.component.agent.service.impl;

import com.baigu.app.shop.component.agent.service.IMemberSaleManager;
import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.app.shop.core.order.service.OrderStatus;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import com.baigu.framework.util.DateUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * Created by lzg on 2018/4/10.
 */
@Service("memberSaleManager")
public class MemberSaleManager implements IMemberSaleManager {

    @Autowired
    private IDaoSupport daoSupport;

    @Override
    public MonthSale getMemberMonthSale(String month, Integer memberId) {
        MonthSale ms = daoSupport.queryForObject("select * from es_month_sale where member_id = ? and month = ?",
                MonthSale.class, memberId, month);
        if (ms == null) {
            ms = new MonthSale();
            ms.setMember_id(memberId);
            ms.setMonth(DateUtil.getCurrentMonthString());
            ms.setPerson_sale(BigDecimal.ZERO);
            ms.setTeam_sale(BigDecimal.ZERO);
            ms.setPerson_daily_sale(BigDecimal.ZERO);
            ms.setTeam_daily_sale(BigDecimal.ZERO);
        } else {
            ms.setPerson_daily_sale(getPersonDailySale(memberId));
            ms.setTeam_daily_sale(getTeamDailySal(memberId, ms.getPerson_daily_sale()));
        }
        return ms;
    }

    /**
     * 获取会员个人日销量
     *
     * @param memberId
     * @return
     */
    private BigDecimal getPersonDailySale(Integer memberId) {
        long sTime = DateUtil.startOfSomeDay(0);//当天开始
        long eTime = DateUtil.startOfSomeDay(-1);//当天结束
        long personDailySale = this.daoSupport.queryForLong("SELECT IFNULL(SUM(o.goods_amount),0) FROM es_order o " +
                "LEFT JOIN es_member m ON o.member_id = m.member_id " +
                "WHERE 1=1 AND (o.status = " + OrderStatus.PAY_YES + " OR o.status = " + OrderStatus.ORDER_COMPLETE + ") AND o.member_id = ?  AND o.create_time >= ? AND o.create_time <=?", memberId, sTime, eTime);
        return BigDecimal.valueOf(personDailySale);
    }

    /**
     * 获取会员团队日销量
     *
     * @param memberId
     * @param personDailySale
     * @return
     */
    private BigDecimal getTeamDailySal(Integer memberId, BigDecimal personDailySale) {
        long sTime = DateUtil.startOfSomeDay(0);//当天开始
        long eTime = DateUtil.startOfSomeDay(-1);//当天结束
        long subPersonSale = this.daoSupport.queryForLong("SELECT IFNULL(SUM(o.goods_amount),0) FROM es_order o " +
                "LEFT JOIN es_member m ON o.member_id = m.member_id " +
                "WHERE 1=1 AND (o.status = " + OrderStatus.PAY_YES + " OR o.status = " + OrderStatus.ORDER_COMPLETE + ") AND m.parentids LIKE '%[" + memberId + "]%' AND o.create_time >= ? AND o.create_time <=?", sTime, eTime);
        return personDailySale.add(BigDecimal.valueOf(subPersonSale));

    }

    @Override
    public Page getTeamSaleList(Integer page, Integer pageSize, String month, Integer memberId) {
        return this.daoSupport.queryForPage("SELECT " +
                        "b.member_id, b.uname, a.`month`, IFNULL(a.person_sale, 0) AS person_sale, " +
                        "IFNULL(a.team_sale, 0) AS team_sale, IFNULL(a.person_bonus, 0) AS person_bonus, IFNULL(a.team_bonus, 0) AS team_bonus " +
                        "FROM es_month_bonus a LEFT JOIN es_member b ON a.member_id = b.member_id " +
                        "WHERE a.`month` = ? AND b.parentid = ? order by a.team_sale desc",
                page, pageSize, month, memberId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void reduceMonthSale(Double amount, String month, Integer memberId) {
        this.daoSupport.execute("update es_month_sale set person_sale = person_sale - " + amount + ",team_sale = team_sale - " + amount + " where `month` = " + month + " and member_id = " + memberId + " and person_sale >= " + amount + " and team_sale >= " + amount);
        String parentIds = this.daoSupport.queryForString("SELECT parentids FROM es_member WHERE member_id = " + memberId);
        if (StringUtils.isNotBlank(parentIds)) {
            for (String parentId : parentIds.split(",")) {
                parentId = parentId.replace("[", "").replace("]", "");
                this.daoSupport.execute("update es_month_sale set team_sale = team_sale - " + amount + " where `month` = " + month + " and member_id = " + parentId + " and team_sale >= " + amount);
            }
        }
    }
}
