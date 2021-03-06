package com.baigu.app.shop.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.baigu.app.shop.core.member.model.MemberAddress;
import com.baigu.app.shop.core.member.service.IMemberAddressManager;
import com.baigu.framework.database.IDaoSupport;
import com.baigu.framework.test.SpringTestSupport;

/**
 * 促销活动送赠品
 * @author LYH
 * @version v1.0
 * @since v6.0
 * 2016年12月24日 下午2:42:03 
 */

public class ActivityNonGiftOrderTest extends SpringTestSupport{
	
	@Autowired
	private IDaoSupport daoSupport;
	
	@Autowired
	private IMemberAddressManager memberAddressManager;
	
	/**
	 * 登录后台，添加促销活动
	 * @throws
	 */
	@Test
	public void testActivity() throws Exception{
		
		
		//清空促销活动表、赠品表、促销活动详细表
		this.daoSupport.execute("TRUNCATE table es_activity");
		
		this.daoSupport.execute("TRUNCATE table es_activity_detail");
		
		this.daoSupport.execute("TRUNCATE table es_activity_gift");
		
		//后台登录
		this.adminlogin();
		
		//添加赠品
		mockMvc.perform(
				MockMvcRequestBuilders.post("/shop/admin/gift/save-add.do")
				.param("actual_store", "1")
				.param("gift_img", "http://localhost:8080/b2c/statics/attachment//gift/2016/11/29/17//11113497.jpg")
				.param("gift_name", "测试新增赠品")
				.param("gift_price", "100.00")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				
				)
				.andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1));
		
		//添加满设置金额送赠品促销活动
		mockMvc.perform(MockMvcRequestBuilders.post("/shop/admin/activity/save-add.do")
				.param("activity_name", "送赠品促销活动")
				.param("activity_type", "1")
				.param("bonus_id", "0")
				.param("description","测试送赠品促销活动")
				.param("endTime", "2017-12-30 09:59:05")
				.param("full_money","40.00")
				.param("gift_id", "1")
				.param("goods_ids", "272")
				.param("is_send_gift","1")
				.param("range_type", "2")
				.param("startTime", "2016-11-30 09:59:03")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				)
				.andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1));
		//会员登录
		this.memberlogin();
		MemberAddress addr = this.memberAddressManager.getMemberDefault(1);
		
		//--------------第一次创建订单，订单中有赠品----------------------
		
		//将商品加入购物车
		mockMvc.perform(
				MockMvcRequestBuilders.post("/api/shop/cart/add-goods.do")
				.param("action", "add-goods")
				.param("activity_id","1")
				.param("goodsid","272")
				.param("num", "1")
				.param("showCartData", "0")	
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				)
				.andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1));
	
	
		//创建订单
		MvcResult result = mockMvc.perform(
				MockMvcRequestBuilders.post("/api/shop/order/create.do")
				 .param("activity_id", "1")
				 .param("addressId",""+ addr.getAddr_id())
				 .param("city", "海淀区")
				 .param("city_id", "35")
				 .param("gift_id", "1")  //赠品的id
				 .param("needPay", "55")
				 .param("paymentId", "0")
				 .param("province", "北京")
				 .param("province_id", "1")
				 .param("receipt", "2")
				 .param("receiptContent", "办公用品")
				 .param("receiptType", "1")
				 .param("region", "海淀区")
				 .param("region_id", "453")
				 .param("shipAddr", "test")
				 .param("shipDay", "任意时间")
				 .param("shipDay", "任意日期")
				 .param("shipMobile", "15373167766")
				 .param("shipName", "test")
				 .param("shipZip", "100093")
				 .param("typeId", "1")
				 .session(session)
				 .contentType(MediaType.APPLICATION_JSON)
				 .accept(MediaType.APPLICATION_JSON)
				 )
				 .andDo(MockMvcResultHandlers.print())
				 
				 //返回正确结果
				.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1))
		
				//订单价格55,
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.order_amount").value(55.0))
			
				//商品价格为45,
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.goods_amount").value(45.0))
				
				//运费是10,
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.shipping_amount").value(10.0))
				
				//订单状态为0
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.status").value(0))
				
				.andReturn();
		//--------------第二次创建订单，订单中没有赠品----------------------

		//将商品加入购物车
		mockMvc.perform(
				MockMvcRequestBuilders.post("/api/shop/cart/add-goods.do")
				.param("action", "add-goods")
				.param("activity_id","1")
				.param("goodsid","272")
				.param("num", "1")
				.param("showCartData", "0")	
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.accept(MediaType.APPLICATION_JSON)
				)
				.andDo(MockMvcResultHandlers.print())
				.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1));
	
	
		//创建订单，没有赠品
	    mockMvc.perform(
				MockMvcRequestBuilders.post("/api/shop/order/create.do")
				 .param("activity_id", "1")
				 .param("addressId",""+ addr.getAddr_id())
				 .param("city", "海淀区")
				 .param("city_id", "35")
				 .param("needPay", "55")
				 .param("paymentId", "0")
				 .param("province", "北京")
				 .param("province_id", "1")
				 .param("receipt", "2")
				 .param("receiptContent", "办公用品")
				 .param("receiptType", "1")
				 .param("region", "海淀区")
				 .param("region_id", "453")
				 .param("shipAddr", "test")
				 .param("shipDay", "任意时间")
				 .param("shipDay", "任意日期")
				 .param("shipMobile", "15373167766")
				 .param("shipName", "test")
				 .param("shipZip", "100093")
				 .param("typeId", "1")
				 .session(session)
				 .contentType(MediaType.APPLICATION_JSON)
				 .accept(MediaType.APPLICATION_JSON)
				 )
				 .andDo(MockMvcResultHandlers.print())
				 
				 //返回正确结果
				.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1))
		
				//订单价格55,
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.order_amount").value(55.0))
			
				//商品价格为45,
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.goods_amount").value(45.0))
				
				//运费是10,
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.shipping_amount").value(10.0))
				
				//订单状态为0
				.andExpect(MockMvcResultMatchers.jsonPath("$.data.order.status").value(0))
				
				.andReturn();
	}

	/*
    *公用的会员登陆方法 
    *@throws Exception
    */
	private void memberlogin() throws Exception{

			//--------------登录----------------------
			//执行验证码请求		
			mockMvc.perform(MockMvcRequestBuilders.get("/api/validcode/create.do?vtype=memberlogin"));
				
			//登陆api测试
			mockMvc.perform(
					 MockMvcRequestBuilders.post("/api/shop/member/login.do")
					 .param("username", "kingapex")
					 .param("password", "wangfeng")
					 .param("validcode", "1111")
					 .contentType(MediaType.APPLICATION_JSON)
					 .accept(MediaType.APPLICATION_JSON)
					
					 )
				 	.andDo(MockMvcResultHandlers.print())  
				 	.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1) );  
			
			//为会员添加一个默认地址
			mockMvc.perform(
					 MockMvcRequestBuilders.post("/api/shop/member-address/add.do")
					 .param("addr", "测试地址")
					 .param("city", "海淀区")
					 .param("city_id", "35")
					 .param("def_addr", "1")
					 .param("mobile", "15373167788")
					 .param("name", "王峰")
					 .param("province", "北京")
					 .param("province_id", "1")
					 .param("region", "海淀区")
					 .param("region_id", "453")
					 .param("shipAddressName", "家里")
					 .param("zip", "100093")
					 .contentType(MediaType.APPLICATION_JSON)
					 .accept(MediaType.APPLICATION_JSON)
					
					 )
				 	.andDo(MockMvcResultHandlers.print())  
				 	.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1) );  
					
		}
		   
   /*
    *公用的后台登陆方法 
    *@throws Exception
    */
	
	private void adminlogin() throws Exception{

		//执行验证码请求		
		mockMvc.perform(MockMvcRequestBuilders.get("/api/validcode/create.do?vtype=admin"));
		
		//管理员登陆api测试
		mockMvc.perform(
				 MockMvcRequestBuilders.post("/core/admin/admin-user/login.do")
				 .param("username", "admin")
				 .param("password", "admin")
				 .param("valid_code", "1111")
				 .contentType(MediaType.APPLICATION_JSON)
				 .accept(MediaType.APPLICATION_JSON)
				
				 )
			 	.andDo(MockMvcResultHandlers.print())  
			 	.andExpect(MockMvcResultMatchers.jsonPath("$.result").value(1) );  
	}
}
