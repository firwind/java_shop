package com.baigu.app.shop.component.payment.plugin.alipay;

import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.config.AlipayConfig;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.AlipaySubmit;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.UtilDate;
import com.baigu.app.shop.core.order.model.*;
import com.baigu.app.shop.core.order.service.IOrderManager;
import com.baigu.app.shop.core.order.service.IPaymentManager;
import com.baigu.app.shop.core.order.service.IRefundManager;
import com.baigu.app.shop.core.order.service.ISellBackManager;
import com.baigu.eop.sdk.context.EopSetting;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.IDaoSupport;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * (支付宝统一退款方法)
 *
 * @author zjp
 * @version v6.3
 * @since v6.3
 * 2017年6月28日 下午2:43:29
 */
@Component
public class AlipayRefund {
    @Autowired
    IPaymentManager paymentManager;

    @Autowired
    IOrderManager orderManager;

    @Autowired
    IRefundManager refundManager;

    @Autowired
    ISellBackManager sellBackManager;

    @Autowired
    IDaoSupport daoSupport;

    /**
     * 支付宝退款方法实现
     *
     * @param refund
     * @param paymentLog
     * @return
     */
    public String onRefund(PayEnable payEnable, Refund refund, PaymentLog paymentLog) {
        ////////////////////////////////////请求参数//////////////////////////////////////

        Order order = orderManager.get(payEnable.getOrder_id());
        Map<String, String> params = paymentManager.getConfigParams(order.getPayment_type());
        String app_id = params.get("app_id");
        String private_key = params.get("private_key");
        String public_key = params.get("public_key");
        AlipayConfig.app_id = app_id;
        AlipayConfig.private_key = private_key;
        AlipayConfig.public_key = public_key;
        String param_encoding = params.get("param_encoding");
        //////////////////////////////////////////////////////////////////////////////////
        // 把请求参数打包成数组
        Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("service", "refund_fastpay_by_platform_pwd");
        sParaTemp.put("app_id", app_id);
        sParaTemp.put("private_key", private_key);
        sParaTemp.put("public_key", public_key);
        sParaTemp.put("param_encoding", param_encoding);
        // 批次号，必填，格式：当天日期[8位]+序列号[3至24位]，如：201603081000001
        String date = UtilDate.getDate();
        String out_request_no = date + payEnable.getSn();
        out_request_no = out_request_no.replace("-", "");

        try {
            if (StringUtils.isNotBlank(param_encoding)) {
                out_request_no = new String(out_request_no.getBytes("ISO-8859-1"), param_encoding);
            }
            String out_trade_no = order.getSn();
            if (StringUtils.isNotBlank(param_encoding)) {
                out_trade_no = new String(out_trade_no.getBytes("ISO-8859-1"), param_encoding);
            }
            String trade_no = paymentLog.getTrasaction_id();
            if (StringUtils.isNotBlank(param_encoding)) {
                trade_no = new String(trade_no.getBytes("ISO-8859-1"), param_encoding);
            }
            String refund_amount = String.valueOf(refund.getRefund_money());
            if (StringUtils.isNotBlank(param_encoding)) {
                refund_amount = new String(refund_amount.getBytes("ISO-8859-1"), param_encoding);
            }
            String refund_reason = paymentLog.getRemark();
            if (StringUtils.isNotBlank(param_encoding)) {
                refund_reason = new String(refund_reason.getBytes("ISO-8859-1"), param_encoding);
            }
            sParaTemp.put("out_request_no", out_request_no);
            sParaTemp.put("out_trade_no", out_trade_no);
            sParaTemp.put("trade_no", trade_no);
            sParaTemp.put("refund_amount", refund_amount);
            sParaTemp.put("refund_reason", refund_reason);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 建立请求
        String sHtmlText = AlipaySubmit.buildRefundRequest(sParaTemp);
        return sHtmlText;
    }

    /**
     * 供支付插件获取回调url
     *
     * @return
     */

    protected String getCallBackUrl(PayEnable order) {

        HttpServletRequest request = ThreadContextHolder.getHttpRequest();
        String serverName = request.getServerName();
        int port = request.getServerPort();
        String portstr = "";
        if (port != 80) {
            portstr = ":" + port;
        }
        String contextPath = request.getContextPath();
        return "http://" + serverName + portstr + contextPath + "/api/shop/" + order.getOrderType() + "_alipayPlugin_refund-callback/execute.do";
    }

    /**
     * 退款回调
     *
     * @param ordertype
     * @return
     */
    public String onCallBack(String ordertype) {
        try {

            System.out.println("-------退款回调开始-------");
            HttpServletRequest request = ThreadContextHolder.getHttpRequest();

            /**获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)*/

            /**退款批次号*/
            String batch_no = new String(request.getParameter("batch_no").getBytes("ISO-8859-1"), "UTF-8");
            /**获取订单号*/
            String sn = batch_no.substring(8);
            StringBuilder stringBuilder = new StringBuilder(sn);
            /**判断是否为多店*/
            if (EopSetting.PRODUCT.equals("b2b2c")) {
                sn = stringBuilder.insert(12, "-").toString();
            }
            /**获取订单实体*/
            Order order = orderManager.get(sn);

            Map<String, String> cfgparams = paymentManager.getConfigParams(order.getPayment_type());

            String app_id = cfgparams.get("app_id");
            String private_key = cfgparams.get("private_key");
            String public_key = cfgparams.get("public_key");
            AlipayConfig.app_id = app_id;
            AlipayConfig.private_key = private_key;
            AlipayConfig.public_key = public_key;
            String param_encoding = cfgparams.get("param_encoding");
            /**获取订单实体*/
            Refund refund = refundManager.getRefundByOrderId(order.getOrder_id());
            /**退款结果明细*/
            String result_details = new String(request.getParameter("result_details").getBytes("ISO-8859-1"), "UTF-8");
            String[] split = result_details.split("\\^");
            if (DmallAlipayUtil.verify(param_encoding)) {//验证成功
                //////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码
                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                if (split[split.length - 1].equals("SUCCESS")) {
                    //注意：
                    //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
                    /**
                     * 记录订单日志
                     */
                    orderManager.addLog(refund.getOrder_id(), "已退款，金额：" + refund.getRefund_money());
                    /**
                     * 记录维权订单日志
                     */
                    sellBackManager.saveLogBySystem(refund.getSellback_id(), "已退款，金额：" + refund.getRefund_money());
                    /**
                     * 修改退款单状态
                     */
                    this.daoSupport.execute("update es_refund set status = 1 where id = ?", refund.getId());
                    /**
                     * 修改退货单状态
                     */
                    this.daoSupport.execute("update es_sellback_list set tradestatus=? where id=?", SellBackStatus.refund.getValue(), refund.getSellback_id());
                } else {

                    //注意：
                    //付款完成后，支付宝系统发送该交易状态通知
                    /**
                     * 记录订单日志
                     */
                    orderManager.addLog(refund.getOrder_id(), "退款失败，金额：" + refund.getRefund_money());

                    /**
                     * 记录维权订单日志
                     */
                    sellBackManager.saveLog(refund.getSellback_id(), "退款失败，金额：" + refund.getRefund_money());
                    /**
                     * 修改退款单状态
                     */
                    this.daoSupport.execute("update es_refund set status = 3 where id = ?", refund.getId());
                    /**
                     * 修改退货单状态
                     */
                    this.daoSupport.execute("update es_sellback_list set tradestatus=? where id=?", SellBackStatus.payment.getValue(), refund.getSellback_id());
                }

                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                return "success";    //请不要修改或删除

                //////////////////////////////////////////////////////////////////////////////////////////
            } else {//验证失败
                return "fail";
            }
        } catch (Exception e) {
            return "fail";
        }

    }


}
