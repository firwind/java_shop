package com.baigu.app.base.core.action.api;

import com.baigu.app.base.core.service.dbsolution.DBSolutionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baigu.framework.util.JsonResultUtil;

@Controller
@RequestMapping("/core/admin/data")
public class DataApiController  {
	
	public Object export(String tb){
		
		try {
			String[] tables={tb};
			return DBSolutionFactory.dbExport(tables, false, "");
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResultUtil.getErrorJson("导出失败");
		}
	}
	
}
