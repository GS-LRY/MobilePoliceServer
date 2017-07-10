<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tlkj.model.User,tlkj.util.MD5Util"%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	Integer userId = currentUser.getId();
	String strpassword =MD5Util.convertMD5(currentUser.getPassword());
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="resource/special/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="resource/special.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="libs/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="resource/special.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="resource/special.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>修改密码</title>
</head>
<body>
	<article class="page-container">
		<form action="" method="post" class="form form-horizontal"
			id="form-member-change">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>请输入旧密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" value=""
						placeholder="" id="oldpassword" name="oldpassword">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>请输入新密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" value=""
						placeholder="" id="newpassword" name="newpassword">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>再输入新密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" value=""
						placeholder="" id="conformpassword" name="conformpassword">
				</div>
			</div>
			
			
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input id="submit-info" class="btn btn-primary radius"
						type="submit" value="&nbsp;&nbsp;确认提交&nbsp;&nbsp;"> 
				</div>
			</div>
		</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="libs/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="resource/special/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="resource/special.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="libs/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="libs/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="libs/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="libs/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="js/artDialog/jquery.artDialog.js?skin=aero"></script>
	<script type="text/javascript">
	$('.skin-minimal input').iCheck({
		checkboxClass : 'icheckbox-blue',
		radioClass : 'iradio-blue',
		increaseArea : '20%'
	});
	$("#oldpassword").change(function(){
		var oldpassword = $.trim($('#oldpassword').val());
		if(oldpassword==<%=strpassword%>){
			
		}else{
			art.dialog.alert('输入的旧密码不正确，请重新输入');
			 $("#oldpassword").attr("value","");
			 document.getElementById("oldpassword").focus();
		}
		
	});
	$("#form-member-change").validate({
			rules : {
						oldpassword : {
							required : true,
						},
						newpassword : {
							required : true,
							
						},
						conformpassword : {
							required : true,
							
						},
						
					},
					onkeyup : false,
					focusCleanup : true,
					success : "valid",
					submitHandler : function(form) {
						// 判断两次输入的密码是否一致
						var newpassword = $.trim($("#newpassword").val());
				        var conformpassword = $.trim($('#conformpassword').val());
				        
				        if (newpassword != conformpassword){
				        	art.dialog.alert('两次输入的密码不匹配');
				            document.getElementById("conformpassword").focus();
				            return;
				        }
				        
						var password = $.trim($('#conformpassword').val());
						var params = {
							"password" : conformpassword,
						};
						$(form).ajaxSubmit({
											async : false,
											type : 'POST',
											url : 'updateUserPassword.do',
											dataType : 'json',
											data : params,
											success : function(data) {
												//art.dialog.alert(data);
												if (data.result == "success") {
													art.dialog.alert('修改成功');
												} else {
													art.dialog.alert('修改失败');
												}
											},
											error : function(data,
													XMLHttpRequest,
													textStatus,
													errorThrown) {

												art.dialog
														.alert('服务器访问失败');
											},
										});
						  var index = parent.layer.getFrameIndex(window.name);
						  parent.layer.close(index);
					} 
				});
			
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>