package com.baigu.app.base.core.tag;

import java.util.Map;

import com.baigu.framework.component.IComponentManager;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.baigu.framework.component.ComponentView;

import freemarker.template.TemplateModelException;

/**
 * 检测组件是否启用
 * @author fenlongli
 * @date 2015-7-22 上午11:34:39
 */
@Component
public class CheckCmptIsOnTag extends BaseFreeMarkerTag {
	@Autowired
	private IComponentManager componentManager;

	@Override
	protected Object exec(Map params) throws TemplateModelException {
		//获取组件视图 判断是否存在、是否启用
		String componentName = params.get("componentName").toString();
		ComponentView componentView= componentManager.getCmptView(componentName);
		if(componentView==null||componentView.getEnable_state()!=1){
			return "OFF";
		}
		return "ON";
	}
	
}
