package com.baigu.app.shop.core.agent.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 代理奖金规则设置
 * Created by baigu on 2018/4/9.
 */
public class BonusRule implements Serializable {

    private Integer id;
    private Integer begin_money;
    private Integer end_money;
    private String percentage;
    private Date create_time;
    private Date update_time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBegin_money() {
        return begin_money;
    }

    public void setBegin_money(Integer begin_money) {
        this.begin_money = begin_money;
    }

    public Integer getEnd_money() {
        return end_money;
    }

    public void setEnd_money(Integer end_money) {
        this.end_money = end_money;
    }

    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    public Date getCreate_time() {
        return create_time;
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
