package com.baigu.app.shop.core.oem.service;

import com.baigu.app.shop.core.oem.model.OemCustomer;
import com.baigu.framework.database.Page;

import java.util.List;
import java.util.Map;

/**
 * create by xt on 2018-07-26 17:02
 */
public interface ICustomerManager {
    Page pageSale(Map map, int page, int pageSize, String other, String order);

    void delete(Integer id);

    void add(OemCustomer customer);

    void update(OemCustomer customer);

    OemCustomer get(Integer id);

    List<OemCustomer> list();
}
