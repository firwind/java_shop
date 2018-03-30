package com.baigu.app.shop.core.other.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baigu.app.shop.core.other.model.ActivityDetail;
import com.baigu.app.shop.core.other.model.SecondHalfActivityDetail;
import com.baigu.app.shop.core.other.model.SingleReductionActivityDetail;
import com.baigu.app.shop.core.other.service.IActivityDetailManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enation.framework.database.IDaoSupport;
import com.enation.framework.util.StringUtil;

/**
 * 促销活动优惠详细管理接口实现类
 * 2016-5-27
 * @author DMRain
 * @version 1.0
 */
@Service("activityDetailManager")
public class ActivityDetailManager implements IActivityDetailManager {

	@Autowired
	private IDaoSupport daoSupport;
	
	/* (non-Javadoc)
	 * @see IActivityDetailManager#add(ActivityDetail)
	 */
	@Override
	public void add(ActivityDetail detail) {
		this.daoSupport.insert("es_activity_detail", detail);
		
	}
	
	/* (non-Javadoc)
	 * @see IActivityDetailManager#edit(ActivityDetail)
	 */
	@Override
	public void edit(ActivityDetail detail) {
		this.daoSupport.update("es_activity_detail", detail, "detail_id="+detail.getDetail_id());
		
	}

	/* (non-Javadoc)
	 * @see IActivityDetailManager#get(java.lang.Integer)
	 */
	@Override
	public ActivityDetail get(Integer detail_id) {
		String sql = "select * from es_activity_detail where detail_id = ?";
		return this.daoSupport.queryForObject(sql, ActivityDetail.class, detail_id);
	}

	/* (non-Javadoc)
	 * @see IActivityDetailManager#getDetail(java.lang.Integer)
	 */
	@Override
	public ActivityDetail getDetail(Integer activity_id) {
		String sql = "select * from es_activity_detail where activity_id = ?";
		return this.daoSupport.queryForObject(sql, ActivityDetail.class, activity_id);
	}
	
	/* (non-Javadoc)
	 * @see IActivityDetailManager#listDetail(java.lang.Integer)
	 */
	@Override
	public List listDetail(Integer activity_id) {
		String sql = "select * from es_activity_detail where activity_id = ?";
		List list = this.daoSupport.queryForList(sql, activity_id);
		return list;
	}
	/*
	 * (non-Javadoc)
	 * @see IActivityDetailManager#listActivityDetail(java.lang.Integer)
	 */
	@Override
	public List listActivityDetail(Integer activity_id) {
		String sql = "select * from es_activity_detail where activity_id = ?";
		List list = this.daoSupport.queryForList(sql, activity_id);
		Map detailMap=(Map)list.get(0);
		Integer bonus_id = StringUtil.toInt(detailMap.get("bonus_id").toString());
		sql = "select * from es_bonus_type where type_id = ? and create_num > received_num ";
		List bounsList = this.daoSupport.queryForList(sql, bonus_id);
		if(bounsList.size()==0){
			detailMap.put("is_show_bonus", 0);
		}else {
			detailMap.put("is_show_bonus", 1);
		}
		List detailList=new ArrayList();
		detailList.add(detailMap);
		return detailList;
	}
	/*
	 * (non-Javadoc)
	 * @see IActivityDetailManager#add(SingleReductionActivityDetail)
	 */
	@Override
	public void add(SingleReductionActivityDetail detail) {
		this.daoSupport.insert("es_single_reduction_activity_detail", detail);
	}
	/*
	 * (non-Javadoc)
	 * @see IActivityDetailManager#add(SecondHalfActivityDetail)
	 */
	@Override
	public void add(SecondHalfActivityDetail detail) {
		this.daoSupport.insert("es_second_half_activity_detail", detail);
	}
	/*
	 * (non-Javadoc)
	 * @see IActivityDetailManager#edit(SingleReductionActivityDetail)
	 */
	@Override
	public void edit(SingleReductionActivityDetail detail) {
		this.daoSupport.update("es_single_reduction_activity_detail", detail, "detail_id="+detail.getDetail_id());
		
	}
	/*
	 * (non-Javadoc)
	 * @see IActivityDetailManager#edit(SecondHalfActivityDetail)
	 */
	@Override
	public void edit(SecondHalfActivityDetail detail) {
		this.daoSupport.update("es_second_half_activity_detail", detail, "detail_id="+detail.getDetail_id());
		
	}

	@Override
	public List listSingleReductionDetail(Integer activity_id) {
		String sql = "select * from es_single_reduction_activity_detail where activity_id = ?";
		List list = this.daoSupport.queryForList(sql, activity_id);
		return list;
	}

	@Override
	public List listSecondHalfDetail(Integer activity_id) {
		String sql = "select * from es_second_half_activity_detail where activity_id = ?";
		List list = this.daoSupport.queryForList(sql, activity_id);
		return list;
	}
	

}
