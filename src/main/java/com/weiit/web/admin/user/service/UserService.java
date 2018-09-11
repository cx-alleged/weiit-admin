package com.weiit.web.admin.user.service;

import java.util.List;

import com.weiit.core.entity.FormMap;
import com.weiit.core.service.BaseService;

/**
 * 用户模块接口
 * @author 半个鼠标
 * @date 2017年8月15日 上午11:55:25
 * @version 1.0
 * @company http://www.wei-it.com 
 */
public interface UserService extends BaseService{

	List selectUserIntergralList(FormMap formMap);

	List selectbalanceList(FormMap forMap);
	
	List selectAdressList(FormMap formMap);
	
	void removeTrans(FormMap formMap);
}
