package com.baigu.app.shop.core.oem.service;

import com.baigu.app.shop.core.oem.model.OemOrder;
import com.baigu.framework.action.JsonResult;
import com.baigu.framework.database.Page;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/**
 * create by xt on 2018-07-26 17:02
 */
public interface IOrderManager {
    Page pageSale(Map map, int page, int pageSize, String other, String order);

    Page pageOrderDetail(Map map, int page, int pageSize, String other, String order);

    void delete(Integer id);

    void delete(Integer[] ids);

    void add(OemOrder order);

    void update(OemOrder order);

    OemOrder get(Integer id);

    void setShipped(Integer[] ids);


    JsonResult importOemExcel(InputStream in, Integer customerId) throws IOException;
}
