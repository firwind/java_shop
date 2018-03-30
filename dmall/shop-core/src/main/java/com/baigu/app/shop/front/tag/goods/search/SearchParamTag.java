package com.baigu.app.shop.front.tag.goods.search;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.baigu.app.shop.core.goods.utils.UrlUtils;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import com.baigu.framework.util.StringUtil;

import freemarker.template.TemplateModelException;

/**
 * 搜索参数标签
 * 输入名称，得到搜索参数值
 * @author kingapex
 *2013-7-30上午11:52:17
 */
@Component
@Scope("prototype")
public class SearchParamTag extends BaseFreeMarkerTag {

	@Override
	protected Object exec(Map params) throws TemplateModelException {
		String name =(String)params.get("name");
		
		if(StringUtil.isEmpty(name)){
			throw new TemplateModelException("必须传递name参数");
		}
		
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String uri = request.getServletPath();
		String value = UrlUtils.getParamStringValue(uri, name);
		
		return  value;
	}

}
