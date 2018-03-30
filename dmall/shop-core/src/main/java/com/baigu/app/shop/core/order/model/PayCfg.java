package com.baigu.app.shop.core.order.model;

import com.baigu.framework.database.PrimaryKeyField;



/**
 * PayCfg generated by MyEclipse - Hibernate Tools
 */

public class PayCfg  implements java.io.Serializable {


    // Fields    

     protected Integer id;

	protected String name;

	protected String config;

	protected String biref;

	protected Double pay_fee;

	protected String type;
	
	//新增支付方式图片字段，xulipeng
	protected String pay_img;
	//是否是在线支付  1为是，0为不是
	protected Integer is_online;
	/**是否支持远路返回*/
	protected Integer is_retrace;  //0不支持 1 支持

	public String getBiref() {
		return biref;
	}

	public void setBiref(String biref) {
		this.biref = biref;
	}
	public String getConfig() {
		return config;
	}
	public void setConfig(String config) {
		this.config = config;
	}
	@PrimaryKeyField
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPay_fee() {
		return pay_fee;
	}
	public void setPay_fee(Double pay_fee) {
		this.pay_fee = pay_fee;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getPay_img() {
		return pay_img;
	}

	public void setPay_img(String pay_img) {
		this.pay_img = pay_img;
	}

	public Integer getIs_online() {
		return is_online;
	}

	public void setIs_online(Integer is_online) {
		this.is_online = is_online;
	}

	public Integer getIs_retrace() {
		return is_retrace;
	}

	public void setIs_retrace(Integer is_retrace) {
		this.is_retrace = is_retrace;
	}
	
	
}