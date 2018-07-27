package com.baigu.app.shop.core.oem.service;

import com.baigu.app.shop.core.oem.model.OemExpress;
import com.baigu.framework.database.Page;

import java.util.List;
import java.util.Map;

/**
 * create by xt on 2018-07-26 17:02
 */
public interface IExpressManager {
    Page pageSale(Map map, int page, int pageSize, String other, String order);

    void delete(Integer id);

    void add(OemExpress express);

    void update(OemExpress express);

    OemExpress get(Integer id);

    OemExpress get(String expName, String province);

    List<OemExpress> list();
}
