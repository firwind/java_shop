package com.baigu.app.shop.component.payment.plugin.cod;

import com.baigu.app.shop.core.order.model.PayCfg;
import com.baigu.app.shop.core.order.plugin.payment.IPaymentEvent;
import org.springframework.stereotype.Component;

import com.baigu.app.shop.core.order.model.PayEnable;
import com.baigu.app.shop.core.order.model.PaymentLog;
import com.baigu.app.shop.core.order.model.Refund;
import com.baigu.app.shop.core.order.plugin.payment.AbstractPaymentPlugin;

/**
 * 货到付款支付插件
 * @author kingapex
 *2012-3-30上午10:27:18
 */
@Component("cod")
public class CodPlugin extends AbstractPaymentPlugin implements IPaymentEvent {


	@Override
	public String onCallBack(String ordertype) {
		return "";
	}

	@Override
	public String onPay(PayCfg payCfg, PayEnable order) {
		
		return "";
	}

	
 

	@Override
	public String getId() {
		return "cod";
	}

	@Override
	public String getName() {
		return "货到付款";
	}


	@Override
	public String onReturn(String ordertype) {
		return "";
	}

	@Override
	public String onRefund(PayEnable order, Refund refund, PaymentLog paymentLog) {
		// TODO Auto-generated method stub
		return null;
	}


}
