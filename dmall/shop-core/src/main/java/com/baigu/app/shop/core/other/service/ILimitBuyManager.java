package com.baigu.app.shop.core.other.service;

import java.util.List;
import java.util.Map;

import com.baigu.app.shop.core.other.model.LimitBuy;
import com.baigu.framework.database.Page;

public interface ILimitBuyManager {
	
	public void add(LimitBuy limitBuy );
	public void edit(LimitBuy limitBuy );
	public Page list(int pageNo,int pageSize);
	public   List<LimitBuy> listEnable();
	public List<Map>  listEnableGoods();
	public void delete(Integer id);
	public LimitBuy get(Integer id);
	
}
