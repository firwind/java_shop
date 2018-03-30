package com.baigu.app.base.core.plugin.fdfs;

import com.baigu.framework.cache.ICache;

/**
 * 获取fdfs专用缓存
 * @author Chopper
 *
 */
public interface IGetFDFSCacheEvent {

	public ICache getCache(); 
	
}
