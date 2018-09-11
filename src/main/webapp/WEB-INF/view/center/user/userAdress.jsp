<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/header.jsp" %>
	
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
							<li class="active">会员地址</li>
						</ul>
			
						<ul class="breadcrumb-elements">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-file-excel position-left"></i> 导出 <span class="caret"></span></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="javascript:exportExcel('xlsx')"><i class="icon-file-excel"></i> Excel导出</a></li>
									<li><a href="javascript:exportExcel('csv')"><i class="icon-file-excel"></i> CSV导出</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-gear position-left"></i>显示字段 <span class="caret"></span></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column1"> ID</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column2">会员名</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column3">收件人</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column4"> 省</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column5"> 市</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column6"> 区县</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value=column7> 地址</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column8"> 手机</label></li>
								</ul>
							</li>
							
						</ul>
					</div>
			
				</div>
				<!-- /page header -->
				
				<!-- Content area -->
				<div class="content">
					<!-- Bordered striped table -->
					<div class="panel panel-flat">
							
							<div class="panel-body">
							<form class="form-horizontal form-validate-jquery" name="searchform" id="searchform" action="${pageContext.request.contextPath}/center/user/userAddress" method="post">
								<div class="col-md-3">
										<div class="input-group">
												<span class="input-group-addon">会员名称</span>
												<input type="text" class="form-control" placeholder="" name="user_name" value="${queryParam.user_name }">
										</div>
								</div>
								&nbsp;&nbsp;
								<button class="btn bg-blue" type="submit">搜索</button>
							<br>
							<br>
							<div class="table-responsive">
								<table id="data-table" class="table table-bordered table-striped table-xxs">
									<thead>
										<tr >

											<th class="column1">ID</th>
											<th class="column2">会员名</th>
											<th class="column3">收件人</th>
											<th class="column4">省</th>
											<th class="column5">市</th>
											<th class="column6">区县</th>
											<th class="column7">地址</th>
											<th>邮政编码</th>
											<th class="column8">手机</th>
											<th>创建时间</th>
										</tr>
									</thead>
									<tbody>
										
						           <c:forEach items="${pageInfo.list}" var="user">
									<tr> 
									    <td>${user.id }</td>
									    <td>${user.user_name }</td>
									    <td>${user.consignee }</td>
									    <td>${user.province }</td>
									    <td>${user.city }</td>
									    <td>${user.district }</td>
									    <td>${user.address_detail }</td>
									    <td>${user.zip_code }</td>
									    <td>${user.phone }</td>
										<td>${user.create_time }</td>				
									</tr>
									</c:forEach>
									</tbody>
								</table>
								
							</div>
							<div id="pager" class="panel-body">
					
							</div>
							</form>
							</div>
					</div>
					
					<!-- /bordered striped table -->

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

<%@include file="../common/footer.jsp" %>
<script>
$(document).ready(function() {
    $("#pager").pager({
        pagenumber: ${pageInfo.pageNum}, 
        pagecount: ${pageInfo.pages},
        pagesize: ${pageInfo.pageSize} ,
        pagerecordSize: ${pageInfo.total},
        buttonClickCallback: searchSubmit });
});


//excel导出
function exportExcel(fileType){
	var exportClassName="com.weiit.web.admin.user.service.UserService";
	var	exportMethodName="selectAdressList";
	var	exportExcelName="会员收货地址列表";
	var	exportTitles="ID,会员名,收件人,省,市,区县,详细地址";
	var	exportFields="id,user_name,consignee,province,city,district,address_detail";	
	commonExportList("searchform",exportClassName,exportMethodName,exportExcelName,exportTitles,exportFields,fileType);
}
</script>