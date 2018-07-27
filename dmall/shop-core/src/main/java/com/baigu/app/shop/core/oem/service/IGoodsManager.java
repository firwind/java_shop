package com.baigu.app.shop.core.oem.service;

import com.baigu.app.shop.core.oem.model.OemGoods;
import com.baigu.framework.database.Page;

import java.util.Map;

/**
 * create by xt on 2018-07-26 17:02
 */
public interface IGoodsManager {
    Page pageSale(Map map, int page, int pageSize, String other, String order);

    void delete(Integer id);

    void add(OemGoods goods);

    void update(OemGoods goods);

    OemGoods get(Integer id);

    OemGoods get(String code);
}
