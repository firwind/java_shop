package com.baigu.app.shop.component.ordercore.plugin.statecheck;

import java.util.List;

import com.baigu.app.shop.component.ordercore.plugin.setting.OrderSetting;
import com.baigu.app.shop.core.order.model.SellBackStatus;
import com.baigu.app.shop.core.order.service.ISellBackManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.baigu.app.base.core.plugin.job.IEveryDayExecuteEvent;
import com.baigu.app.shop.core.order.model.SellBack;
import com.baigu.eop.SystemSetting;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import com.baigu.framework.util.DateUtil;

/**
 * 售后检测插件
 * 超时未入库则取消退货申请
 * @author Kanon
 *
 */
@Component
public class SellBackCheckPlugin extends AutoRegisterPlugin implements IEveryDayExecuteEvent{

	@Autowired
	private IDaoSupport daoSupport;
	
	@Autowired
	private ISellBackManager sellBackManager;
	@Override
	public void everyDay() {
		Integer time= OrderSetting.getCancel_sellback_day()*24*60*60;
		if(SystemSetting.getTest_mode()==1){//如果测试模式开启 将时间改为60秒
			time=60;
		}
		String sql="select * from es_sellback_list where type=2 and tradestatus=? and confirm_time+?<?";
		List<SellBack>  sellBakc_list  =  this.daoSupport.queryForList(sql,SellBack.class, SellBackStatus.in_storage.getValue(),time,DateUtil.getDateline());
		
		//取消退货申请
		for (SellBack sellBackList : sellBakc_list) {
			
			sellBackManager.cancle(sellBackList);
		}
	}

}
