package com.baigu.app.shop.core.oem.action;

import com.baigu.app.shop.core.oem.model.OemOrder;
import com.baigu.app.shop.core.oem.service.IOrderManager;
import com.baigu.framework.action.GridController;
import com.baigu.framework.action.GridJsonResult;
import com.baigu.framework.action.JsonResult;
import com.baigu.framework.util.ExcelUtil;
import com.baigu.framework.util.FileUtil;
import com.baigu.framework.util.JsonResultUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * create by xt on 2018-07-26 17:00
 */
@Controller("oemOrderController")
@Scope("prototype")
@RequestMapping("/shop/admin/oem/order")
@SuppressWarnings({"rawtypes", "unchecked"})
public class OrderController extends GridController {

    @Autowired
    private IOrderManager orderManager;

    @RequestMapping(value = "/unshipList")
    public ModelAndView unshipList() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/oem/order/unship_order_list");
        return view;
    }

    @RequestMapping(value = "/shipList")
    public ModelAndView shipList() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/oem/order/ship_order_list");
        return view;
    }

    @RequestMapping(value = "/payeeOrderList")
    public ModelAndView payeeOrderList(Integer payeeId) {
        ModelAndView view = getGridModelAndView();
        view.addObject("payeeId", payeeId);
        view.setViewName("/shop/admin/oem/order/payee_order_list");
        return view;
    }

    @RequestMapping(value = "/orderDetail")
    public ModelAndView orderDetail(String orderNo) {
        ModelAndView view = getGridModelAndView();
        view.addObject("orderNo", orderNo);
        view.setViewName("/shop/admin/oem/order/order_detail_list");
        return view;
    }

    /**
     * 跳转到收款单页面
     *
     * @return
     */
    @RequestMapping(value = "/payee")
    public ModelAndView payee() {
        ModelAndView view = getGridModelAndView();
        view.setViewName("/shop/admin/oem/order/payee");
        return view;
    }

    /**
     * 设置收款单已收款
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/setReceived", method = RequestMethod.POST)
    public JsonResult setReceived(Integer[] ids) {
        try {
            if (ids.length > 0) {
                orderManager.setReceived(ids);
            }
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/payeeList", method = RequestMethod.POST)
    public Object payeeList(String keyword, Integer received) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("keyword", keyword);
        where.put("received", received);
        webpage = orderManager.pagePayeeList(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/setShipped", method = RequestMethod.POST)
    public JsonResult setShipped(Integer[] ids) {
        try {
            if (ids.length > 0) {
                orderManager.setShipped(ids);
            }
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/downloadOrderTemplate")
    public void downloadOrderTemplate(HttpServletResponse response) {
        ExcelUtil excelUtil = new ExcelUtil();
        InputStream in = FileUtil.getResourceAsStream("com/baigu/app/shop/core/oem/service/impl/oemOrder.xls");
        excelUtil.openModal(in);
        excelUtil.writeToResponse(response, "代加工订单模板");
    }

    /**
     * 导入代加工订单
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/importOemExcel", method = RequestMethod.POST)
    public JsonResult importOemExcel(HttpServletRequest request, Integer customerId) {
        try {
            if (customerId == null) {
                return JsonResultUtil.getErrorJson("客户没有选择");
            }
            //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                    request.getSession().getServletContext());
            //检查form中是否有enctype="multipart/form-data"
            if (multipartResolver.isMultipart(request)) {
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                Iterator iter = multiRequest.getFileNames();
                if (iter.hasNext()) {//取第一个文件
                    MultipartFile file = multiRequest.getFile(iter.next().toString());
                    if (file != null) {
                        String fileName = file.getOriginalFilename();
                        if (StringUtils.isNotBlank(fileName) && !fileName.endsWith(".xls") && !fileName.endsWith(".xlsx")) {
                            return JsonResultUtil.getErrorJson("不支持的Excel格式，请上传后缀为xls或者xlsx的文件");
                        }
                        InputStream in = file.getInputStream();
                        JsonResult importResult = orderManager.importOemExcel(in, customerId);
                        return importResult;
                    }
                }
            }
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/list-json")
    public GridJsonResult listJson(String keyword, String customName, String startTime, String endTime, Integer status, Integer payeeId) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("keyword", keyword);
        where.put("status", status);
        where.put("customName", customName);
        where.put("startTime", startTime);
        where.put("endTime", endTime);
        where.put("payeeId", payeeId);
        webpage = orderManager.pageSale(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/list-detail")
    public GridJsonResult listDetail(String orderNo) {
        Map<String, Object> where = new HashMap<String, Object>();
        where.put("orderNo", orderNo);
        webpage = orderManager.pageOrderDetail(where, this.getPage(), this.getPageSize(), this.getSort(), this.getOrder());
        return JsonResultUtil.getGridJson(webpage);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public JsonResult delete(Integer id) {
        try {
            orderManager.delete(id);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    public JsonResult batchDelete(Integer[] ids) {
        try {
            orderManager.delete(ids);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        ModelAndView view = new ModelAndView();
        view.setViewName("/shop/admin/oem/order/order_add");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/addSubmit", method = RequestMethod.POST)
    public JsonResult addSubmit(OemOrder order) {
        try {
            orderManager.add(order);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(Integer id) {
        ModelAndView view = new ModelAndView();
        OemOrder order = orderManager.get(id);
        view.addObject("order", order);
        view.setViewName("/shop/admin/oem/order/order_edit");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public JsonResult editSubmit(OemOrder order) {
        try {
            orderManager.update(order);
            return JsonResultUtil.getSuccessJson("操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }
}
