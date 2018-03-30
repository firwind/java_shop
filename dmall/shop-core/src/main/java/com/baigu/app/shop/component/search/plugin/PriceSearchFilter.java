package com.baigu.app.shop.component.search.plugin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.baigu.app.shop.core.goods.model.Cat;
import com.baigu.app.shop.core.goods.plugin.search.IGoodsFrontSearchFilter;
import com.baigu.app.shop.core.goods.utils.PriceUrlUtils;
import org.springframework.stereotype.Component;

import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import com.baigu.framework.util.StringUtil;

/**
 * 价格搜索过虑器<br/>
 * 由themes下加载 price_filter.xml 过滤条件
 *  
 * @author kingapex
 *
 */
@Component
public class PriceSearchFilter extends AutoRegisterPlugin implements
        IGoodsFrontSearchFilter {

	private static Map<String,List<Price>> priceMap;
	
	public void createSelectorList(Map map,Cat cat){
		PriceUrlUtils.createAndPut(map);
	}

	
	public void filter(StringBuffer sql, Cat cat) { 
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		
		String urlFragment = request.getParameter("price");
		if(!StringUtil.isEmpty( urlFragment ) ){
			String[] price = urlFragment.split("_");
			if(price!=null && price.length>=1 && !StringUtil.isEmpty(price[0])){
				sql.append(" and  g.price>="+price[0]);				
			}
			if(price!=null && price.length>=2 && !StringUtil.isEmpty(price[1])){
				sql.append(" and g.price<"+price[1]);				
			}
			
		}
	}

	
	
	 
	
	public String getFilterId() {
		
		return "price";
	}

	
	public String getAuthor() {
		
		return "kingapex";
	}

	
	public String getId() {
		
		return "priceSearchFilter";
	}

	
	public String getName() {
		
		return "价格搜索过虑器";
	}

	
	public String getType() {
		
		return "searchFilter";
	}

	
	public String getVersion() {
		
		return "1.0";
	}

	
	public void perform(Object... params) {
		

	}
	
	public void register() {
		

	}

}
