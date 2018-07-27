package com.baigu.app.shop.core.oem.service.impl;

import com.baigu.app.shop.core.oem.model.OemGoods;
import com.baigu.app.shop.core.oem.service.IGoodsManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 商品管理
 * <p>
 * create by xt on 2018-07-26 17:03
 */
@Service("oemGoodsManager")
public class GoodsManager implements IGoodsManager {

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
        this.daoSupport.execute("DELETE FROM oem_goods WHERE id = " + id);
    }

    /**
     * 添加
     *
     * @param goods
     */
    @Override
    public void add(OemGoods goods) {
        this.daoSupport.insert("oem_goods", goods);
    }

    /**
     * 修改
     *
     * @param goods
     */
    @Override
    public void update(OemGoods goods) {
        this.daoSupport.update("oem_goods", goods, "id = " + goods.getId());
    }

    /**
     * 获取
     *
     * @param id
     */
    @Override
    public OemGoods get(Integer id) {
        return this.daoSupport.queryForObject("SELECT * FROM `oem_goods` WHERE id = " + id, OemGoods.class);
    }

    /**
     * 根据唯一编号查询goods
     *
     * @param code
     * @return
     */
    @Override
    public OemGoods get(String code) {
        return this.daoSupport.queryForObject("SELECT * FROM `oem_goods` WHERE code = ?", OemGoods.class, code);
    }

    private String createTempSql(Map map, String other, String order) {
        String sql = "SELECT * FROM `oem_goods` WHERE 1 = 1";
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
