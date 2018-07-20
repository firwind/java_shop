package com.baigu.app.shop.core.member.service;

import com.baigu.framework.database.Page;

import java.util.Map;

/**
 * 销量管理
 * <p>
 * create by xt on 2018-07-20 18:12
 */
public interface ISaleManager {

    Page pageSale(Map map, int page, int pageSize, String other, String order);
}
