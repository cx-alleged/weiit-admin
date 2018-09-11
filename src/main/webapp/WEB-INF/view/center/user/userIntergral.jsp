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
							<li class="active">会员积分</li>
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
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column1">ID</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column2">会员名</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column3">说明</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column4">积分</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column5">状态</label></li>
									<li class="checkbox"><label><input type="checkbox" class="styled" checked="checked" value="column6">时间</label></li>
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
							<form class="form-horizontal" name="searchform" id="searchform" action="${pageContext.request.contextPath}/center/user/userIntergral" method="post">
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
											<th class="column3">说明</th>
											<th class="column4">积分</th>
										    <th class="column5">状态</th>
											<th class="column6">时间</th>		
										</tr>
									</thead>
									<c:forEach items="${pageInfo.list}" var="user">
									<tr> 
								        <td>${user.id }</td>
									    <td>${user.user_name }</td>		
									    <td>${user.remark }</td>				
									    <td>${user.integral }</td>
									    <td>
						                  <c:if test="${user.state==0}">奖励</c:if>
						                  <c:if test="${user.state==-1}">消耗</c:if>
						                </td>
                    					<td><fmt:formatDate value="${user.update_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>
									</c:forEach>
								</table>	
							</div>
							<div id="pager" class="panel-body">
					
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
									<h5 class="modal-title">修改积分</h5>
								</div>
	
								<div class="modal-body">
									<form class="form-horizontal form-validate-jquery" action="${pageContext.request.contextPath}/center/user/save" method="post">
											<fieldset class="content-group">
												<div class="form-group">
													<label class="control-label col-md-2">会员名称 </label>
													<div class="col-md-9">
														<input type="text" class="form-control input-rounded" name="user_name" required="required" >
													</div>
												</div>
											
												<div class="form-group">
													<label class="control-label col-md-2">积分 </label>
													<div class="col-md-9">
														<input type="text" class="form-control input-rounded" name="integral" required="required" >
													</div>
												</div>
												
											
											</fieldset>
	
											<div class="text-right">
												<input type="hidden" name="user_id" value=""/>
												<button type="reset" class="btn btn-default" id="reset">重置 <i class="icon-reload-alt position-right"></i></button>
												<button type="submit" class="btn btn-primary">提交 <i class="icon-arrow-right14 position-right"></i></button>
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

function WIedit(id){
	$("#edit_modal").find(".modal-title").html("编辑会员积分");
	$.ajax({
	    url:'${pageContext.request.contextPath}/center/user/view?user_id='+id,
	    type:'GET', 
	    data:null,
	    dataType:'json',
	    success:function(result){
	        var result=result.data;
	        $("input[name='user_id']").attr("value",id);
	        $("input[name='user_name']").attr("value",result.user_name);
	        $("input[name='integral']").attr("value",result.integral);
	        //初始化select
	        $.ajax({
			    url:'${pageContext.request.contextPath}/center/user/save',
			    type:'POST', 
			    data:{"user_id":id},
			    dataType:'json',
			    success:function(result){
			    	$.each(result,function(index,item){
			            $('.bootstrap-select').selectpicker('val', item.user_id);
			    	});
			    },
			    error:function(xhr,textStatus){
			        console.log('加载resource列表错误');
			    }
	        });
	    },
	    error:function(xhr,textStatus){
	        console.log('错误');
	    }
	});
}

//excel导出
function exportExcel(fileType){
	var exportClassName="com.weiit.web.admin.user.service.UserService";
	var	exportMethodName="selectUserIntergralList";
	var	exportExcelName="会员积分列表";
	var	exportTitles="ID,会员名,说明,积分,状态,修改时间";
	var	exportFields="id,user_name,remark,integral,state,update_time";	
	commonExportList("searchform",exportClassName,exportMethodName,exportExcelName,exportTitles,exportFields,fileType);
}

</script>