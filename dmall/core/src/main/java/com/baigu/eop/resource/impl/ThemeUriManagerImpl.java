package com.baigu.eop.resource.impl;

import java.util.List;
import java.util.Map;

import com.baigu.eop.resource.IThemeUriManager;
import com.baigu.eop.resource.model.ThemeUri;
import com.baigu.framework.annotation.Log;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.log.LogType;
import com.baigu.framework.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *  theme uri 管理器
 * @author kingapex
 * @version v2.0
 * 2016年2月17日下午9:37:17
 * @since v6.0
 */
@SuppressWarnings("unchecked")
@Service("themeUriDbManager")
public class ThemeUriManagerImpl   implements IThemeUriManager {

	@Autowired
	private IDaoSupport daoSupport;
	
	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#clean()
	 */
	@Override
	@Log(type= LogType.SETTING,detail="清除uri映射信息")
	public void clean() {
		daoSupport.execute("truncate table es_themeuri");
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#get(java.lang.Integer)
	 */
	@Override
	public ThemeUri get(Integer id) {
		return daoSupport.queryForObject("select * from es_themeuri where id=?", ThemeUri.class, id);
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#edit(java.util.List)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	@Log(type=LogType.SETTING,detail="批量修改uri映射信息")
	public void edit(List<ThemeUri> uriList) {
		for (ThemeUri uri : uriList) {
			daoSupport.update("es_themeuri", uri, "id=" + uri.getId());
		}
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#list(java.util.Map)
	 */
	@Override
	public List<ThemeUri> list(Map map) {
		String sql = "select * from es_themeuri";
		if(map!=null){
			String keyword = (String) map.get("keyword");
			if(!StringUtil.isEmpty(keyword)){
				sql+=" where uri like '%"+keyword+"%'";
				sql+=" or path like '%"+keyword+"%'";
				sql+=" or pagename like '%"+keyword+"%'";
			}
		}
		return daoSupport.queryForList(sql, ThemeUri.class);
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#getPath(java.lang.String)
	 */
	@Override
	public ThemeUri getPath(String uri) {
		List<ThemeUri> list = list(null);

		for (ThemeUri themeUri : list) {
			if (themeUri.getUri().equals(uri)) {
				return themeUri;
			}
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#add(ThemeUri)
	 */
	@Override
	@Log(type=LogType.SETTING,detail="新增加了一个uri为${uri.uri}的映射")
	public void add(ThemeUri uri) {
		daoSupport.insert("es_themeuri", uri);
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#delete(int)
	 */
	@Override
	@Log(type=LogType.SETTING,detail="删除一个为${id}的映射")
	public void delete(int id) {
		daoSupport.execute("delete from es_themeuri where id=? ", id);
	}

	/*
	 * (non-Javadoc)
	 * @see IThemeUriManager#edit(ThemeUri)
	 */
	@Override
	@Log(type=LogType.SETTING,detail="修改了uri为${uri.uri}的映射信息")
	public void edit(ThemeUri themeUri) {
		daoSupport.update("es_themeuri", themeUri,
				"id=" + themeUri.getId());
	}

}
