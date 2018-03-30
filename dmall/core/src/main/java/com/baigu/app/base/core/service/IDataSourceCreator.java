package com.baigu.app.base.core.service;

import javax.sql.DataSource;

public interface IDataSourceCreator {
	
	public DataSource createDataSource(String driver,String url,String username,String password);
	
}
