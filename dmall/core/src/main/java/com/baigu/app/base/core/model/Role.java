package com.baigu.app.base.core.model;

import com.baigu.framework.database.PrimaryKeyField;
import com.baigu.framework.database.NotDbField;

/**
 * 角色实体
 * 
 * @author kingapex 2010-10-24下午12:40:40
 */
public class Role {
	private Integer roleid;
	private String rolename;
	private String rolememo;
	private int[] actids; // 此角色权限id数组

	@PrimaryKeyField
	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getRolememo() {
		return rolememo;
	}

	public void setRolememo(String rolememo) {
		this.rolememo = rolememo;
	}

	@NotDbField
	public int[] getActids() {
		return actids;
	}

	public void setActids(int[] actids) {
		this.actids = actids;
	}

}