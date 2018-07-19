package com.baigu.app.shop.component.agent.service;

import com.baigu.app.shop.core.agent.model.MonthBonus;
import com.baigu.framework.database.Page;

/**
 * 会员奖金
 * Created by baigu on 2018/4/10.
 */
public interface IMemberBonusManager {

    /**
     * 获取会员月奖金
     *
     * @param month    月份 yyyyMM
     * @param memberId 会员id
     * @return
     */
    MonthBonus getMemberMonthBonus(String month, Integer memberId);

    /**
     * 获取团队成员奖金列表
     *
     * @param page
     * @param pageSize
     * @param month
     * @param memberId
     * @return
     */
    Page getTeamBonusList(Integer page, Integer pageSize, String month, Integer memberId);

    /**
     * 重新计算月奖金
     *
     * @param bonus
     * @return
     */
    void reCountMonthBonus(MonthBonus bonus);
}
