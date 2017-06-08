<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="libs/html5shiv.js"></script>
<script type="text/javascript" src="libs/respond.min.js"></script>
<![endif]-->
<link href="resource/special/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="resource/special.admin/css/H-ui.login.css" rel="stylesheet"
	type="text/css" />
<link href="resource/special.admin/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="libs/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="libs/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录系统</title>
<script type="text/javascript" src="libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="resource/special/js/H-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/artDialog/jquery.artDialog.js?skin=aero"></script>
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>

	<div class="loginWraper">
		<div class="jinhui"></div>
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" method="post" onsubmit="return false;">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input name="username" id="username" type="text" placeholder="账户"
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input name="password" id="password" type="password"
							placeholder="密码" class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input class="input-text size-L" type="text" placeholder="验证码"
							onblur="if(this.value==''){this.value='验证码:'}"
							onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:"
							style="width: 150px;"> <img src=""> <a id="kanbuq"
							href="javascript:;">看不清，换一张</a>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online"> <input type="checkbox" name="online"
							id="online" value=""> 使我保持登录状态
						</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input id="addbtn" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> 
						<input id="reset" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer">版权所有2017 上海图丽信息技术有限公司</div>


	<script type="text/javascript">
		$('#addbtn').live('click', function() {
			var username = $.trim($('#username').val());
			var password = $.trim($('#password').val());
			if (username == '') {
				art.dialog.alert('请输入用户名称');
				return false;
			}
			if (password == '') {
				art.dialog.alert('请输入用户密码');
				return false;
			}
			var params = {
					"username" : username,
					"password" : password,
				};
			$.ajax({
				type:'POST',
				url:'login.do',
				dataType:'json',
				data:params,
				success:function(data) {
					if (data.result == "success") {
						window.location.href = "index.jsp";
					} else {
						if(data.result == "nouser"){
							art.dialog.alert('没有该用户');
						}else{
							art.dialog.alert('密码错误');
						}
					}
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					alert("服务器访问失败");
				}
			});

		});
		$(function(){
			$('#reset').click(function(){
				$('#username').val('');
				$('#password').val('');
			});
		})
	</script>

</body>
</html>