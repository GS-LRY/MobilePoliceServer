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
<link rel="shortcut icon" href="lib/favicon.ico" />
<link rel="bookmark" href="lib/favicon.ico" />

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
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
<link rel="stylesheet" type="text/css" href="css/video.css" />
<title>通知通报</title>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<h2>
							为您找到相关结果约30个： <span class="text-navy">“上海”</span>
						</h2>
						<small>搜索用时 (0.23秒)</small>

						<div class="search-form">
							<form action="index.html" method="get">
								<div class="input-group">
									<input type="text" placeholder="请输入关键词" name="search"
										class="form-control input-lg">
									<div class="input-group-btn">
										<button class="btn btn-lg btn-primary" type="submit">
											搜索</button>
									</div>
								</div>

							</form>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="search-result">
							<h3>
								<a href="#"><b><span>2017-07-24</span></b> <b><span>孙小猪</span></b>被<b><span>上海市公安局</span></b>列为<b><span>在逃人员</span></b></a>
							</h3>
							<a href="search_results.html#" class="search-link">2017-07-24
								上海市公安局</a>
							<p></p>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="search-result">
							<h3>
								<a href="#"><b><span>2017-07-24</span></b><b><span>曹小熊</span></b>被<b><span>上海市公安局</span></b>列为<b><span>在逃人员</span></b></a>
							</h3>
							<a href="search_results.html#" class="search-link">2017-07-24‎
								上海市公安局</a>
							<p></p>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="search-result">
							<h3>
								<a href="#"><b><span>2017-07-23</span></b> <b><span>李小狗</span></b>被<b><span>上海市浦东新区公安分局</span></b>列为<b><span>重点人员</span></b></a>
							</h3>
							<a href="search_results.html#" class="search-link">2017-07-23
								‎上海市浦东新区公安分局</a>
							<p></p>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="search-result">
							<h3>
								<a href="#"><b><span>2017-07-23</span></b> <b><span>赵小猫</span></b>被<b><span>上海市杨浦区公安分局</span></b>列为<b><span>重点人员，贩毒人员</span></b></a>
							</h3>
							<a href="search_results.html#" class="search-link">2017-07-23
								上海市杨浦区公安分局</a>
							<p></p>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="text-center">
							<div class="btn-group">
								<button class="btn btn-white" type="button">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button class="btn btn-white active">1</button>
								<button class="btn btn-white">2</button>
								<button class="btn btn-white">3</button>
								<button class="btn btn-white">4</button>
								<button class="btn btn-white">5</button>
								<button class="btn btn-white">6</button>
								<button class="btn btn-white">7</button>
								<button class="btn btn-white" type="button">
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
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
	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
</body>
</html>