package com.baigu.app.shop.core.goods.service;

import java.util.Map;

/**
 * 
 * (商品快照管理) 
 * @author zjp
 * @version v1.0
 * @since v6.1
 * 2016年12月12日 上午2:27:03
 */
public interface IGoodsSnapshotManager {

 
	/**
	 * 读取一个商品的快照
	 * @param Goods_id
	 * @return Map
	 */
	public Map get(Integer snapshot_id);
	
}