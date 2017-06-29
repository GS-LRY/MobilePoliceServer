<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>添加警员</title>
</head>
<body>
	<article class="page-container">
		<form action="" method="post" class="form form-horizontal"
			id="form-member-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>警号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="policeNum" name="policeNum">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="username" name="username">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>用户类型：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select class="select error"
						aria-required="true" aria-invalid="true" id="userType"
						name="userType">
							<option value selected>请选择用户类型</option>
							<option value="0">普通用户</option>
							<option value="1">管理员</option>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>职务：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="job" name="job">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>身份证号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="idCard" name="idCard">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>联系电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="phone"
						id="phone">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>电子邮箱：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="email"
						id="email">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>所属一级单位：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select class="select error"
						aria-required="true" aria-invalid="true" id="t_department1"
						name="t_department1"><option value selected>请选择一级单位</option></select></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>所属二级单位：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select class="select error"
						aria-required="true" aria-invalid="true" id="t_department2"
						name="t_department2"><option value selected>请选择二级单位</option></select></span>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});
			var departments = [];
			var mydepartmentId;
			var getDepartment = function(departmentId) {
				var res;
				for (var i = 0; i < departments.length; i++) 
				{
					if (Number(departmentId) === departments[i].id) 
					{
						res = departments[i];
						break;
					}
				}
				return res;
			};
			$(document).ready(function() {
				$.ajax({
					type:'GET',
					url:'getAllDepartment.do',
					dataType:'json',
					success:function(data) {
						departments = eval(data.departments);
						//alert(departments.length);
						initDepartmentSelect();
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert("服务器访问失败");
					}
				});
			});
			
			var initDepartment2Select = function() {
				$("#t_department2").html("");
				$("#t_department2").append(
						"<option value selected>---请选择---</option>");
				if(Number($("#t_department1").val())===1){
					$("#t_department2").append(
							"<option value='"
									+ Number($("#t_department1").val())
									+ "'>"
									+ getDepartment(Number($("#t_department1")
											.val())).name + "</option>");
				}else{
					$("#t_department2").append(
							"<option value='"
									+ Number($("#t_department1").val())
									+ "'>"
									+ getDepartment(Number($("#t_department1")
											.val())).name + "</option>");
					for (var i = 0; i < departments.length; i++) {
						if (Number(departments[i].parentid) === Number($("#t_department1").val())) {
							$("#t_department2").append(
									"<option value='"+departments[i].id+"'>"
											+ departments[i].name + "</option>");
						}
					}
				}
			};

			var initDepartmentSelect = function() {
				for (var i = 0; i < departments.length; i++) {
					if (departments[i].parentid == 1) {
						$("#t_department1").append(
								"<option value='"+departments[i].id+"'>"
										+ departments[i].name + "</option>");
					}
				}
				$("#t_department1").change(function() {
					initDepartment2Select();
				});
			};
			$("#form-member-add")
					.validate(
							{
								rules : {
									policeNum : {
										required : true,
									},
									username : {
										required : true,
									},
									idCard : {
										required : true,
										isIdCardNo : true,
									},
									userType : {
										required : true,
									},
									job : {
										required : true,
									},
									phone : {
										required : true,
									},
									email : {
										email : true,

									},
									t_department1 : {
										required : true,
									},
									t_department2 : {
										required : true,
									},
									t_department3 : {
										required : true,
									},
								},
								onkeyup : false,
								focusCleanup : true,
								success : "valid",
								submitHandler : function(form) {
									var policeNum = $.trim($('#policeNum')
											.val());
									var username = $.trim($('#username').val());
									var idCard = $.trim($('#idCard').val());
									var job = $.trim($('#job').val());
									var phone = $.trim($('#phone').val());
									var email = $.trim($('#email').val());
									var userType = $.trim($(
											'#userType option:selected').val());
									var t_department1 = $.trim($(
											'#t_department1 option:selected')
											.val());
									var t_department2 = $.trim($(
											'#t_department2 option:selected')
											.val());
									var params = {
										"policeNum" : policeNum,
										"username" : username,
										"idCard" : idCard,
										"job" : job,
										"phone" : phone,
										"email" : email,
										"userType" : userType,
										"departmentId" : t_department2,
									};
									$(form)
											.ajaxSubmit(
													{
														async : false,
														type : 'POST',
														url : 'addUser.do',
														dataType : 'json',
														data : params,
														success : function(data) {
															//art.dialog.alert(data);
															if (data.result == "success") {
																art.dialog
																		.alert('添加成功');
															} else {
																if (data.result == "userexits_policenum") {
																	art.dialog
																			.alert('警员号已被注册！');
																} else {
																	if(data.result == "userexits_idcard"){
																		art.dialog
																		.alert('身份证号已被注册！');
																	}else{
																		art.dialog
																		.alert('添加失败');
																	}
																}
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
									var index = parent.layer
											.getFrameIndex(window.name);
									//parent.$('.btn-refresh').click();
									parent.layer.close(index);
								}
							});
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>