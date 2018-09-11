<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/header.jsp"%>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Page header -->
	<div class="page-header">
		<div class="page-header-content">
			<div class="page-title">
				<h4>
					<i class="icon-arrow-left52 position-left"></i> <span
						class="text-semibold"> 会员管理 </span>
				</h4>
			</div>
		</div>
		<div class="breadcrumb-line">
			<ul class="breadcrumb">
				<li><a href="index.html"><i class="icon-home2 position-left"></i>会员中心</a></li>
				<li class="active">会员列表</li>
			</ul>

			<ul class="breadcrumb-elements">
				<weiit:hasPermission name="userList:export">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-file-excel position-left"></i> 导出 <span class="caret"></span></a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="javascript:exportExcel('xlsx')"><i class="icon-file-excel"></i> Excel导出</a></li>
						<li><a href="javascript:exportExcel('csv')"><i class="icon-file-excel"></i> CSV导出</a></li>
					</ul>
				</li>
				</weiit:hasPermission>
				
				<weiit:hasPermission name="userList:showColumns">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-gear position-left"></i>显示字段 <span class="caret"></span></a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_id"> ID</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_account">账户</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_password"> 密码</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_name"> 用户名</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_phone"> 手机</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_integral"> 积分</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_balance"> 余额</label></li>
						<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="user_column_user_create_time"> 注册时间</label></li>
					</ul>
				</li>
				</weiit:hasPermission>
				
				<weiit:hasPermission name="userList:insert">
				<li>
					<button type="button" class="btn btn-info" style="border-radius: 0;" onclick='WIADD()' data-toggle='modal' data-target='#edit_modal'>
						<i class="icon-add position-left"></i>添加会员
					</button>
				</li>
				</weiit:hasPermission>
			</ul>
		</div>

	</div>
	<!-- /page header -->

	<!-- Content area -->
	<div class="content">
		<!-- Bordered striped table -->
		<div class="panel panel-flat">

			<div class="panel-body">
				<form class="form-horizontal" name="searchform" id="searchform" action="${pageContext.request.contextPath}/center/user/userList" method="post">
					<div style="margin-left: -10px;">
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">会员名称</span> <input type="text" class="form-control" placeholder="" name="user_name" value="${queryParam.user_name }">
							</div>
						</div>
					</div>
					&nbsp;&nbsp;
					<button class="btn bg-blue" type="submit">搜索</button>
					<br> <br>
					<div class="table-responsive">
						<table id="data-table"
							class="table table-bordered table-striped table-xxs">
							<thead>
								<tr>
									<th><input type="checkbox" name="selectAll" onclick="allCheckClick(this)" value="0" /></th>
									<th class="user_column_user_id">ID</th>
									<th class="user_column_user_account">账户</th>
									<th class="user_column_user_password">密码</th>
									<th class="user_column_user_name">用户名</th>
									<th class="user_column_user_phone">手机</th>
									<th class="user_column_user_id">用户地址</th>
									<th class="user_column_user_integral" >积分</th>
									<th class="user_column_user_balance">余额</th>
									<th class="user_column_user_create_time">注册时间</th>
									<th width="100">操作</th>
								</tr>
							</thead>
							<c:forEach items="${pageInfo.list}" var="user">
								<tr>
									<td><input type="checkbox" name="ids" value="${user.user_id }|${user.validate_id_token}"></td>
									<td>${user.user_id }</td>
									<td>${user.user_account }</td>
									<td>${user.user_password }</td>
									<td>${user.user_name }</td>
									<td>${user.user_phone }</td>
									<td>
										<a href="${pageContext.request.contextPath}/center/user/userAddress?user_id=${user.user_id}" data-toggle="modal">查看地址</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/center/user/userIntergral?user_id=${user.user_id}" data-toggle="modal">${user.integral}</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/center/user/userBalance?user_id=${user.user_id}"  data-toggle="modal">${user.balance}</a>
									</td>
									<td>${user.create_time }</td>
									<td>
										<ul class="icons-list">
											<weiit:hasPermission name="userList:edit">	
											<li>
												<a href="#" onclick="WIedit('${user.validate_id}','${user.validate_id_token }')" data-toggle="modal" data-target="#edit_modal" title="编辑"><i class="icon-pencil7"></i></a>
											</li>
											</weiit:hasPermission>
											
											<weiit:hasPermission name="userList:delete">	
											<li>
												<a href="#" onclick="WIremove('${user.validate_id }','${user.validate_id_token }')" data-toggle="modal" data-target="#remove_modal" title="删除"><i	class="icon-trash"></i></a>
											</li>
											</weiit:hasPermission>
										</ul>
									</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<br><br>
					<div id="pager" class="panel-body">
					
						<weiit:hasPermission name="userList:deleteBatch">	
							<div style="margin-left: -20px; margin-bottom: 20px;">
								<button type="button" class="btn btn-default">
									<input type="checkbox" name="selectAll" onclick="allCheckClick(this)" value="1" />&nbsp;全选/不选
								</button>
								<button type="button" onclick="BatchWIremove()" class="btn btn-default" data-toggle="modal" data-target="#remove_batch_modal">
									<i class="icon-trash"></i> 批量删除
								</button>
							</div>
						</weiit:hasPermission>	
					</div>
				</form>
			</div>
		</div>

		<!-- /bordered striped table -->

		<!-- Edit modal -->
		<div id="edit_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h5 class="modal-title">编辑角色</h5>
					</div>

					<div class="modal-body">
						<form class="form-horizontal form-validate-jquery" action="${pageContext.request.contextPath}/center/user/save" method="post" autocomplete="off">
							<fieldset class="content-group">
								<div class="form-group">
									<label class="control-label col-md-2">会员账号 </label>
									<div class="col-md-9">
										<input type="text" class="form-control input-rounded" name="user_account" required="required" autocomplete="off">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">会员密码 </label>
									<div class="col-md-9">
										<input type="password" class="form-control input-rounded" name="user_password" required="required" autocomplete="new-password">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">手机号码 </label>
									<div class="col-md-9">
										<input type="text" class="form-control input-rounded" name="user_phone" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">用户名 </label>
									<div class="col-md-9">
										<input type="text" class="form-control input-rounded" name="user_name" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">地址 </label>
									<div class="col-md-9">
										<input type="text" class="form-control input-rounded" name="region" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">积分 </label>
									<div class="col-md-9">
										<input type="text" class="form-control input-rounded" name="integral" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">余额 </label>
									<div class="col-md-9">
										<input type="text" class="form-control input-rounded" name="balance" required="required">
									</div>
								</div>

							</fieldset>

							<div class="text-right">
								<input type="hidden" name="validate_id_token" value="" />
								<input type="hidden" name="validate_id" value="" />
								<button type="reset" class="btn btn-default" id="reset">
									重置 <i class="icon-reload-alt position-right"></i>
								</button>
								<button type="submit" class="btn btn-primary">
									提交 <i class="icon-arrow-right14 position-right"></i>
								</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- /edit modal -->
	</div>
	<!-- /content area -->
</div>
<!-- /main content -->

<%@include file="../common/footer.jsp"%>

<script>
$(document).ready(function() {
    $("#pager").pager({
        pagenumber: ${pageInfo.pageNum}, 
        pagecount: ${pageInfo.pages},
        pagesize: ${pageInfo.pageSize} ,
        pagerecordSize: ${pageInfo.total},
        buttonClickCallback: searchSubmit });
});

//新增会员
function WIADD(){
	$("#edit_modal").find(".modal-title").html("添加会员");
	$("input[name='validate_id']").attr("value","");
	$("input[name='validate_id_token']").attr("value","");
    $("input[name='user_account']").attr("value","");
    $("input[name='user_password']").attr("value","");
    $("input[name='user_phone']").attr("value","");
    $("input[name='user_name']").attr("value","");
    $("input[name='region']").attr("value","");
    $("input[name='integral']").attr("value","");
    $("input[name='balance']").attr("value","");
}
//编辑会员信息
function WIedit(validate_id,validate_id_token){
	$("#edit_modal").find(".modal-title").html("编辑会员");
	$.ajax({
	    url:'${pageContext.request.contextPath}/center/user/view?validate_id='+validate_id+"&validate_id_token="+validate_id_token,
	    type:'GET', 
	    data:null,
	    dataType:'json',
	    success:function(result){
	        var result=result.data;
	        $("input[name='validate_id']").attr("value",validate_id);
	        $("input[name='validate_id_token']").attr("value",validate_id_token);
	      	$("input[name='user_account']").attr("value",result.user_account);
	        $("input[name='user_password']").attr("value",result.user_password);
	        $("input[name='user_phone']").attr("value",result.user_phone);
	        $("input[name='user_name']").attr("value",result.user_name);
	        $("input[name='region']").attr("value",result.region);
	        $("input[name='integral']").attr("value",result.integral);
	        $("input[name='balance']").attr("value",result.balance);
	    },
	    error:function(xhr,textStatus){
	        console.log('错误');
	    }
	});
}
  
 //根据id来删除单条数据
function WIremove(validate_id,validate_id_token){
	var url="${pageContext.request.contextPath}/center/user/remove?validate_id="+validate_id+"&validate_id_token="+validate_id_token;
	Mremove("get",url);
 }
 //批量删除
function BatchWIremove(){
	MremoveBath("input[name='ids']","${pageContext.request.contextPath}/center/user/removeBatch");
}
//excel导出
function exportExcel(fileType){
	var exportClassName="com.weiit.web.admin.user.service.UserService";
	var	exportMethodName="selectList";
	var	exportExcelName="会员列表";
	var	exportTitles="用户账号,用户密码,用户名,用户积分,用户余额,用户手机,地区";
	var	exportFields="user_account,user_password,user_name,integral,balance,user_phone,region";	
	commonExportList("searchform",exportClassName,exportMethodName,exportExcelName,exportTitles,exportFields,fileType);
}
</script>