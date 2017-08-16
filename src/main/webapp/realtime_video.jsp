<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tlkj.model.User"%>
<%
	if (session.getAttribute("currentUser") == null) {
%>
<h1>未登录！</h1>
3秒后跳转到登录页面
<p>
	如果没有跳转，请点<a href="login.jsp">这里</a>
</p>
<%
	response.setHeader("refresh", "3;URL=login.jsp");
		return;
	}
%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	Integer userType = currentUser.getUsertype();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<link rel="stylesheet" href="css/plugins/plyr/plyr.css">
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<title>实时视频监控</title>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-8">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>视频直播</h5>
						<div class="ibox-tools">
							
							
							
						</div>
					</div>
					<div class="ibox-content">
						<div class="player">
							<video poster="img/test/video4.jpg" controls crossorigin>
								<!-- Video files -->
								<source src="https://cdn.selz.com/plyr/1.0/movie.mp4"
									type="video/mp4">
								<source src="https://cdn.selz.com/plyr/1.0/movie.webm"
									type="video/webm">

								<!-- Text track file -->
								<track kind="captions" label="English" srclang="en"
									src="https://cdn.selz.com/plyr/1.0/example_captions_en.vtt"
									default> <!-- Fallback for browsers that don't support the <video> element -->
								<a href="https://cdn.selz.com/plyr/1.0/movie.mp4">Download</a>
							</video>
						</div>

					</div>
					<div class="ibox-content">
						<div class="panel panel-primary">
							<div class="panel-heading">直播说明</div>
							<div class="panel-body">
								<p>通过调整焦距按钮，可以实时调整摄像头的焦距</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>直播操作</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>  
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="form_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-primary">+</button>
							<button type="button" class="btn btn-default">焦距</button>
							<button type="button" class="btn btn-primary">-</button>
						</div>
					</div>
				</div>
				
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>摄像设备</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>  
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="form_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="panel-body">
							<input type="text" placeholder="请输入设备号：如HL001"
								class="input-text ac_input name="
								search_text" autocomplete="off" style="width: 400px">
							<button type="button" class="btn btn-default" id="search_button">搜索</button>
						</div>
						<div class="list-group">
						<a href="#" class="list-group-item"><span
							class="label label-warning">1</span><span class="badge">在线</span>
							<b>设备HL003</b>-张小马在上海浦东长泰广场核查钱小多</a> 
						<a href="#" class="list-group-item"><span
							class="label label-warning">2</span><span class="badge">在线</span>
							<b>设备HL006</b>-赵小萌在上海浦东汇智广场核查孙小小</a> 
						<a href="#" class="list-group-item"><span
							class="label label-warning">3</span><span class="badge">在线</span>
							<b>设备HL002</b>-张小牛在上海浦东祖冲之路核查周小川</a> 
						<a href="#" class="list-group-item"><span
							class="label label-primary">4</span><span class="badge">离线</span><b>设备HL007</b></a> 
						<a href="#" class="list-group-item"><span
							class="label label-primary">5</span><span class="badge">离线</span><b>设备HL001</b></a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">6</span><span class="badge">离线</span><b>设备HL004</b></a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">7</span><span class="badge">离线</span><b>设备HL005</b></a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">8</span><span class="badge">离线</span><b>设备HL008</b></a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">9</span><span class="badge">离线</span><b>设备HL010</b></a>
						<a href="#" class="list-group-item list-group-item-info"><b>查看所有设备>></b></a>
					
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<script>
		(function(d, u) {
			var a = new XMLHttpRequest(), b = d.body;

			// Check for CORS support
			// If you're loading from same domain, you can remove the if statement
			if ("withCredentials" in a) {
				a.open("GET", u, true);
				a.send();
				a.onload = function() {
					var c = d.createElement("div");
					c.setAttribute("hidden", "");
					c.innerHTML = a.responseText;
					b.insertBefore(c, b.childNodes[0]);
				}
			}
		})(document, "css/plugins/plyr/sprite.svg");
	</script>

	<!-- Plyr core script -->
	<script src="js/plugins/plyr/plyr.js"></script>
	<script>
		plyr.setup();
	</script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
</body>
</html>