package com.baigu.app.shop.core.goods.service;

import com.baigu.app.shop.core.goods.model.StoreLog;

/**
 * 库存日志
 * @author xiaokx
 *
 */
public interface IStoreLogManager {
	/**
	 * 添加库存日志
	 * @param storeLog 库存日志
	 */
	public void add(StoreLog storeLog);

}
