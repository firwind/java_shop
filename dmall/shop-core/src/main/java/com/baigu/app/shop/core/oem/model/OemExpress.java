package com.baigu.app.shop.core.oem.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * create by xt on 2018-07-27 17:17
 */
public class OemExpress implements Serializable {
    private Integer id;
    private String expname;
    private String province;
    private BigDecimal fweight;
    private BigDecimal sweight;
    private BigDecimal fmoney;
    private BigDecimal smoney;
    private Date updatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getExpname() {
        return expname;
    }

    public void setExpname(String expname) {
        this.expname = expname;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public BigDecimal getFweight() {
        return fweight;
    }

    public void setFweight(BigDecimal fweight) {
        this.fweight = fweight;
    }

    public BigDecimal getSweight() {
        return sweight;
    }

    public void setSweight(BigDecimal sweight) {
        this.sweight = sweight;
    }

    public BigDecimal getFmoney() {
        return fmoney;
    }

    public void setFmoney(BigDecimal fmoney) {
        this.fmoney = fmoney;
    }

    public BigDecimal getSmoney() {
        return smoney;
    }

    public void setSmoney(BigDecimal smoney) {
        this.smoney = smoney;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
