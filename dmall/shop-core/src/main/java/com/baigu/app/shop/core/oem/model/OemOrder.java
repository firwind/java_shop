package com.baigu.app.shop.core.oem.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * create by xt on 2018-07-26 16:57
 */
public class OemOrder implements Serializable {
    private Integer id;
    private String orderno;
    private String expname;
    private BigDecimal freight;
    private Integer customer_id;
    private BigDecimal price;
    private String cneename;
    private String cneephone;
    private String cneeprovince;
    private String cneecity;
    private String cneeaddr;
    private Date updatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }

    public String getExpname() {
        return expname;
    }

    public void setExpname(String expname) {
        this.expname = expname;
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public Integer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Integer customer_id) {
        this.customer_id = customer_id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getCneename() {
        return cneename;
    }

    public void setCneename(String cneename) {
        this.cneename = cneename;
    }

    public String getCneephone() {
        return cneephone;
    }

    public void setCneephone(String cneephone) {
        this.cneephone = cneephone;
    }

    public String getCneeprovince() {
        return cneeprovince;
    }

    public void setCneeprovince(String cneeprovince) {
        this.cneeprovince = cneeprovince;
    }

    public String getCneecity() {
        return cneecity;
    }

    public void setCneecity(String cneecity) {
        this.cneecity = cneecity;
    }

    public String getCneeaddr() {
        return cneeaddr;
    }

    public void setCneeaddr(String cneeaddr) {
        this.cneeaddr = cneeaddr;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
