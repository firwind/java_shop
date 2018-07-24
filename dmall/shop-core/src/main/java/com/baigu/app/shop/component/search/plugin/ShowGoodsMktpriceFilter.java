package com.baigu.app.shop.component.search.plugin;

import com.baigu.app.shop.core.goods.plugin.search.IGoodsDataFilter;
import com.baigu.app.shop.core.goods.utils.GoodsUtils;
import com.baigu.app.shop.core.order.model.support.CartItem;
import com.baigu.app.shop.core.order.plugin.cart.ICartItemFilter;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * 未登录展示商品市场价过滤器
 * <p>
 * create by xt on 2018-07-24 15:13
 */
@Component
public class ShowGoodsMktpriceFilter extends AutoRegisterPlugin implements ICartItemFilter, IGoodsDataFilter {

    @Override
    public void filter(List<CartItem> itemlist, String sessionid) {
        for (CartItem cartItem : itemlist) {
            if (UserConext.getCurrentMember() == null && cartItem.getPrice() != null && cartItem.getMktprice() != null) {
                cartItem.setPrice(cartItem.getMktprice());
                cartItem.setCoupPrice(cartItem.getMktprice());
            }
        }
    }

    @Override
    public void filter(List<Map> goods) {
        GoodsUtils.handleGoodsMap(goods);
    }
}
