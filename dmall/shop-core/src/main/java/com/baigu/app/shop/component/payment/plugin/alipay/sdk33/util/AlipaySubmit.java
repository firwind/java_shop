package com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.domain.AlipayTradeRefundModel;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.alipay.api.response.AlipayTradeWapPayResponse;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.config.AlipayConfig;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.httpClient.HttpProtocolHandler;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.httpClient.HttpRequest;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.httpClient.HttpResponse;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.httpClient.HttpResultType;
import org.apache.commons.httpclient.NameValuePair;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* *
 *类名：AlipaySubmit
 *功能：支付宝各接口请求提交类
 *详细：构造支付宝各接口表单HTML文本，获取远程HTTP数据
 *版本：3.3
 *日期：2012-08-13
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipaySubmit {

    /**
     * 支付宝提供给商户的服务接入网关URL(新)
     */
    private static final String ALIPAY_GATEWAY_NEW = "https://openapi.alipay.com/gateway.do";

    /**
     * 生成要请求给支付宝的参数数组
     *
     * @param sParaTemp 请求前的参数数组
     * @return 要请求的参数数组
     */
    private static Map<String, String> buildRequestPara(Map<String, String> sParaTemp) {
        //除去数组中的空值和签名参数
        Map<String, String> sPara = AlipayCore.paraFilter(sParaTemp);
        sPara.put("sign_type", AlipayConfig.sign_type);
        return sPara;
    }

    /**
     * 构造退款表单html
     *
     * @param sParaTemp
     * @return
     */
    public static String buildRefundRequest(Map<String, String> sParaTemp) {
        StringBuffer sbHtml = new StringBuffer();
        String app_id = sParaTemp.get("app_id");
        String private_key = sParaTemp.get("private_key");
        String public_key = sParaTemp.get("public_key");
        AlipayClient alipayClient = new DefaultAlipayClient(ALIPAY_GATEWAY_NEW, app_id, private_key, AlipayConfig.format, AlipayConfig.charset, public_key, AlipayConfig.sign_type);
        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
        AlipayTradeRefundModel model = new AlipayTradeRefundModel();
        model.setOutTradeNo(sParaTemp.get("out_trade_no"));
        model.setTradeNo(sParaTemp.get("trade_no"));
        model.setRefundAmount(sParaTemp.get("refund_amount"));
        model.setRefundReason(sParaTemp.get("refund_reason"));
        model.setOutRequestNo(sParaTemp.get("out_request_no"));
        request.setBizModel(model);

        AlipayTradeRefundResponse response = null;
        try {
            response = alipayClient.execute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        String form = response.getBody();
        sbHtml.append(form);
        return sbHtml.toString();
    }

    /**
     * 建立请求，以表单HTML形式构造（默认）
     *
     * @param sParaTemp     请求参数数组
     * @return 提交表单HTML文本
     */
    public static String buildWapRequest(Map<String, String> sParaTemp) {
        StringBuffer sbHtml = new StringBuffer();
        String app_id = sParaTemp.get("app_id");
        String private_key = sParaTemp.get("private_key");
        String public_key = sParaTemp.get("public_key");
        AlipayClient alipayClient = new DefaultAlipayClient(ALIPAY_GATEWAY_NEW, app_id, private_key, AlipayConfig.format, AlipayConfig.charset, public_key, AlipayConfig.sign_type);

        AlipayTradeWapPayRequest request = new AlipayTradeWapPayRequest();
        request.setNotifyUrl(sParaTemp.get("notify_url"));
        request.setReturnUrl(sParaTemp.get("return_url"));
        //model
        AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
        model.setOutTradeNo(sParaTemp.get("out_trade_no"));
        model.setSubject(sParaTemp.get("subject"));
        model.setTotalAmount(sParaTemp.get("total_fee"));
        model.setBody(sParaTemp.get("body"));
//        model.setTimeoutExpress(timeout_express);
        model.setProductCode("QUICK_WAP_WAY");
        request.setBizModel(model);
        AlipayTradeWapPayResponse response = null;
        try {
            response = alipayClient.pageExecute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        String form = response.getBody();
        sbHtml.append(form);
        return sbHtml.toString();
    }

    /**
     * 建立请求，以表单HTML形式构造（默认）
     *
     * @param sParaTemp 请求参数数组
     * @return 提交表单HTML文本
     */
    public static String buildPcRequest(Map<String, String> sParaTemp) {
        StringBuffer sbHtml = new StringBuffer();
        String app_id = sParaTemp.get("app_id");
        String private_key = sParaTemp.get("private_key");
        String public_key = sParaTemp.get("public_key");
        AlipayClient alipayClient = new DefaultAlipayClient(ALIPAY_GATEWAY_NEW, app_id, private_key, AlipayConfig.format, AlipayConfig.charset, public_key, AlipayConfig.sign_type);

        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        request.setNotifyUrl(sParaTemp.get("notify_url"));
        request.setReturnUrl(sParaTemp.get("return_url"));
        //model
        AlipayTradePagePayModel model = new AlipayTradePagePayModel();
        model.setOutTradeNo(sParaTemp.get("out_trade_no"));
        model.setSubject(sParaTemp.get("subject"));
        model.setTotalAmount(sParaTemp.get("total_fee"));
        model.setBody(sParaTemp.get("body"));
//        model.setTimeoutExpress(timeout_express);
        model.setProductCode("FAST_INSTANT_TRADE_PAY");
        request.setBizModel(model);
        AlipayTradePagePayResponse response = null;
        try {
            response = alipayClient.pageExecute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        String form = response.getBody();
        sbHtml.append(form);
        return sbHtml.toString();
    }

    public static void main(String[] args) throws AlipayApiException {
        /*AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", "2017122101048371", "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDVmhwZcQ4GoYdbT8b/PUobRx9LgMTAzTcVr1kV1iXqaYgG7XAuFImc8nhe9CnxizgLaKXM/IHLxWTswHhUPQ/prEEAAhlHTzR2czaDI5DMKPbuv6yS28aokYIPWRNwLvYguUJndqLcnHf0A5M9z/uZtzhIlYA9PpknD9kWhaXINlytY8gFbauGatc840tNfNyAyZYOv8Le1WzZE4Uk83eP6c5H2WjPBz24HsX1uvA/qZqWDkVteCEBEuSnLzXj5uP2I3hpSLQorsWe3t8q+rPizgakQo1BPacsCqW0uS7UsP/x5eKYcpwPmMGGZ7c2TwOZirGZMlqTO05fttGQKyvnAgMBAAECggEAOeW/4BWI27tE2TdSlTSjtakdjnWk3y3A1Jvm5chaFqPsPxR058ihVG1Uu0grZlF6K31+E4YOGJG0vYeeFhdHDOun4ryu5WlOqxynlfw571zbMfO6b0QrIN3wBwD6B9py1IPiv/CkTHANA5NEgeiyJgRHuUTssa0aDkB5c2VeflnfDdqbYaY4g5vyml9RlOyWWf4gTHuclZCA/q9pSB5auzux8Urv6lr7WJhSpP2MIuqajTKqbCFl/BkCzQCMcIoIonrVHVP7LPj2Ew1HwkfXz5DPEeZBzaOlq7bkHSX1Vru4c1LDDBkxXC6b9C9RHoKojntn8YuQfyU7e3JW5fX+AQKBgQDv0Daskm2oWcdt6GGDXEBj51SgLZ+MapFlcqhnjj/gsJ3dPR9rGpM81qfEMv7HT6Cfcx14dNT0BLsWzO7zRZg8bX2hRn/9DsHh6HUlUglyRhpCPyMrB/+egNURo9MJ/s9Id2XnE2He0GHbAQq6jYzmaCjmENp6/2ZXPwcwCETFJwKBgQDkBPwXaQ/kIpn7xZP/VdpBR/C/il8z9V/G2Ydram+HDgLyS7yu1A7thKlmN2exuMWhgHr6/TGkk6y7CAe/Z0dRDzK61Hyd9FbL57Vfd4dVOEa5HYI/o2ck+0UHldr7jUqzDbxcJhBBz1ObBhgj8lDp0KegHMkO3VyQva8UEQYbQQKBgQDb2yS0083KwPxP6/KyTnoN3UA9VXZnci/4NMTlo4k2glVIRkgulf+UkCrgeewQaBUW+Z90FpBBYrDu91S+HPiztaGuoIaoRsZDSS1U2MAmTtS2FVI1mjCkbPJqKKpLCJuakTQQRDm+34ZHFM50N1+MwMN2IM9cYhe+Nt9tDreVkwKBgQDO4Ebn5oZocYxLhaMVEouGlwKyhZSCy6kt/MaEinjNi8TYmCaEaBlzHd2jw7js4btNIAh0F6wmqWUZ+9srqURnIubf41F87eah8YP5LbU3eGuSIFe/7TzzrJWgoDGh8TtI4Ll40YAGdVhhWlIkqwEGYizzc6pnNid5mt9x0VA9AQKBgEtuNBt/3EhSI6H1D2h2jR5DhPOA+0DoIL5YVbvco8rBBeFvD5m+4TaUVQc4FORx/7vG+q4DNiawy9ljZWVYRGyujpYrBsiHogGWBirIFBQz9ZQr/sTuwDKteQbKBGYz0E354q5EozgyYAuf3LiYZ4AT0hIaw7lUvbHwIwX1kotK", "json", "GBK", "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjARolrGTe1oOtdO1lNszeA0csbcGWMV6pd8szbCgdUjVt2lxc9WxWAh4eUPS6FJUT2rPjs7FEPzAwYcYv7By9nHu0pVHxl8CM8jMaxcsXZHNtcZCpyU+9f+UrSfByDtNPgY3m5BcspxsM7HDSax44eC9mHEDa0lp1gvWwOWqq19B2UdZAPRRSqv3HQP7n1hFi6WZht03FLmgeRTMi2nZhQX05R1gqjA+OMgegTfPeuruce52/X04EJBrgPdmGv3jNuX9BnXuBdh0KYmgOGSZVTw2FxD2Yebnda4ZuOoobS33JkKJK6pUovKDhaHHFv77kl3qmyoMP1DPjGQ/k0emKQIDAQAB", "RSA2");
        AlipayTradeWapPayRequest request = new AlipayTradeWapPayRequest();
        request.setNotifyUrl("http://localhost/api/shop/s_alipayWapPlugin_payment-callback/execute.do");
        request.setReturnUrl("http://localhost/s_alipayWapPlugin_payment-wap-result.html");
        request.setBizContent("{" +
                "\"body\":\"对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。\"," +
                "\"subject\":\"大乐透\"," +
                "\"out_trade_no\":\"70501111111S001111119\"," +
                "\"timeout_express\":\"90m\"," +
                "\"time_expire\":\"2016-12-31 10:05\"," +
                "\"total_amount\":9.00," +
                "\"seller_id\":\"2088102147948060\"," +
                "\"auth_token\":\"appopenBb64d181d0146481ab6a762c00714cC27\"," +
                "\"goods_type\":\"0\"," +
                "\"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
                "\"quit_url\":\"http://www.taobao.com/product/113714.html\"," +
                "\"product_code\":\"QUICK_WAP_WAY\"," +
                "\"promo_params\":\"{\\\"storeIdType\\\":\\\"1\\\"}\"," +
                "\"royalty_info\":{" +
                "\"royalty_type\":\"ROYALTY\"," +
                "        \"royalty_detail_infos\":[{" +
                "          \"serial_no\":1," +
                "\"trans_in_type\":\"userId\"," +
                "\"batch_no\":\"123\"," +
                "\"out_relation_id\":\"20131124001\"," +
                "\"trans_out_type\":\"userId\"," +
                "\"trans_out\":\"2088101126765726\"," +
                "\"trans_in\":\"2088101126708402\"," +
                "\"amount\":0.1," +
                "\"desc\":\"分账测试1\"," +
                "\"amount_percentage\":\"100\"" +
                "          }]" +
                "    }," +
                "\"extend_params\":{" +
                "\"sys_service_provider_id\":\"2088511833207846\"," +
                "\"hb_fq_num\":\"3\"," +
                "\"hb_fq_seller_percent\":\"100\"," +
                "\"industry_reflux_info\":\"{\\\\\\\"scene_code\\\\\\\":\\\\\\\"metro_tradeorder\\\\\\\",\\\\\\\"channel\\\\\\\":\\\\\\\"xxxx\\\\\\\",\\\\\\\"scene_data\\\\\\\":{\\\\\\\"asset_name\\\\\\\":\\\\\\\"ALIPAY\\\\\\\"}}\"," +
                "\"card_type\":\"S0JP0000\"" +
                "    }," +
                "\"sub_merchant\":{" +
                "\"merchant_id\":\"19023454\"," +
                "\"merchant_type\":\"alipay: 支付宝分配的间连商户编号, merchant: 商户端的间连商户编号\"" +
                "    }," +
                "\"enable_pay_channels\":\"pcredit,moneyFund,debitCardExpress\"," +
                "\"disable_pay_channels\":\"pcredit,moneyFund,debitCardExpress\"," +
                "\"store_id\":\"NJ_001\"," +
                "\"settle_info\":{" +
                "        \"settle_detail_infos\":[{" +
                "          \"trans_in_type\":\"cardSerialNo\"," +
                "\"trans_in\":\"A0001\"," +
                "\"summary_dimension\":\"A0001\"," +
                "\"amount\":0.1" +
                "          }]" +
                "    }," +
                "\"invoice_info\":{" +
                "\"key_info\":{" +
                "\"is_support_invoice\":true," +
                "\"invoice_merchant_name\":\"ABC|003\"," +
                "\"tax_num\":\"1464888883494\"" +
                "      }," +
                "\"details\":\"[{\\\"code\\\":\\\"100294400\\\",\\\"name\\\":\\\"服饰\\\",\\\"num\\\":\\\"2\\\",\\\"sumPrice\\\":\\\"200.00\\\",\\\"taxRate\\\":\\\"6%\\\"}]\"" +
                "    }," +
                "\"specified_channel\":\"pcredit\"," +
                "\"business_params\":\"{\\\"data\\\":\\\"123\\\"}\"," +
                "\"ext_user_info\":{" +
                "\"name\":\"李明\"," +
                "\"mobile\":\"16587658765\"," +
                "\"cert_type\":\"IDENTITY_CARD\"," +
                "\"cert_no\":\"362334768769238881\"," +
                "\"min_age\":\"18\"," +
                "\"fix_buyer\":\"F\"," +
                "\"need_check_info\":\"F\"" +
                "    }" +
                "  }");
        AlipayTradeWapPayResponse response = alipayClient.pageExecute(request);
        if (response.isSuccess()) {
            System.out.println("调用成功");
        } else {
            System.out.println("调用失败");
        }*/
    }

    /**
     * 建立请求，以表单HTML形式构造，带文件上传功能
     *
     * @param sParaTemp       请求参数数组
     * @param strMethod       提交方式。两个值可选：post、get
     * @param strButtonName   确认按钮显示文字
     * @param strParaFileName 文件上传的参数名
     * @return 提交表单HTML文本
     */
    public static String buildRequest(Map<String, String> sParaTemp, String strMethod, String strButtonName, String strParaFileName) {
        //待请求参数数组
        Map<String, String> sPara = buildRequestPara(sParaTemp);
        List<String> keys = new ArrayList<String>(sPara.keySet());

        StringBuffer sbHtml = new StringBuffer();

        sbHtml.append("<form id=\"alipaysubmit\" name=\"alipaysubmit\"  enctype=\"multipart/form-data\" action=\"" + ALIPAY_GATEWAY_NEW
                + "_input_charset=" + AlipayConfig.charset + "\" method=\"" + strMethod
                + "\">");

        for (int i = 0; i < keys.size(); i++) {
            String name = (String) keys.get(i);
            String value = (String) sPara.get(name);

            sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
        }

        sbHtml.append("<input type=\"file\" name=\"" + strParaFileName + "\" />");

        //submit按钮控件请不要含有name属性
        sbHtml.append("<input type=\"submit\" value=\"" + strButtonName + "\" style=\"display:none;\"></form>");

        return sbHtml.toString();
    }

    /**
     * 建立请求，以模拟远程HTTP的POST请求方式构造并获取支付宝的处理结果
     * 如果接口中没有上传文件参数，那么strParaFileName与strFilePath设置为空值
     * 如：buildRequest("", "",sParaTemp)
     *
     * @param strParaFileName 文件类型的参数名
     * @param strFilePath     文件路径
     * @param sParaTemp       请求参数数组
     * @return 支付宝处理结果
     * @throws Exception
     */
    public static String buildRequest(String strParaFileName, String strFilePath, Map<String, String> sParaTemp) throws Exception {
        //待请求参数数组
        Map<String, String> sPara = buildRequestPara(sParaTemp);

        HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler.getInstance();

        HttpRequest request = new HttpRequest(HttpResultType.BYTES);
        //设置编码集
        request.setCharset(AlipayConfig.charset);

        request.setParameters(generatNameValuePair(sPara));
        request.setUrl(ALIPAY_GATEWAY_NEW + "_input_charset=" + AlipayConfig.charset);

        HttpResponse response = httpProtocolHandler.execute(request, strParaFileName, strFilePath);
        if (response == null) {
            return null;
        }

        String strResult = response.getStringResult();

        return strResult;
    }

    /**
     * MAP类型数组转换成NameValuePair类型
     *
     * @param properties MAP类型数组
     * @return NameValuePair类型数组
     */
    private static NameValuePair[] generatNameValuePair(Map<String, String> properties) {
        NameValuePair[] nameValuePair = new NameValuePair[properties.size()];
        int i = 0;
        for (Map.Entry<String, String> entry : properties.entrySet()) {
            nameValuePair[i++] = new NameValuePair(entry.getKey(), entry.getValue());
        }

        return nameValuePair;
    }

    public static String buildRequest(Map<String, String> sParaTemp) {
        return null;
    }
}
