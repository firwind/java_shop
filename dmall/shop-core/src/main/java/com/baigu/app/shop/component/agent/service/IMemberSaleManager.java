package com.baigu.app.shop.component.agent.service;

import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.framework.database.Page;

/**
 * 会员销量及奖金
 * Created by baigu on 2018/4/10.
 */
public interface IMemberSaleManager {

    /**
     * 获取会员月销量
     * @param month 月份 yyyyMM
     * @param memberId 会员id
     * @return
     */
    MonthSale getMemberMonthSale(String month, Integer memberId);

    /**
     * 获取团队成员销量列表
     * @param page
     * @param pageSize
     * @param month
     * @param memberId
     * @return
     */
    Page getTeamSaleList(Integer page, Integer pageSize, String month, Integer memberId);

    /**
     * 扣减月销量
     *
     * @param amount
     * @param memberId
     */
    void reduceMonthSale(Double amount, String month, Integer memberId);
}
