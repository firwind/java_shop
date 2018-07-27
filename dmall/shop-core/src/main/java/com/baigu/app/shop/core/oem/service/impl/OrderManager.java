package com.baigu.app.shop.core.oem.service.impl;

import com.baigu.app.shop.core.oem.model.OemGoods;
import com.baigu.app.shop.core.oem.model.OemOrder;
import com.baigu.app.shop.core.oem.model.OemOrderDetail;
import com.baigu.app.shop.core.oem.service.IGoodsManager;
import com.baigu.app.shop.core.oem.service.IOrderManager;
import com.baigu.framework.action.JsonResult;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import com.baigu.framework.util.ExcelUtil;
import com.baigu.framework.util.JsonResultUtil;
import com.baigu.framework.util.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 订单管理
 * <p>
 * create by xt on 2018-07-26 17:03
 */
@Service("oemOrderManager")
public class OrderManager implements IOrderManager {
    protected final Logger logger = Logger.getLogger(getClass());

    @Autowired
    private IDaoSupport daoSupport;
    @Autowired
    private IGoodsManager goodsManager;

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

    /**
     * 导入代加工订单从excel
     *
     * @param in
     */
    @Override
    public JsonResult importOemExcel(InputStream in, String fileName) throws IOException {
        try {
            ExcelUtil excelUtil = new ExcelUtil();
            excelUtil.openModal(in);
            int rowNum = excelUtil.getSheet(0).getLastRowNum();

            List<OemOrder> oemOrders = new LinkedList<OemOrder>();
            List<OemOrderDetail> oemOrderDetails = new LinkedList<OemOrderDetail>();
            Map<String, BigDecimal> orderWeight = new HashMap<String, BigDecimal>();//统计订单总重量
            OemGoods goods = null;
            OemOrder order = null;
            OemOrderDetail detail = null;
            for (int row = 1; row <= rowNum; row++) {
                if (excelUtil.isNullRow(row)) {//如果是空行，执行下一行
                    continue;
                }

                order = new OemOrder();
                detail = new OemOrderDetail();

                String orderNo = excelUtil.readStringToCell(row, 0);
                if (StringUtils.isNotBlank(orderNo)) {
                    order.setOrderno(orderNo);
                } else {
                    return JsonResultUtil.getErrorJson("订单号为空");
                }
                String goodsCode = excelUtil.readStringToCell(row, 2);
                if (StringUtils.isNotBlank(goodsCode)) {
                    goods = goodsManager.get(goodsCode);
                    if (goods == null) {
                        return JsonResultUtil.getErrorJson("商品号不正确");
                    }
                } else {
                    return JsonResultUtil.getErrorJson("商品号为空");
                }
                String goodsName = excelUtil.readStringToCell(row, 1);
                if (StringUtils.isNotBlank(goodsName)) {
                    if (!goods.getName().equals(goodsName.trim())) {
                        return JsonResultUtil.getErrorJson("商品名不匹配");
                    }
                }
                String goodsNum = excelUtil.readStringToCell(row, 3);
                if (StringUtils.isNotBlank(goodsNum)) {
                    detail.setGoods_id(goods.getId());
                    detail.setNum(Integer.valueOf(goodsNum));
                    detail.setOrderno(orderNo);
                    oemOrderDetails.add(detail);//添加详情记录
                }
                //快递信息
                String expName = excelUtil.readStringToCell(row, 4);
                if (StringUtils.isNotBlank(expName)) {
                    order.setExpname(expName);
                }
                String cneeName = excelUtil.readStringToCell(row, 5);
                if (StringUtils.isNotBlank(cneeName)) {
                    order.setCneename(cneeName);
                }
                String cneePhone = excelUtil.readStringToCell(row, 6);
                if (StringUtils.isNotBlank(cneePhone)) {
                    order.setCneephone(cneePhone);
                }
                String cneeProvince = excelUtil.readStringToCell(row, 7);
                if (StringUtils.isNotBlank(cneeProvince)) {
                    order.setCneeprovince(cneeProvince);
                }
                String cneeCity = excelUtil.readStringToCell(row, 8);
                if (StringUtils.isNotBlank(cneeCity)) {
                    order.setCneecity(cneeCity);
                }
                String cneeDistrict = excelUtil.readStringToCell(row, 9);
                if (StringUtils.isNotBlank(cneeDistrict)) {
                    order.setCneedistrict(cneeDistrict);
                }
                String cneeAddr = excelUtil.readStringToCell(row, 10);
                if (StringUtils.isNotBlank(cneeAddr)) {
                    order.setCneeaddr(cneeAddr);
                }
                //统计订单总重量
                if (orderWeight.get(orderNo) == null) {
                    BigDecimal weight = goods.getWeight().multiply(new BigDecimal(goodsNum));
                    orderWeight.put(orderNo, weight);
                    oemOrders.add(order);//只添加一条唯一记录
                } else {
                    BigDecimal weight = goods.getWeight().multiply(new BigDecimal(goodsNum));
                    orderWeight.put(orderNo, orderWeight.get(orderNo).add(weight));
                }
            }
            try {
                for (OemOrder oemOrder : oemOrders) {
                    //计算运费
                    oemOrder.setFreight(calculateFreight(order.getExpname(), orderWeight.get(order.getOrderno())));
                    this.daoSupport.insert("oem_order", oemOrder);
                }
                for (OemOrderDetail oemDetail : oemOrderDetails) {
                    this.daoSupport.insert("oem_order_detail", oemDetail);
                }
            } catch (Exception e) {
                e.printStackTrace();
                return JsonResultUtil.getErrorJson("导入数据成功，但插入数据失败");
            }
            return JsonResultUtil.getSuccessJson("导入成功");
        } finally {
            if (in != null) {
                in.close();
            }
        }
    }

    /**
     * 计算运费
     *
     * @param expName
     * @param weight
     * @return
     */
    private BigDecimal calculateFreight(String expName, BigDecimal weight) {
        return BigDecimal.ZERO;
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
