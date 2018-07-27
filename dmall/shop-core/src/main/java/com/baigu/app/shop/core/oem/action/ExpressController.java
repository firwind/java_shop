package com.baigu.app.shop.core.oem.action;

import com.baigu.app.shop.core.oem.model.OemExpress;
import com.baigu.app.shop.core.oem.service.IExpressManager;
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
import java.util.List;
import java.util.Map;

/**
 * create by xt on 2018-07-26 17:00
 */
@Controller("oemExpressController")
@Scope("prototype")
@RequestMapping("/shop/admin/oem/express")
@SuppressWarnings({"rawtypes", "unchecked"})
public class ExpressController extends GridController {

    @Autowired
    private IExpressManager expressManager;

    @RequestMapping(value = "/list")

    public ModelAndView list() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/oem/express/express_list");
        return view;
    }

    /**
     * 获取所有快递配置列表
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getExpressList", method = RequestMethod.POST)
    public JsonResult getExpressList() {
        try {
            List<OemExpress> expressList = expressManager.list();
            return JsonResultUtil.getObjectMessageJson(expressList, "操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/list-json")
    public GridJsonResult listJson(String keyword) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("keyword", keyword);
        webpage = expressManager.pageSale(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(Integer id) {
        try {
            expressManager.delete(id);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        ModelAndView view = new ModelAndView();
        view.setViewName("/shop/admin/oem/express/express_add");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/addSubmit", method = RequestMethod.POST)
    public JsonResult addSubmit(OemExpress express) {
        try {
            expressManager.add(express);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(Integer id) {
        ModelAndView view = new ModelAndView();
        OemExpress express = expressManager.get(id);
        view.addObject("express", express);
        view.setViewName("/shop/admin/oem/express/express_edit");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public JsonResult editSubmit(OemExpress express) {
        try {
            expressManager.update(express);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }
}
