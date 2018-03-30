package com.baigu.app.shop.front.tag.goods;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.baigu.eop.processor.HttpCopyWrapper;
import com.baigu.eop.processor.facade.GoodsPreviewParser;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import freemarker.template.TemplateModelException;


@Component
@Scope("prototype")
public class GoodsPreviewTag extends BaseFreeMarkerTag {
	
	@Override
	protected Object exec(Map params) throws TemplateModelException {
		HttpServletRequest request  = ThreadContextHolder.getHttpRequest();
		HttpCopyWrapper newrequest = new HttpCopyWrapper(request); 
		
		String goodsUrl = "/goods-"+request.getParameter("goodsId")+".html";
		
		newrequest.setServletPath(goodsUrl);
		ThreadContextHolder.setHttpRequest(newrequest);
		
		GoodsPreviewParser parser = new GoodsPreviewParser();
		parser.parse(goodsUrl);
		return null;
	}

}
