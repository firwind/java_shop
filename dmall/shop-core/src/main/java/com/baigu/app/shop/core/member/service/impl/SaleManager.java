package com.baigu.app.shop.core.member.service.impl;

import com.baigu.app.shop.component.agent.service.impl.MemberSaleManager;
import com.baigu.app.shop.core.member.service.ISaleManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * create by xt on 2018-07-20 18:13
 */
@Service("saleManager")
public class SaleManager implements ISaleManager {

    @Autowired
    private IDaoSupport daoSupport;

    @Autowired
    private MemberSaleManager memberSaleManager;

    /**
     * 查询销量分页
     *
     * @param map
     * @param page
     * @param pageSize
     * @param other
     * @param order
     * @return
     */
    @Override
    public Page pageSale(Map map, int page, int pageSize, String other, String order) {

        String sql = "SELECT * FROM es_month_bonus order by `month` DESC";
        Page webPage = this.daoSupport.queryForPage(sql, page, pageSize);
        return webPage;
    }
}
