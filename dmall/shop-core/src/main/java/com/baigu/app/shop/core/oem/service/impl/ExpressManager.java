package com.baigu.app.shop.core.oem.service.impl;

import com.baigu.app.shop.core.oem.model.OemExpress;
import com.baigu.app.shop.core.oem.service.IExpressManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 快递配置管理
 * <p>
 * create by xt on 2018-07-26 17:03
 */
@Service("oemExpress")
public class ExpressManager implements IExpressManager {

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
        this.daoSupport.execute("DELETE FROM oem_express WHERE id = " + id);
    }

    /**
     * 添加
     *
     * @param express
     */
    @Override
    public void add(OemExpress express) {
        this.daoSupport.insert("oem_express", express);
    }

    /**
     * 修改
     *
     * @param express
     */
    @Override
    public void update(OemExpress express) {
        this.daoSupport.update("oem_express", express, "id = " + express.getId());
    }

    /**
     * 获取
     *
     * @param id
     */
    @Override
    public OemExpress get(Integer id) {
        return this.daoSupport.queryForObject("SELECT * FROM `oem_express` WHERE id = " + id, OemExpress.class);
    }

    /**
     * 根据省和快递名查询
     */
    @Override
    public OemExpress get(String expName, String province) {
        if (StringUtils.isNotBlank(province)) {
            return this.daoSupport.queryForObject("SELECT * FROM `oem_express` WHERE expname = ? AND province = ?", OemExpress.class, expName, province);
        } else {
            return this.daoSupport.queryForObject("SELECT * FROM `oem_express` WHERE expname = ? AND province IS NULL", OemExpress.class, expName);
        }
    }

    @Override
    public List<OemExpress> list() {
        return this.daoSupport.queryForList("SELECT * FROM `oem_express`", OemExpress.class);
    }

    private String createTempSql(Map map, String other, String order) {
        String sql = "SELECT * FROM `oem_express` WHERE 1 = 1";
        String keyword = (String) map.get("keyword");
        if (StringUtils.isNotBlank(keyword)) {
            sql += " AND expname LIKE '%" + keyword + "%'";
        }
        sql += " ORDER BY updatetime DESC";
        if (StringUtils.isNotBlank(other) && StringUtils.isNotBlank(order)) {
            sql += "," + other + " " + order;
        }
        return sql;
    }
}
