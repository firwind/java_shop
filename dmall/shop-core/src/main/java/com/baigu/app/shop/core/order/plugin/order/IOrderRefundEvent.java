package com.baigu.app.shop.core.order.plugin.order;

import com.baigu.app.shop.core.order.model.Order;
import com.baigu.app.shop.core.order.model.Refund;

/**
 * 订单退款事件
 * @author jianghongyan
 *
 */
public interface IOrderRefundEvent {
	
	public void onRefund(Order order, Refund refund);
}
