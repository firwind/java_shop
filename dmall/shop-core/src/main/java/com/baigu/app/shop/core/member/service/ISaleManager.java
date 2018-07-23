package com.baigu.app.shop.core.member.service;

import com.baigu.framework.database.Page;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 销量管理
 * <p>
 * create by xt on 2018-07-20 18:12
 */
public interface ISaleManager {

    Page pageSale(Map map, int page, int pageSize, String other, String order);

    /**
     * 导出数据到Excel
     *
     * @param groupIds (memberId + month) 组合id集合
     * @param response
     * @param fileName
     * @return
     */
    boolean exportExcel(String[] groupIds, HttpServletResponse response, String fileName);

    /**
     * 导出查询条件数据到Excel
     *
     * @param map
     * @param response
     * @param fileName
     * @return
     */
    boolean exportExcel(Map map, HttpServletResponse response, String fileName);
}
