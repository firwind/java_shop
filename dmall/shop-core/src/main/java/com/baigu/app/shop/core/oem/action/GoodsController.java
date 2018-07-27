package com.baigu.app.shop.core.oem.action;

import com.baigu.app.shop.core.oem.model.OemGoods;
import com.baigu.app.shop.core.oem.service.IGoodsManager;
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
@Controller("oemGoodsController")
@Scope("prototype")
@RequestMapping("/shop/admin/oem/goods")
@SuppressWarnings({"rawtypes", "unchecked"})
public class GoodsController extends GridController {

    @Autowired
    private IGoodsManager goodsManager;

    @RequestMapping(value = "/list")

    public ModelAndView list() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/oem/goods/goods_list");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/list-json")
    public GridJsonResult listJson(String keyword) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("keyword", keyword);
        webpage = goodsManager.pageSale(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(Integer id) {
        try {
            goodsManager.delete(id);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        ModelAndView view = new ModelAndView();
        view.setViewName("/shop/admin/oem/goods/goods_add");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/addSubmit", method = RequestMethod.POST)
    public JsonResult addSubmit(OemGoods goods) {
        try {
            goodsManager.add(goods);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(Integer id) {
        ModelAndView view = new ModelAndView();
        OemGoods goods = goodsManager.get(id);
        view.addObject("goods", goods);
        view.setViewName("/shop/admin/oem/goods/goods_edit");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public JsonResult editSubmit(OemGoods goods) {
        try {
            goodsManager.update(goods);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }
}
