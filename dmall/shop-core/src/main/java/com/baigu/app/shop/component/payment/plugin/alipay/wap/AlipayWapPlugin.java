package com.baigu.app.shop.component.payment.plugin.alipay.wap;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.base.core.service.IMemberManager;
import com.baigu.app.shop.component.payment.plugin.alipay.AlipayRefund;
import com.baigu.app.shop.component.payment.plugin.alipay.DmallAlipayUtil;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.config.AlipayConfig;
import com.baigu.app.shop.component.payment.plugin.alipay.sdk33.util.AlipaySubmit;
import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.app.shop.core.order.model.*;
import com.baigu.app.shop.core.order.plugin.payment.AbstractPaymentPlugin;
import com.baigu.app.shop.core.order.plugin.payment.IPaymentEvent;
import com.baigu.app.shop.core.order.service.IOrderManager;
import com.baigu.app.shop.core.order.service.OrderStatus;
import com.baigu.eop.resource.model.EopSite;
import com.baigu.framework.context.spring.SpringContextHolder;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.util.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 支付宝wap支付接口
 * @version 1.1 kanon 2016-7－26 修改支付回调方法，添加买家支付宝账号进行纪录。
 *
 */
@Component
public class AlipayWapPlugin extends AbstractPaymentPlugin  implements IPaymentEvent {

	@Autowired
	private IDaoSupport daoSupport;
	@Autowired
	private IOrderManager orderManager;
	@Autowired
	private IMemberManager memberManager;

	@Override
	public String onPay(PayCfg payCfg, PayEnable order) {
		
		try {
			
			Map<String,String> params = paymentManager.getConfigParams(this.getId());
			String app_id = params.get("app_id");
			String private_key = params.get("private_key");
			String public_key = params.get("public_key");
			String out_trade_no = order.getSn(); // 商户网站订单
			String param_encoding = params.get("param_encoding"); // 参数编码

			//必填，不能修改
			//服务器异步通知页面路径
			String notify_url =this.getCallBackUrl(payCfg, order);
			//需http://格式的完整路径，不能加?id=123这类自定义参数

			//页面跳转同步通知页面路径
			String return_url = this.getReturnWapUrl(payCfg, order);
			//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
			
			String show_url= this.getWapShowUrl(order);
			
			//商户订单号
			if (StringUtils.isNotBlank(param_encoding)) {
				out_trade_no = new String(out_trade_no.getBytes("ISO-8859-1"), param_encoding);
			}
			//商户网站订单系统中唯一订单号，必填

			String sitename = EopSite.getInstance().getSitename();
			//订单名称
			String subject =sitename+"订单";
			if (StringUtils.isNotBlank(param_encoding)) {
				subject = new String(subject.getBytes("ISO-8859-1"), param_encoding);
			}

			//必填
			String body =  ("订单："+out_trade_no);
			if (StringUtils.isNotBlank(param_encoding)) {
				body = new String(body.getBytes("ISO-8859-1"), param_encoding);
			}

			String price = String.valueOf(order.getNeedPayMoney());
			//付款金额
			if (StringUtils.isNotBlank(param_encoding)) {
				price = new String(price.getBytes("ISO-8859-1"), param_encoding);
			}
			
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", "alipay.wap.create.direct.pay.by.user");
			sParaTemp.put("app_id", app_id);
			sParaTemp.put("private_key", private_key);
			sParaTemp.put("public_key", public_key);
			sParaTemp.put("param_encoding", param_encoding);
			sParaTemp.put("notify_url", notify_url);
			sParaTemp.put("return_url", return_url);
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", subject);
			sParaTemp.put("body", body);
			sParaTemp.put("total_fee", price);
			sParaTemp.put("show_url", show_url);
			String sHtmlText = AlipaySubmit.buildRequest(sParaTemp);
			return sHtmlText;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String onCallBack(String ordertype) {
		try {
			
			Map<String,String> paramscfg = paymentManager.getConfigParams(this.getId());
			String app_id = paramscfg.get("app_id");
			String private_key = paramscfg.get("private_key");
			String public_key = paramscfg.get("public_key");
			AlipayConfig.app_id = app_id;
			AlipayConfig.private_key = private_key;
			AlipayConfig.public_key = public_key;
			String param_encoding = paramscfg.get("param_encoding");  
			
			HttpServletRequest request  =  ThreadContextHolder.getHttpRequest();
		 
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//商户订单号
			String out_trade_no = request.getParameter("out_trade_no");
			if (StringUtils.isNotBlank(param_encoding)) {
				out_trade_no = new String(out_trade_no.getBytes("ISO-8859-1"), param_encoding);
			}

			//支付宝交易号
			String trade_no = request.getParameter("trade_no");
			if (StringUtils.isNotBlank(param_encoding)) {
				trade_no = new String(trade_no.getBytes("ISO-8859-1"), param_encoding);
			}

			//交易状态
			String trade_status = request.getParameter("trade_status");
			if (StringUtils.isNotBlank(param_encoding)) {
				trade_status = new String(trade_status.getBytes("ISO-8859-1"), param_encoding);
			}

			//买家支付宝账号
			String buyer_logon_id = request.getParameter("buyer_logon_id");
			if (StringUtils.isNotBlank(param_encoding)) {
				buyer_logon_id = new String(buyer_logon_id.getBytes("ISO-8859-1"), param_encoding);
			}
			
			if(DmallAlipayUtil.verify(param_encoding)){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
//				System.out.println("校验成功");
				//请在这里加上商户的业务逻辑程序代码


				//支付成功操作（销量统计等）
				Order order = this.orderManager.get(out_trade_no);
				if (order == null) {
					throw new RuntimeException("订单为空");
				}
				if (order.getPay_status() == OrderStatus.PAY_NO) {//未支付在做操作
					this.paySuccess(out_trade_no, trade_no, buyer_logon_id, ordertype);
					statisticsAgentSale(order);
				}
				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				
				if(trade_status.equals("TRADE_FINISHED")||trade_status.equals("TRADE_SUCCESS")){
					this.logger.info("异步校验订单["+out_trade_no+"]成功");
					return ("success");	//请不要修改或删除
					
				}else {
					this.logger.info("异步校验订单["+out_trade_no+"]成功");
					return ("success");	//请不要修改或删除
				}
			}else{//验证失败
				this.logger.info("异步校验订单["+out_trade_no+"]失败");
				return ("fail");
			}
		 
		} catch (Exception e) {
			e.printStackTrace();
			return ("fail");
		}
	}

	/**
	 * 统计代理销量
	 *
	 * @param order
	 */
	private void statisticsAgentSale(Order order) {
		Member member = memberManager.get(order.getMember_id());
		Double personSale = order.getGoods_amount();
		String month = DateUtil.toMonthString(order.getCreate_time() * 1000);
		daoSupport.execute("insert into es_month_sale(member_id, month, person_sale, team_sale) values(?, ?, ?, ?) " +
						"on duplicate key update person_sale = person_sale + ?, " +
						"team_sale = team_sale + ?", member.getMember_id(), month,
				personSale, personSale, personSale, personSale);

		// 所有父级的团队销量也要增加
		String parentIds = member.cleanParentids();
		if (org.apache.commons.lang.StringUtils.isNotBlank(parentIds)) {
			// 先确保所有父级都有销量记录
			List<MonthSale> monthSales = daoSupport.queryForList("select * from es_month_sale where month = ? " +
					"and member_id in (?)", MonthSale.class, month, parentIds);
			String[] parentMemberIds = parentIds.split(",");
			if (monthSales.size() < parentMemberIds.length) {
				for (String parentMemberId : parentMemberIds) {
					boolean exists = false;
					for (MonthSale ms : monthSales) {
						if (parentMemberId.equals(ms.getMember_id())) {
							exists = true;
							break;
						}
					}
					if (!exists) {
						daoSupport.execute("insert into es_month_sale(member_id, month, person_sale, team_sale) values(?, ?, ?, ?) " +
										"on duplicate key update person_sale = person_sale",
								parentMemberId, month, 0, 0);
					}
				}
			}
			// 更新父级团队销量
			daoSupport.execute("update es_month_sale set team_sale = team_sale + " + personSale + " where month = " + month + "  and member_id in (" + parentIds + ")");
		}

		//更新奖金表使重新计算奖金
		daoSupport.execute("INSERT INTO es_month_bonus (member_id, `month`) VALUES (?, ?) ON DUPLICATE KEY UPDATE recount = 1", member.getMember_id(), month);
	}

	@Override
	public String onReturn(String ordertype) {
	//	return "SP20140516024914";
			try {
				Map<String,String> cfgparams = paymentManager.getConfigParams(this.getId());
				String app_id = cfgparams.get("app_id");
				String private_key = cfgparams.get("private_key");
				String public_key = cfgparams.get("public_key");
				AlipayConfig.app_id = app_id;
				AlipayConfig.private_key = private_key;
				AlipayConfig.public_key = public_key;
				String param_encoding = cfgparams.get("param_encoding");

				//获取支付宝GET过来反馈信息
				HttpServletRequest request  =  ThreadContextHolder.getHttpRequest();

				//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
				//商户订单号
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

				//支付宝交易号
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
				
				//买家支付宝账号
				//新的阿里支付，这里已经不提供支付者id的返回，手动拼接一个字符串，以解决这里支付失败的异常
//				String buyer_logon_id = new String(request.getParameter("buyer_logon_id").getBytes("ISO-8859-1"),"UTF-8");
				String buyer_logon_id = "支付宝wap在线支付单号"+trade_no;
				
				//计算得出通知验证结果
				boolean verify_result = DmallAlipayUtil.verify(param_encoding);
				if(verify_result){
					this.paySuccess(out_trade_no,trade_no,buyer_logon_id,ordertype);
					this.logger.info("同步校验订单["+out_trade_no+"]成功");
					return out_trade_no;	
				}else{
					this.logger.info("同步校验订单失败");
					throw new RuntimeException("验证失败");  
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				this.logger.info("异步校验订单失败");
				throw new RuntimeException("验证失败",e);  
			}
	}

	@Override
	public String getId() {
		return "alipayWapPlugin";
	}

	@Override
	public String getName() {
		return "支付宝Wap支付接口";
	}

	@Override
	public String onRefund(PayEnable order, Refund refund,PaymentLog paymentLog) {
		AlipayRefund alipayRefund = SpringContextHolder.getBean("alipayRefund");
		return alipayRefund.onRefund(order, refund,paymentLog);
	}

	

}
