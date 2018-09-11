package com.weiit.web.admin.user.mapper;

import java.util.List;

import com.weiit.core.entity.FormMap;
import com.weiit.core.mapper.BaseMapper;

/**
 * 用户中心 mapper
 * @author 半个鼠标
 * @date 2017年8月15日 下午3:20:16
 * @version 1.0
 * @company http://www.wei-it.com
 */

public interface UserMapper extends BaseMapper {
	
	 /**
     * 查询所有的会员积分信息
     * @param param 
     * @return 返回所有会员的积分信息
     */
	List selectUserIntergralList(FormMap formMap);

	 /**
     * 查询所有的会员余额信息
     * @param param 
     * @return 返回所有会员的余额信息
     */
	List selectbalanceList(FormMap forMap);

	 /**
     * 查询所有的会员地址信息
     * @param param 
     * @return 返回所有会员的地址信息
     */
	List selectAdressList(FormMap formMap);
	
	/**
     * 删除会员地址库
     * @param param 
     * @return 
     */
	int removeAddress(FormMap formMap);
	
	/**
     * 删除会员余额记录
     * @param param 
     * @return 
     */
	int removeBalanceLog(FormMap formMap);
	
	/**
     * 删除会员积分记录
     * @param param 
     * @return 
     */
	int removeIntegralLog(FormMap formMap);

}
