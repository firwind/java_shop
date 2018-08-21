package com.baigu.app.sms.component.lksms.plugin;

import com.baigu.app.base.core.plugin.sms.AbstractSmsPlugin;
import com.baigu.app.base.core.plugin.sms.ISmsSendEvent;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.Map;

/**
 * 凌凯短信插件
 * @author Sylow
 * @version v1.0,2017-02-13
 * @since v6.2.1
 */
@Component
public class SmsLkPlugin extends AbstractSmsPlugin implements ISmsSendEvent {

	private static String URL = "https://sdk2.028lk.com/sdk2/BatchSend2.aspx?CorpID=#corpId#&Pwd=#pwd#@&Mobile=#phone#&Content=#content#&Cell=&SendTime=";

	protected final Logger logger = Logger.getLogger(getClass());

	@Override
	public boolean onSend(String phone, String content, Map param) {
		try {
			String corpId = (String) param.get("corpId");
			String pwd = (String) param.get("pwd");
			if (StringUtils.isBlank(corpId) || StringUtils.isBlank(pwd)) {
				throw new RuntimeException("凌凯短信插件参数不正确");
			}
			String urlStr = URL.replace("#phone#", phone).replace("#corpId#", corpId).replace("#pwd#", pwd).replace("#content#",
					URLEncoder.encode(content, "GBK"));
			Request request = new Request.Builder()
					.url(urlStr)
					.build();
			OkHttpClient client = new OkHttpClient();
			Response response = client.newCall(request).execute();
			String id = response.body().string();
			return StringUtils.isNotBlank(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
		return false;
	}

    
    
    /*** 
     * MD5加码 生成32位md5码 
	 */
	public static String string2MD5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++) {
			byteArray[i] = (byte) charArray[i];
		}
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
  
    }  
  
    /** 
     * 加密解密算法 执行一次加密，两次解密 
     */   
    public static String convertMD5(String inStr){  
  
        char[] a = inStr.toCharArray();  
        for (int i = 0; i < a.length; i++){  
            a[i] = (char) (a[i] ^ 't');  
        }  
        String s = new String(a);  
        return s;  
  
    }  

	@Override
	public String getId() {
		return "smsLtPlugin";
	}

	@Override
	public String getName() {
		return "凌凯短信插件";
	}

}
