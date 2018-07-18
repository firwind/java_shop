package com.baigu.app.shop.core.agent.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 代理月奖金
 * Created by baigu on 2018/4/9.
 */
public class MonthBonus implements Serializable {

    private Integer member_id; // 会员id
    private String month;  // 奖金月份 yyyyMM
    private BigDecimal person_bonus = BigDecimal.ZERO;  // 个人月奖金
    private BigDecimal team_bonus = BigDecimal.ZERO;  // 团队月奖金
    private BigDecimal person_sale = BigDecimal.ZERO;  // 个人月销量
    private BigDecimal team_sale = BigDecimal.ZERO;  // 团队月销量
    private Date update_time;  // 记录更新时间

    public Integer getMember_id() {
        return member_id;
    }

    public void setMember_id(Integer member_id) {
        this.member_id = member_id;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public BigDecimal getPerson_bonus() {
        return person_bonus;
    }

    public void setPerson_bonus(BigDecimal person_bonus) {
        this.person_bonus = person_bonus;
    }

    public BigDecimal getTeam_bonus() {
        return team_bonus;
    }

    public void setTeam_bonus(BigDecimal team_bonus) {
        this.team_bonus = team_bonus;
    }

    public BigDecimal getPerson_sale() {
        return person_sale;
    }

    public void setPerson_sale(BigDecimal person_sale) {
        this.person_sale = person_sale;
    }

    public BigDecimal getTeam_sale() {
        return team_sale;
    }

    public void setTeam_sale(BigDecimal team_sale) {
        this.team_sale = team_sale;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}
