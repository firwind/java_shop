package com.baigu.app.shop.component.agent.plugin;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.core.agent.model.MonthSale;
import com.baigu.app.shop.core.order.model.Order;
import com.baigu.app.shop.core.order.model.support.CartItem;
import com.baigu.app.shop.core.order.plugin.order.IAfterOrderCreateEvent;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import com.baigu.framework.util.DateUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 统计代理商销量插件
 * @author baigu
 * @date 2018-04-09 下午5:55:06
 * @version V1.0
 */
@Component
public class StatAgentSalePlugin extends AutoRegisterPlugin implements
        IAfterOrderCreateEvent {

	@Autowired
	private IDaoSupport daoSupport;

	/**
	 * TODO fix 应该在付款后才统计销量，由于暂时没做支付，为方便演示所以直接在订单创建后就统计销量
	 * 订单创建后统计销量
	 * @param order
	 * @param itemList
	 * @param sessionid
	 */
	@Override
	public void onAfterOrderCreate(Order order, List<CartItem>   itemList, String sessionid) {
		Member member = UserConext.getCurrentMember();
		Double personSale = order.getGoods_amount();
		String month = DateUtil.toMonthString(order.getCreate_time() * 1000);
		daoSupport.execute("insert into es_month_sale(member_id, month, person_sale, team_sale) values(?, ?, ?, ?) " +
						"on duplicate key update person_sale = person_sale + ?, " +
						"team_sale = team_sale + ?", member.getMember_id(), month,
				personSale, personSale, personSale, personSale);

		// 所有父级的团队销量也要增加
		String parentIds = member.getParentids();
		if (StringUtils.isNotBlank(parentIds)) {
			// 先确保所有父级都有销量记录
			List<MonthSale> monthSales = daoSupport.queryForList("select * from es_month_sale where month = ? " +
					"and member_id in (?)", MonthSale.class, month, parentIds);
			String[] parentMemberIds = parentIds.split(",");
			if (monthSales.size() < parentMemberIds.length) {
				for (String parentMemberId : parentMemberIds) {
					boolean exists = false;
					for (MonthSale ms : monthSales) {
						if (parentMemberId.equals(ms.getMember_id())) {
							exists = true;
							break;
						}
					}
					if (!exists) {
						daoSupport.execute("insert into es_month_sale(member_id, month, person_sale, team_sale) values(?, ?, ?, ?) " +
										"on duplicate key update person_sale = person_sale",
								parentMemberId, month, 0, 0);
					}
				}
			}
			// 更新父级团队销量
			daoSupport.execute("update es_month_sale set team_sale = team_sale + " + personSale + " where month = " + month + "  and member_id in (" + parentIds + ")");
		}

		//更新奖金表使重新计算奖金
		daoSupport.execute("INSERT INTO es_month_bonus (member_id, `month`) VALUES (?, ?) ON DUPLICATE KEY UPDATE recount = 1", member.getMember_id(), month);
	}
}
