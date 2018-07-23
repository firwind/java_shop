package com.baigu.app.shop.core.member.action;

import com.baigu.app.shop.component.agent.service.impl.MemberBonusManager;
import com.baigu.app.shop.core.agent.model.MonthBonus;
import com.baigu.app.shop.core.member.service.ISaleManager;
import com.baigu.framework.action.GridController;
import com.baigu.framework.action.GridJsonResult;
import com.baigu.framework.action.JsonResult;
import com.baigu.framework.util.DateUtil;
import com.baigu.framework.util.JsonResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 销量管理
 * <p>
 * create by xt on 2018-07-20 17:58
 */
@Controller
@Scope("prototype")
@RequestMapping("/shop/admin/sale")
@SuppressWarnings({"rawtypes", "unchecked"})
public class SaleController extends GridController {

    @Autowired
    private ISaleManager saleManager;
    @Autowired
    private MemberBonusManager memberBonusManager;


    @RequestMapping(value = "/list")
    public ModelAndView list() {
        ModelAndView view = getGridModelAndView();
        view.addObject("defaultSmonth", DateUtil.getMonthString(0));
        view.addObject("defaultEmonth", DateUtil.getMonthString(0));
        view.setViewName("/shop/admin/sale/sale_list");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/list-json")
    public GridJsonResult listJson(String keyword, String uname, String sMonth, String eMonth) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("keyword", keyword);
        where.put("uname", uname);
        where.put("sMonth", sMonth);
        where.put("eMonth", eMonth);
        webpage = saleManager.pageSale(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/recountBonus", method = RequestMethod.POST)
    public JsonResult recountBonus(Integer memberId, String month) {
        try {
            memberBonusManager.reCountMonthBonus(new MonthBonus(memberId, month));
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/exportExcel", method = RequestMethod.POST)
    public void exportExcel(String[] groupIds, HttpServletResponse response) {
        boolean isSuc = saleManager.exportExcel(groupIds, response, "销量报表");
        if (!isSuc) {
            throw new RuntimeException("导出excel失败");
        }
    }

    @RequestMapping(value = "/exportConditionExcel", method = RequestMethod.POST)
    public void exportConditionExcel(String uname, String sMonth, String eMonth, HttpServletResponse response) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("uname", uname);
        where.put("sMonth", sMonth);
        where.put("eMonth", eMonth);
        boolean isSuc = saleManager.exportExcel(where, response, "销量报表");
        if (!isSuc) {
            throw new RuntimeException("导出excel失败");
        }
    }
}
