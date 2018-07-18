package com.baigu.app.shop.component.agent;

import com.baigu.framework.component.IComponent;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.database.data.IDataOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AgentComponent implements IComponent {

	@Autowired
	private IDataOperation dataOperation;

	@Autowired
	private IDaoSupport daoSupport;

	@Override
	public void install() {
		dataOperation.imported("file:com/baigu/app/shop/component/agent/agent_install.xml");

		String sql="insert into es_site_menu (parentid,name,url,target,sort) values (?,?,?,?,?)";
		this.daoSupport.execute(sql, 0,"代理管理","agent/agent-index.html","",5);
	}

	@Override
	public void unInstall() {

	}

}
