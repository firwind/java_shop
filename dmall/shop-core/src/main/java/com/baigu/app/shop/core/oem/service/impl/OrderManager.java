package com.baigu.app.shop.core.oem.service.impl;

import com.baigu.app.shop.core.oem.model.OemOrder;
import com.baigu.app.shop.core.oem.service.IOrderManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import com.baigu.framework.util.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 订单管理
 * <p>
 * create by xt on 2018-07-26 17:03
 */
@Service("oemOrderManager")
public class OrderManager implements IOrderManager {

    @Autowired
    private IDaoSupport daoSupport;

    /**
     * 查询分页
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
        this.daoSupport.execute("DELETE FROM oem_order WHERE id = " + id);
    }

    /**
     * 添加
     *
     * @param order
     */
    @Override
    public void add(OemOrder order) {
        this.daoSupport.insert("oem_order", order);
    }

    /**
     * 修改
     *
     * @param order
     */
    @Override
    public void update(OemOrder order) {
        this.daoSupport.update("oem_order", order, "id = " + order.getId());
    }

    /**
     * 获取
     *
     * @param id
     */
    @Override
    public OemOrder get(Integer id) {
        return this.daoSupport.queryForObject("SELECT * FROM `oem_order` WHERE id = " + id, OemOrder.class);
    }

    /**
     * 设置已收货
     *
     * @param ids
     */
    @Override
    public void setShipped(Integer[] ids) {
        String idsStr = StringUtil.arrayToString(ids, ",");
        String sql = "UPDATE `oem_order` SET status=? WHERE id IN (" + idsStr + ")";
        this.daoSupport.execute(sql, OemOrder.SHIP);
    }

    private String createTempSql(Map map, String other, String order) {
        String sql = "SELECT c.`name` cname, o.* FROM oem_order o LEFT JOIN oem_customer c ON c.id = o.customer_id WHERE 1 = 1";
        String keyword = (String) map.get("keyword");
        Integer status = (Integer) map.get("status");
        if (StringUtils.isNotBlank(keyword)) {
            sql += " AND c.`name` LIKE '%" + keyword + "%'";
        }
        if (status != null) {
            sql += " AND status = " + status;
        }
        sql += " ORDER BY updatetime DESC";
        if (StringUtils.isNotBlank(other) && StringUtils.isNotBlank(order)) {
            sql += "," + other + " " + order;
        }
        return sql;
    }
}
