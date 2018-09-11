<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jsp" %>

			<!-- Main content -->
			<div class="content-wrapper">
				
				<!-- Page header -->
				<div class="page-header">
					<div class="breadcrumb-line">
						<ul class="breadcrumb">
							<li><a href="index.html"><i class="icon-home2 position-left"></i>系统管理</a></li>
							<li class="active">修改密码</li>
						</ul>

						
					</div>
					
				</div>
				<!-- /page header -->
				<!-- Edit modal -->
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h5 class="modal-title">修改密码</h5>
								</div>
	
								<div class="modal-body">
									<form class="form-horizontal" id="infoForm" name="infoForm" action="${pageContext.request.contextPath}/center/manager/passwordEdit" method="post">
											<fieldset class="content-group">   
												<div class="form-group"> 
													<label class="control-label col-md-2">原密码 </label> 
													<div class="col-md-9">
														<input type="password" class="form-control validate[required,maxSize[16]]" name="oldPassword" id="oldPassword" value="" placeholder="请输入旧密码" data-errormessage-value-missing="请输入旧密码" data-errormessage-range-overflow="密码最多支持16个字符">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-2">新密码 </label>
													<div class="col-md-9">
														<input type="password" class="form-control validate[required,maxSize[16]]" name="password" id="password" value="" placeholder="请输入新密码" data-errormessage-value-missing="请输入新密码" data-errormessage-range-overflow="密码最多支持16个字符">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-2">确认密码 </label>
													<div class="col-md-9">
														<input type="password"class="form-control validate[required,maxSize[16],funcCall[checkPassword]]" name="confirmPassword" id="confirmPassword" value="" placeholder="请再次输入新密码" data-errormessage-value-missing="请再次输入新密码" data-errormessage-range-overflow="密码最多支持16个字符" >
													</div>
												</div>
												
											</fieldset>
	
											<div class="text-right">
												<input type="hidden" name="validate_id" value="${sessionScope[sessionUserKey].validate_id }"/>
												<input type="hidden" name="validate_id_token" value="${sessionScope[sessionUserKey].validate_id_token }"/>
												<button type="reset" class="btn btn-default" id="reset">重置 <i class="icon-reload-alt position-right"></i></button>
												<button type="submit" class="btn btn-primary">提交 <i class="icon-arrow-right14 position-right"></i></button>
											</div>
										</form>
										
								</div>
								
							</div>
						</div>
				</div>
				<!-- /content area -->

<%@include file="common/footer.jsp" %>
<script type="text/javascript">
$(function(){
	if("${notifyMessage}"!=''){
	 new PNotify({title: '提示操作',text: '${notifyMessage}',addclass: 'bg-info'});
	}
	 }
);
</script>
<script>
$(document).ready(function() {
	/*默认监听表单onbulr验证*/
	$('#infoForm').validationEngine("attach",{ 
		promptPosition: 'bottomRight', 
		addPromptClass: 'blackPopup formError-small',
		scroll: true,
		showOneMessage: true
	}); 
	
	$("#commit").click(function(){
		if(!$('#infoForm').validationEngine("validate")){
			return false;
		}else{
			$("#infoForm").submit();
		}
		
	});
});

function checkPassword(){  
	var pwd1=$("#password").val();
	var pwd2=$("#confirmPassword").val();
	if(pwd1!=pwd2){
		 return "两次密码不一致";  
	}
}  
</script>