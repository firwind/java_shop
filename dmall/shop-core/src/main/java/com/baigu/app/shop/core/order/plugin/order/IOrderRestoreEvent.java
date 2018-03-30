package com.baigu.app.shop.core.order.plugin.order;

import com.baigu.app.shop.core.order.model.Order;

public interface IOrderRestoreEvent {
	public void restore(Order order);
}
