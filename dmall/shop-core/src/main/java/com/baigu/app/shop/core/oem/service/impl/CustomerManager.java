package com.baigu.app.shop.core.oem.service.impl;

import com.baigu.app.shop.core.oem.model.OemCustomer;
import com.baigu.app.shop.core.oem.service.ICustomerManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 客户管理
 * <p>
 * create by xt on 2018-07-26 17:03
 */
@Service
public class CustomerManager implements ICustomerManager {

    @Autowired
    private IDaoSupport daoSupport;

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
        String sql = createTempSql(map, other, order);
        Page webPage = this.daoSupport.queryForPage(sql, page, pageSize);
        return webPage;
    }

    /**
     * 删除
     *
     * @param id
     */
    @Override
    public void delete(Integer id) {
        this.daoSupport.execute("DELETE FROM oem_customer WHERE id = " + id);
    }

    /**
     * 添加
     *
     * @param customer
     */
    @Override
    public void add(OemCustomer customer) {
        this.daoSupport.insert("oem_customer", customer);
    }

    /**
     * 修改
     *
     * @param customer
     */
    @Override
    public void update(OemCustomer customer) {
        this.daoSupport.update("oem_customer", customer, "id = " + customer.getId());
    }

    /**
     * 获取
     *
     * @param id
     */
    @Override
    public OemCustomer get(Integer id) {
        return this.daoSupport.queryForObject("SELECT * FROM `oem_customer` WHERE id = " + id, OemCustomer.class);
    }

    @Override
    public List<OemCustomer> list() {
        return this.daoSupport.queryForList("SELECT * FROM `oem_customer`", OemCustomer.class);
    }

    private String createTempSql(Map map, String other, String order) {
        String sql = "SELECT * FROM `oem_customer` WHERE 1 = 1";
        String keyword = (String) map.get("keyword");
        if (StringUtils.isNotBlank(keyword)) {
            sql += " AND name LIKE '%" + keyword + "%'";
        }
        sql += " ORDER BY updatetime DESC";
        if (StringUtils.isNotBlank(other) && StringUtils.isNotBlank(order)) {
            sql += "," + other + " " + order;
        }
        return sql;
    }
}
