package com.weiit.web.admin.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.weiit.core.entity.FormMap;
import com.weiit.core.mapper.BaseMapper;
import com.weiit.core.service.impl.AbstractService;
import com.weiit.web.admin.user.mapper.UserMapper;
import com.weiit.web.admin.user.service.UserService;

/**
 * 会员模块接口实现接口
 * @author 半个鼠标
 * @date 2017年8月15日 下午3:23:04
 * @version 1.0
 * @company http://www.wei-it.com
 */
@Service
@Transactional(readOnly=false)
public class UserServiceImpl extends AbstractService implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public BaseMapper setMapper() {
		return userMapper;
	}

	/**
	 * 查询会员积分
	 */
	@Override
	public List selectUserIntergralList(FormMap formMap) {
		return userMapper.selectUserIntergralList(formMap);
	}

	/**
	 * 查询会员余额
	 */
	@Override
	public List selectbalanceList(FormMap forMap) {
		return userMapper.selectbalanceList(forMap);
	}

	/**
	 * 查询会员地址
	 */
	@Override
	public List selectAdressList(FormMap formMap) {
		return userMapper.selectAdressList(formMap);
	}

	/**
	 * 会员删除 (事务管理) 1、删除积分记录。2、删除余额记录。3、删除收货地址。4、删除会员信息
	 */
	@Override
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)//事务可写，记住方法中不能捕获异常，捕获异常不会回滚事务，trycatch也不能用
	public void removeTrans(FormMap formMap) {
		//1、先删除积分记录
		userMapper.removeIntegralLog(formMap);
		//2、删除余额记录
		userMapper.removeBalanceLog(formMap);
		//3、删除会员收货地址
		userMapper.removeAddress(formMap);
		//4、删除会员
		userMapper.remove(formMap);
	}
	
	
}
