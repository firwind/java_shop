package com.baigu.eop.resource.impl;

import java.util.List;

import com.baigu.eop.resource.IIndexItemManager;
import com.baigu.framework.database.IDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baigu.eop.resource.model.IndexItem;

/**
 * 首页项管理实现
 * 
 * @author kingapex 2010-10-12下午04:00:31
 */
@Service
public class IndexItemManager   implements IIndexItemManager {

	@Autowired
	private IDaoSupport daoSupport;
	/**
	 * 添加首页项
	 */
	public void add(IndexItem item) {
		daoSupport.insert("es_index_item", item);
	}

	/**
	 * 读取首页项列表
	 */
	public List<IndexItem> list() {
		String sql = "select * from es_index_item order by sort";
		return daoSupport.queryForList(sql, IndexItem.class);
	}

	public void clean() {
		daoSupport.execute("truncate table es_index_item");
	}

}
