package com.baigu.app.shop.component.ordercore.plugin.shiplog;

import java.util.List;

import com.baigu.app.shop.core.goods.model.StoreLog;
import com.baigu.app.shop.core.order.model.Order;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.base.core.service.auth.IAdminUserManager;
import com.baigu.app.shop.core.goods.service.IStoreLogManager;
import com.baigu.app.shop.core.order.model.Delivery;
import com.baigu.app.shop.core.order.model.DeliveryItem;
import com.baigu.app.shop.core.order.plugin.order.IOrderShipEvent;
import com.baigu.eop.resource.model.AdminUser;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import com.baigu.framework.util.DateUtil;

/**
 * 订单发货库存日志插件
 * @author kingapex
 * @date 2011-11-6 下午4:41:42 
 * @version V1.0
 */
@Component
public class ShipStoreLogPlugin extends AutoRegisterPlugin implements
		IOrderShipEvent {

	private IStoreLogManager storeLogManager;
	private IAdminUserManager adminUserManager;
	 

	@Override
	public void itemShip(Order order, DeliveryItem deliveryItem) {
		// TODO Auto-generated method stub
		int depotid  = deliveryItem.getDepotId(); //发货仓库
		int num = deliveryItem.getNum(); //发货量
		int goodsid  = deliveryItem.getGoods_id(); //商品id
		
		AdminUser adminUser = UserConext.getCurrentAdminUser();
		Member member=UserConext.getCurrentMember();
		
		StoreLog storeLog = new StoreLog();
		storeLog.setGoodsid(goodsid);
//		storeLog.setGoodsname(goods.get("name").toString());
		storeLog.setDepot_type(1);
		storeLog.setOp_type(2);
		storeLog.setDepotid(depotid);
		storeLog.setDateline(DateUtil.getDateline());
		storeLog.setNum(num);
		if(adminUser!=null){		
			storeLog.setUserid(adminUser.getUserid());
			storeLog.setUsername(adminUser.getUsername());
		}else{
			storeLog.setUserid(member.getMember_id());
			storeLog.setUsername(member.getName());
		}
		storeLogManager.add(storeLog);

	}

	@Override
	public void ship(Delivery delivery, List<DeliveryItem> itemList) {
	 

	}


	@Override
	public boolean canBeExecute(int catid) {
		 
		return true;
	}
 

	public IStoreLogManager getStoreLogManager() {
		return storeLogManager;
	}

	public void setStoreLogManager(IStoreLogManager storeLogManager) {
		this.storeLogManager = storeLogManager;
	}

	public IAdminUserManager getAdminUserManager() {
		return adminUserManager;
	}

	public void setAdminUserManager(IAdminUserManager adminUserManager) {
		this.adminUserManager = adminUserManager;
	}

}
