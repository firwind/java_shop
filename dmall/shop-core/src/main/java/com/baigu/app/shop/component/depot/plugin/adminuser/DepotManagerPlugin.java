package com.baigu.app.shop.component.depot.plugin.adminuser;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.baigu.app.shop.core.goods.model.Depot;
import com.baigu.app.shop.core.goods.model.DepotUser;
import com.baigu.app.shop.core.goods.service.IDepotManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.plugin.user.IAdminUserDeleteEvent;
import com.baigu.app.base.core.plugin.user.IAdminUserInputDisplayEvent;
import com.baigu.app.base.core.plugin.user.IAdminUserLoginEvent;
import com.baigu.app.base.core.plugin.user.IAdminUserOnAddEvent;
import com.baigu.app.base.core.plugin.user.IAdminUserOnEditEvent;
import com.baigu.eop.processor.core.freemarker.FreeMarkerPaser;
import com.baigu.eop.resource.model.AdminUser;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import com.baigu.framework.util.StringUtil;

/**
 * 库管员插件
 * @author kingapex
 *
 */
@Component
public class DepotManagerPlugin  extends AutoRegisterPlugin implements IAdminUserOnAddEvent,
		IAdminUserOnEditEvent, IAdminUserInputDisplayEvent,IAdminUserDeleteEvent,IAdminUserLoginEvent {
	
	@Autowired
	private IDepotManager depotManager;
	
	@Autowired
	private IDaoSupport daoSupport;
	@Override
	public String getInputHtml(AdminUser user) {
		//获取店铺列表
		List<Depot> roomList = depotManager.list();
		FreeMarkerPaser freeMarkerPaser = FreeMarkerPaser.getInstance();		
		freeMarkerPaser.putData("roomList" ,roomList);
		
		//判断是否为修改管理员
		if(user!=null){
			Integer  depotid =(Integer)this.daoSupport.queryForInt("select depotid from es_depot_user where userid=?",user.getUserid());
			freeMarkerPaser.putData("depotid",depotid);
		}
		
		return freeMarkerPaser.proessPageContent();
	}

	@Override
	public void onEdit(Integer userid) {
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		String depotid = request.getParameter("depotid");
		if(!StringUtil.isEmpty(depotid)){
			String sql ="select count(0) from es_depot_user where  userid=?";
			int count  = this.daoSupport.queryForInt(sql, userid);
			//判断是否已经为库管员
			if(count>0){
				this.daoSupport.execute("update es_depot_user set depotid=? where userid=?", depotid,userid);
			}else{
				this.daoSupport.execute("insert into es_depot_user(userid,depotid)values(?,?)", userid,depotid);
			}
		}
	}

	@Override
	public void onAdd(Integer userid) {
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		if(request!=null){
			String depotid = request.getParameter("depotid");
			if(!StringUtil.isEmpty(depotid)){
				this.daoSupport.execute("insert into es_depot_user(userid,depotid)values(?,?)", userid,depotid);
			}
		}
	}

	
	@Override
	public void onDelete(int userid) {
		 this.daoSupport.execute("delete from es_depot_user where userid=?", userid);
	}

	@Override
	public void onLogin(AdminUser user) {
		HttpSession  sessonContext = ThreadContextHolder.getSession();		
				Integer  depotid =(Integer)this.daoSupport.queryForInt("select depotid from es_depot_user where userid=?" ,user.getUserid());
				 DepotUser stockUser = new DepotUser();
				 stockUser.setFounder(user.getFounder());
				 stockUser.setPassword(user.getPassword());
				 stockUser.setRealname(user.getRealname());
				 stockUser.setRemark(user.getRemark());
				 stockUser.setRoleids(user.getRoleids());
				 stockUser.setSiteid(user.getSiteid());
				 stockUser.setState(user.getState());
				 stockUser.setUserdept(user.getUserdept());
				 stockUser.setUserid(user.getUserid());
				 stockUser.setUsername(user.getUsername());
				 stockUser.setUserno(user.getUserno());
				 stockUser.setDateline(user.getDateline());
				 if(depotid!= null){
					 stockUser.setDepotid(depotid); 
				 }
				 stockUser.setAuthList(user.getAuthList());
				 sessonContext.setAttribute(UserConext.CURRENT_ADMINUSER_KEY,stockUser); 
	}

}
