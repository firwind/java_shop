package com.baigu.app.shop.core.member.action;

import com.baigu.app.shop.core.member.service.ISaleManager;
import com.baigu.framework.action.GridController;
import com.baigu.framework.action.GridJsonResult;
import com.baigu.framework.util.JsonResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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


    @RequestMapping(value = "/list")
    public ModelAndView list() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/sale/sale_list");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/list-json")
    public GridJsonResult listJson() {
        Map<String, Object> where = new HashMap<String, Object>();
        webpage = saleManager.pageSale(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }
}
