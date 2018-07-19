package com.baigu.app.shop.core.agent.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 代理奖金规则设置
 * Created by baigu on 2018/4/9.
 */
public class BonusRule implements Serializable {

    private Integer id;
    private BigDecimal begin_money;
    private BigDecimal end_money;
    private BigDecimal percentage;
    private Date create_time;
    private Date update_time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public BigDecimal getBegin_money() {
        return begin_money;
    }

    public void setBegin_money(BigDecimal begin_money) {
        this.begin_money = begin_money;
    }

    public BigDecimal getEnd_money() {
        return end_money;
    }

    public void setEnd_money(BigDecimal end_money) {
        this.end_money = end_money;
    }

    public BigDecimal getPercentage() {
        return percentage;
    }

    public void setPercentage(BigDecimal percentage) {
        this.percentage = percentage;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}
