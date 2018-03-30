package com.baigu.eop.resource.impl;

import java.util.List;

import com.baigu.eop.resource.model.EopApp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baigu.eop.resource.IAppManager;
import com.baigu.framework.database.IDaoSupport;

/**
 * 应用管理
 * 
 * @author kingapex 2010-5-10上午11:13:21
 */
@Service("appDbManager")
public class AppManagerImpl implements IAppManager {
	
	@Autowired
	private IDaoSupport  daoSupport;

	public EopApp get(String appid) {
		String sql = "select * from eop_app where id=?";
		return this.daoSupport.queryForObject(sql, EopApp.class, appid);
	}

	public List<EopApp> list() {
		String sql = "select * from eop_app";
		return this.daoSupport.queryForList(sql, EopApp.class);
	}
 

	public void add(EopApp app) {
		this.daoSupport.insert("eop_app", app);
	}

}