package com.baigu.app.shop.component.payment.plugin.alipay;

import com.alipay.api.internal.util.AlipaySignature;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.config.AlipayConfig;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


/**
 * 支付宝工具
 * 提供验证方法
 *
 * @author kingapex
 * @version 1.0
 * 2015年9月24日下午1:47:42
 */
public abstract class DmallAlipayUtil {

    /**
     * 获取支付宝返回给returnURL的参数
     *
     * @param param_encoding
     * @return
     * @throws UnsupportedEncodingException
     */
    public static Map<String, String> getAlipayReturnParams(String param_encoding) throws UnsupportedEncodingException {
        HttpServletRequest request = ThreadContextHolder.getHttpRequest();
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            if (StringUtils.isNotBlank(param_encoding)) {
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), param_encoding);
            }
            params.put(name, valueStr);
        }
        return params;
    }

    public static boolean verify(String param_encoding) {
        try {

            Map<String, String> params = getAlipayReturnParams(param_encoding);

            // 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
            // 商户订单号
            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.public_key, AlipayConfig.charset, AlipayConfig.sign_type);
            return verify_result;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
