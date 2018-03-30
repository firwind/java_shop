package com.baigu.eop.resource.impl.cache;

import java.util.List;

import com.baigu.eop.processor.core.EopException;
import com.baigu.eop.resource.model.EopApp;
import com.baigu.framework.cache.CacheFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baigu.eop.resource.IAppManager;
import com.baigu.framework.cache.ICache;

/**
 * App Manager的缓存代理
 * 
 * @author kingapex
 *         <p>
 *         2009-12-16 下午05:15:28
 *         </p>
 * @version 1.0
 */
@Service("appManager")
public class AppCacheProxy implements IAppManager {
	protected final Logger logger = Logger.getLogger(getClass());

	private IAppManager appManager;
	private static final String APP_LIST_CACHE_KEY = "applist";
	
	@Autowired
	public AppCacheProxy(IAppManager appDbManager) {
		this.appManager = appDbManager;
	}
	
	/*
	 * (non-Javadoc)
	 * @see IAppManager#add(EopApp)
	 */
	@Override
	public void add(EopApp app) {
		ICache cache= CacheFactory.getCache(APP_LIST_CACHE_KEY);
		cache.remove(APP_LIST_CACHE_KEY);
		appManager.add(app);
	}

	/*
	 * (non-Javadoc)
	 * @see IAppManager#get(java.lang.String)
	 */
	@Override
	public EopApp get(String appid) {
		if (logger.isDebugEnabled()) {
			logger.debug("get app : " + appid);
		}
		List<EopApp> appList = this.list();

		for (EopApp app : appList) {
			if (app.getAppid().equals(appid)) {
				return app;
			}
		}
		throw new EopException("App not found");
	}

	/*
	 * (non-Javadoc)
	 * @see IAppManager#list()
	 */
	@Override
	public List<EopApp> list() {
		ICache cache=CacheFactory.getCache(APP_LIST_CACHE_KEY);
		List<EopApp> appList=(List<EopApp>) cache.get(APP_LIST_CACHE_KEY);
		if (appList == null) {
			if (logger.isDebugEnabled()) {
				logger.debug("get applist from database");
			}
			appList = appManager.list();
			cache.put(APP_LIST_CACHE_KEY, appList);
		} else {
			// if(logger.isDebugEnabled()){
			// logger.debug("get applist from cache");
			// }
		}
		return appList;
	}

}
