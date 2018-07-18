package com.baigu.app.shop.component.agent.service.impl;

import com.baigu.app.shop.component.agent.service.IMemberSaleManager;
import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lzg on 2018/4/10.
 */
@Service("memberSaleManager")
public class MemberSaleManager implements IMemberSaleManager {

    @Autowired
    private IDaoSupport daoSupport;

    @Override
    public MonthSale getMemberMonthSale(String month, Integer memberId) {
        return daoSupport.queryForObject("select * from es_month_sale where member_id = ? and month = ?",
                MonthSale.class, memberId, month);
    }

    @Override
    public Page getTeamSaleList(Integer page, Integer pageSize, String month, Integer memberId) {
        return this.daoSupport.queryForPage("SELECT m.member_id, m.uname, s.`month`, IFNULL(s.person_sale, 0) as person_sale, " +
                        "IFNULL(s.team_sale, 0) as team_sale from es_member m " +
                        "left join es_month_sale s on m.member_id = s.member_id and s.`month` = ? " +
                        "where m.parentid = ? order by team_sale desc",
                page, pageSize, month, memberId);
    }
}
