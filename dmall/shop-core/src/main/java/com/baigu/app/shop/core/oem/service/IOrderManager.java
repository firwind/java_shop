package com.baigu.app.shop.core.oem.service;

import com.baigu.app.shop.core.oem.model.OemOrder;
import com.baigu.framework.database.Page;

import java.util.Map;

/**
 * create by xt on 2018-07-26 17:02
 */
public interface IOrderManager {
    Page pageSale(Map map, int page, int pageSize, String other, String order);

    void delete(Integer id);

    void add(OemOrder order);

    void update(OemOrder order);

    OemOrder get(Integer id);

    void setShipped(Integer[] ids);
}
