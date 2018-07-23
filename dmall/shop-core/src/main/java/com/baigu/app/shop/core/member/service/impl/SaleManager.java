package com.baigu.app.shop.core.member.service.impl;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.core.agent.model.MonthBonus;
import com.baigu.app.shop.core.member.service.ISaleManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.Page;
import com.baigu.framework.util.DateUtil;
import com.baigu.framework.util.ExcelUtil;
import com.baigu.framework.util.FileUtil;
import com.baigu.framework.util.StringUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * create by xt on 2018-07-20 18:13
 */
@Service("saleManager")
public class SaleManager implements ISaleManager {

    @Autowired
    private IDaoSupport daoSupport;
    @Autowired
    private MemberManager memberManager;

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
       /* sql = "select * FROM es_order a\n" +
                "LEFT JOIN es_month_bonus b ON b.member_id = a.member_id\n" +
                "LEFT JOIN es_member c on c.member_id = a.member_id ";*/
        Page webPage = this.daoSupport.queryForPage(sql, page, pageSize);
        return webPage;
    }

    @Override
    public boolean exportExcel(String[] groupIds, HttpServletResponse response, String fileName) {
        try {
            String ids = StringUtil.arrayToStringAddSingleQuote(groupIds, ",");
            String sql = "SELECT A.* FROM ( SELECT *, ( CONCAT(member_id, '_', `month`)) mm FROM es_month_bonus ) A WHERE A.mm IN (" + ids + ") ORDER BY A.`month` DESC";
            List<MonthBonus> bonusList = this.daoSupport.queryForList(sql, MonthBonus.class);
            export(bonusList, response, fileName);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean exportExcel(Map map, HttpServletResponse response, String fileName) {
        try {
            String sql = createTempSql(map, null, null);
            List<MonthBonus> bonusList = this.daoSupport.queryForList(sql, MonthBonus.class);
            export(bonusList, response, fileName);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void export(List<MonthBonus> bonusList, HttpServletResponse response, String fileName) {
        ExcelUtil excelUtil = new ExcelUtil();
        // 流量报表excel模板在类包中，转为流给excelutil
        InputStream in = FileUtil.getResourceAsStream("com/baigu/app/shop/core/member/service/impl/sale.xls");
        excelUtil.openModal(in);
        int i = 1;
        if (CollectionUtils.isNotEmpty(bonusList)) {
            for (MonthBonus bonus : bonusList) {
                Member m = memberManager.get(bonus.getMember_id());
                excelUtil.writeStringToCell(i, 0, m.getUname());
                excelUtil.writeStringToCell(i, 1, bonus.getMonth());
                excelUtil.writeStringToCell(i, 2, bonus.getPerson_sale().toPlainString());
                excelUtil.writeStringToCell(i, 3, bonus.getPerson_bonus().toPlainString());
                excelUtil.writeStringToCell(i, 4, bonus.getTeam_sale().toPlainString());
                excelUtil.writeStringToCell(i, 5, bonus.getTeam_bonus().toPlainString());
                i++;
            }
        }
        excelUtil.writeToResponse(response, fileName);
    }

    private String createTempSql(Map map, String other, String order) {
        String sql = "SELECT m.uname, mb.`month`, mb.member_id, " +
                "mb.person_bonus, mb.person_sale, mb.team_bonus, mb.team_sale, mb.recount " +
                "FROM es_month_bonus mb " +
                "LEFT JOIN es_member m ON mb.member_id = m.member_id WHERE 1 = 1";
        String keyword = (String) map.get("keyword");
        String uname = (String) map.get("uname");
        String sMonth = (String) map.get("sMonth");
        String eMonth = (String) map.get("eMonth");
        if (StringUtils.isNotBlank(keyword)) {
            sql += " AND m.uname LIKE '%" + keyword + "%'";
        }
        if (StringUtils.isNotBlank(uname)) {
            sql += " AND m.uname LIKE '%" + uname + "%'";
        }
        if (StringUtils.isBlank(sMonth)) {
            sMonth = DateUtil.getMonthString(0);
        }
        if (StringUtils.isBlank(eMonth)) {
            eMonth = DateUtil.getMonthString(0);
        }
        sql += " AND mb.`month` >= " + sMonth;
        sql += " AND mb.`month` <= " + eMonth;

        sql += " ORDER BY mb.`month` DESC";
        if (StringUtils.isNotBlank(other) && StringUtils.isNotBlank(order)) {
            sql += "," + other + " " + order;
        }
        return sql;
    }
}
