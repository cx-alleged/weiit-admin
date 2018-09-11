package com.weiit.web.base;


import com.weiit.core.controller.BaseController;
import com.weiit.core.entity.FormMap;


/**
 * 后端视图控制器
 * 
 * @author 半个鼠标
 * @date：2017年2月4日 上午3:07:07
 * @version 1.0
 * @company http://www.wei-it.com
 */
public class AdminController extends BaseController {
	
	
	//重写BaseController的方法。在原有获取的参数集合里面，统一加上shop_id、app_id参数
	public FormMap getFormMap() {
		FormMap formMap=super.getFormMap();
		
		return formMap;
	}
	
	//重写BaseController的方法。在原有获取的参数集合里面，统一加上shop_id、app_id参数
	public FormMap getFormMap(boolean isCache) {
		FormMap formMap=super.getFormMap(isCache);
		
		return formMap;
	}
	
	
}
