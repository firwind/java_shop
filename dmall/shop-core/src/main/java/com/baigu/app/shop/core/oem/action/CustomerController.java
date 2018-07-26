package com.baigu.app.shop.core.oem.action;

import com.baigu.app.shop.core.oem.model.OemCustomer;
import com.baigu.app.shop.core.oem.service.ICustomerManager;
import com.baigu.framework.action.GridController;
import com.baigu.framework.action.GridJsonResult;
import com.baigu.framework.action.JsonResult;
import com.baigu.framework.util.JsonResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * create by xt on 2018-07-26 17:00
 */
@Controller
@Scope("prototype")
@RequestMapping("/shop/admin/oem/customer")
@SuppressWarnings({"rawtypes", "unchecked"})
public class CustomerController extends GridController {

    @Autowired
    private ICustomerManager customerManager;

    @RequestMapping(value = "/list")

    public ModelAndView list() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/oem/customer/customer_list");
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
        webpage = customerManager.pageSale(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(Integer id) {
        try {
            customerManager.delete(id);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        ModelAndView view = new ModelAndView();
        view.setViewName("/shop/admin/oem/customer/customer_add");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/addSubmit", method = RequestMethod.POST)
    public JsonResult addSubmit(OemCustomer customer) {
        try {
            customerManager.add(customer);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(Integer id) {
        ModelAndView view = new ModelAndView();
        OemCustomer customer = customerManager.get(id);
        view.addObject("cusotmer", customer);
        view.setViewName("/shop/admin/oem/customer/customer_edit");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public JsonResult editSubmit(OemCustomer customer) {
        try {
            customerManager.update(customer);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }
}
