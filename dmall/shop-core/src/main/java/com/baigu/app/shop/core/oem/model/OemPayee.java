package com.baigu.app.shop.core.oem.model;

import java.math.BigDecimal;

/**
 * 收款单
 * create by xt on 2018-08-22 15:45
 */
public class OemPayee {
    private Integer id;
    private Integer customer_id;
    private String payeeno;
    private Integer received;
    private BigDecimal freight;
    private BigDecimal amount;
    private BigDecimal total;

    public static final Integer NO_RECEIVED = 10;
    public static final Integer RECEIVED = 20;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReceived() {
        return received;
    }

    public void setReceived(Integer received) {
        this.received = received;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPayeeno() {
        return payeeno;
    }

    public void setPayeeno(String payeeno) {
        this.payeeno = payeeno;
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Integer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Integer customer_id) {
        this.customer_id = customer_id;
    }
}
