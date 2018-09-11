package com.weiit.web.admin.user.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.weiit.core.entity.E;
import com.weiit.core.entity.FormMap;
import com.weiit.core.view.UIview;
import com.weiit.resource.common.utils.WeiitUtil;
import com.weiit.web.admin.user.service.UserService;
import com.weiit.web.base.AdminController;

/**
 * 后台管理-》会员模块 
 * @author 半个鼠标
 * @date：2017年8月15日 下午3:20:56
 * @version 1.0
 * @company http://www.wei-it.com
 */

@Controller
@RequestMapping("/user")
public class UserController extends AdminController {
	
	public static Logger logger = Logger.getLogger(UserController.class);
	
	@Resource
	private UserService userService;
	
	/**
	 * 会员管理》查询用户列表
	 */
	@RequestMapping("/userList")
	public UIview userList() {
		logger.info("进入UserController-user_list,会员列表展示");
		
		UIview result = UIView("/center/user/userList",false);
		FormMap formMap = getFormMap();
		// 开启分页
		PageHelper.startPage(formMap.getPage(), formMap.getRows());
		List userslist = userService.selectList(formMap);
		result.addObject("pageInfo", new PageInfo<E>(userslist));
		result.addObject("queryParam", formMap);
		return result;

	}

	/**
	 * 会员管理》刪除会员
	 */
	@RequestMapping("/remove")
	public UIview remove() {
		logger.info("进入UserController-remove,会员删除");
		
		UIview result = UIView("userList",true);
		FormMap formMap = getFormMap();
		//用户删除【事务】
		userService.removeTrans(formMap);
		
		result.addPNotifyMessage("删除成功");//提示信息，info级别 
		//result.addErrorMessage("删除失败");//提示信息，danger级别
		return result;
	}

	/**
	 * 会员管理》添加会员
	 */
	@RequestMapping("/save")
	public UIview save() {
		logger.info("进入UserController-save,添加会员");
		
		UIview result = UIView("userList",true);
		FormMap formMap = getFormMap();
		if (StringUtils.isEmpty(formMap.getStr("validate_id"))) {
			userService.insert(formMap);
		} else {
			userService.edit(formMap);
		}
		return result;
	}

	/**
	 * 会员管理》根据id查询会员
	 */

	@ResponseBody
	@RequestMapping("/view")
	public String view() {
		logger.info("进入UserController-view,根据id查询会员");
		
		FormMap formMap = getFormMap();
		E e = userService.selectOne(formMap);
		return toJsonAPI(e);
	}

	/**
	 * 会员管理》查询用户积分
	 */
	@RequestMapping("/userIntergral")
	public ModelAndView userIntergral() {
		logger.info("进入UserController-user_intergralList,会员积分查询");
		
		UIview result = UIView("/center/user/userIntergral",false);
		FormMap formMap = getFormMap();
		// 开启分页
		PageHelper.startPage(formMap.getPage(), formMap.getRows());
		List intergrallist = userService.selectUserIntergralList(formMap);
		result.addObject("pageInfo", new PageInfo<E>(intergrallist));
		result.addObject("queryParam", formMap);
		return result;
	}

	/**
	 * 会员管理》查询用户余额
	 */
	@RequestMapping("/userBalance")
	public ModelAndView userBalance() {
		logger.info("进入UserController-user_balanceList,会员余额展示");
		
		FormMap forMap = getFormMap();
		List balancelist = userService.selectbalanceList(forMap);
		UIview result = UIView("/center/user/userBalance",false);
		result.addObject("pageInfo", new PageInfo<E>(balancelist));
		result.addObject("queryParam", forMap);
		return result;
	}

	/**
	 *会员管理》查询会员地址
	 */
	@RequestMapping("/userAddress")
	public ModelAndView userAddress() {
		logger.info("进入UserController-useradressList,会员地址展示");
		
		UIview result = UIView("/center/user/userAdress",false);
		FormMap formMap = getFormMap();
		// 开启分页
		PageHelper.startPage(formMap.getPage(), formMap.getRows());
		List adresslist = userService.selectAdressList(formMap);
		result.addObject("pageInfo", new PageInfo<E>(adresslist));
		result.addObject("queryParam", formMap);
		return result;
	}

	/**
	 * 会员管理》批量删除会员
	 * */
	@RequestMapping(value="/removeBatch")
	public ModelAndView removeBatch(){
		logger.info("进入UserController-deleteBatch,批量删除会员");
		
		UIview result = UIView("userList",true);
		FormMap formMap=getFormMap();
		String[] validate_id=(String[])this.getRequest().getParameterValues("validate_id");
		String validate_ids=StringUtils.join(validate_id, ",");
		formMap.set("validate_ids", validate_ids);
		userService.removeBatch(formMap);
		
		result.addPNotifyMessage("批量删除成功");
		return result;
	} 

}