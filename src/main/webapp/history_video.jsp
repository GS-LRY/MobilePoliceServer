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
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- 播放视频 -->
<link rel="stylesheet" type="text/css" href="css/willesPlay.css">

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
<style type="text/css">
</style>
<title>历史录像回放</title>
</head>
<body>
	<!-- S = 视频播放区域 -->
	<div class="video_play panel panel-default col-lg-8">
		<div class="panel-body col-lg-6">
			<div id="willesPlay">
				<div class="playHeader">
					<div class="videoName">2017/7/5 admin上海浦东张江高科毕升路核查小明录像</div>
				</div>
				<div class="playContent">
					<video width="100%" height="100%" id="playVideo"
						poster="img/test/video1.jpg">
						<source
							src="http://player.yinyuetai.com/video/swf/2887964/v_0.swf"
							type="video/mp4"></source>
						当前浏览器不支持 video直接播放，点击这里下载视频：
						<a href="/">下载视频</a>
					</video>
					<div class="playTip glyphicon glyphicon-play"></div>
				</div>
				<div class="playControll">
					<div class="playPause playIcon"></div>
					<div class="timebar">
						<span class="currentTime">0:00:00</span>
						<div class="progress">
							<div
								class="progress-bar progress-bar-danger progress-bar-striped"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width: 0%"></div>
						</div>
						<span class="duration">0:00:00</span>
					</div>
					<div class="otherControl">
						<span class="volume glyphicon glyphicon-volume-down"></span> <span
							class="fullScreen glyphicon glyphicon-fullscreen"></span>
						<div class="volumeBar">
							<div class="volumewrap">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuemin="0" aria-valuemax="100"
										style="width: 8px; height: 40%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-body col-lg-6">
			<div id="willesPlay">
				<div class="playHeader">
					<div class="videoName">2017/7/7 admin上海浦东龙阳路核查小强录像</div>
				</div>
				<div class="playContent">
					<video width="100%" height="100%" id="playVideo"
						poster="img/test/video2.jpg">
						<source src="http://v.qq.com/boke/page/d/0/i/d0163kxz8di.html"
							type="video/mp4"></source>
						当前浏览器不支持 video直接播放，点击这里下载视频：
						<a href="/">下载视频</a>
					</video>
					<div class="playTip glyphicon glyphicon-play"></div>
				</div>
				<div class="playControll">
					<div class="playPause playIcon"></div>
					<div class="timebar">
						<span class="currentTime">0:00:00</span>
						<div class="progress">
							<div
								class="progress-bar progress-bar-danger progress-bar-striped"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width: 0%"></div>
						</div>
						<span class="duration">0:00:00</span>
					</div>
					<div class="otherControl">
						<span class="volume glyphicon glyphicon-volume-down"></span> <span
							class="fullScreen glyphicon glyphicon-fullscreen"></span>
						<div class="volumeBar">
							<div class="volumewrap">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuemin="0" aria-valuemax="100"
										style="width: 8px; height: 40%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-body col-lg-6">
			<div id="willesPlay">
				<div class="playHeader">
					<div class="videoName">2017/6/5 admin上海浦东龙东大道核查小红录像</div>
				</div>
				<div class="playContent">
					<video width="100%" height="100%" id="playVideo"
						poster="img/test/video3.jpg">
						<source src="http://v.qq.com/boke/page/d/0/i/d0163kxz8di.html"
							type="video/mp4"></source>
						当前浏览器不支持 video直接播放，点击这里下载视频：
						<a href="/">下载视频</a>
					</video>
					<div class="playTip glyphicon glyphicon-play"></div>
				</div>
				<div class="playControll">
					<div class="playPause playIcon"></div>
					<div class="timebar">
						<span class="currentTime">0:00:00</span>
						<div class="progress">
							<div
								class="progress-bar progress-bar-danger progress-bar-striped"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width: 0%"></div>
						</div>
						<span class="duration">0:00:00</span>
					</div>
					<div class="otherControl">
						<span class="volume glyphicon glyphicon-volume-down"></span> <span
							class="fullScreen glyphicon glyphicon-fullscreen"></span>
						<div class="volumeBar">
							<div class="volumewrap">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuemin="0" aria-valuemax="100"
										style="width: 8px; height: 40%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-body col-lg-6">
			<div id="willesPlay">
				<div class="playHeader">
					<div class="videoName">2017/4/15 admin上海浦东陆家嘴核查小强录像</div>
				</div>
				<div class="playContent">
					<video width="100%" height="100%" id="playVideo"
						poster="img/test/video4.jpg">
						<source src="http://v.qq.com/boke/page/d/0/i/d0163kxz8di.html"
							type="video/mp4"></source>
						当前浏览器不支持 video直接播放，点击这里下载视频：
						<a href="/">下载视频</a>
					</video>
					<div class="playTip glyphicon glyphicon-play"></div>
				</div>
				<div class="playControll">
					<div class="playPause playIcon"></div>
					<div class="timebar">
						<span class="currentTime">0:00:00</span>
						<div class="progress">
							<div
								class="progress-bar progress-bar-danger progress-bar-striped"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width: 0%"></div>
						</div>
						<span class="duration">0:00:00</span>
					</div>
					<div class="otherControl">
						<span class="volume glyphicon glyphicon-volume-down"></span> <span
							class="fullScreen glyphicon glyphicon-fullscreen"></span>
						<div class="volumeBar">
							<div class="volumewrap">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuemin="0" aria-valuemax="100"
										style="width: 8px; height: 40%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- E = 视频播放区域 -->

	<!-- S = 视频操作区域 -->
	<div class="video_operation panel panel-default col-lg-3 col-md-4">

		<div class="panel-body">
			<input type="text" placeholder="请输入关键词"
				class="input-text ac_input name=" search_text" autocomplete="off"
				style="width: 300px">
			<button type="button" class="btn btn-default" id="search_button">搜索</button>
		</div>




		<div class="panel-body">
			<div class="panel panel-primary">
				<div class="panel-header">最新核查录像</div>
				<div class="panel-body">
					<div class="list-group">
						<a href="#" class="list-group-item"><span
							class="label label-primary">1</span><span class="badge">NEW</span>2017/7/31
							张小马在上海浦东长泰广场核查钱小多</a> 
						<a href="#" class="list-group-item"><span
							class="label label-primary">2</span><span class="badge">NEW</span>2017/7/28
							赵小萌在上海浦东汇智广场核查孙小小</a> 
						<a href="#" class="list-group-item"><span
							class="label label-primary">3</span><span class="badge">NEW</span>2017/7/21
							张小马在上海浦东祖冲之路核查周小川</a> 
						<a href="#" class="list-group-item"><span
							class="label label-primary">4</span>2017/7/15 吴小北在上海浦东高斯路核查王小琳</a> 
						<a href="#" class="list-group-item"><span
							class="label label-primary">5</span>2017/7/14 谢小牛在上海浦东爱迪生路核查毛小花</a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">6</span>2017/7/6 杨小草在上海浦东八佰伴路核查卢小楠</a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">7</span>2017/7/1 董小妹在上海浦东八佰伴路核查黄小先</a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">8</span>2017/6/24 王小哥在上海浦东广兰路核查鲁小蓝</a>
						<a href="#" class="list-group-item"><span
							class="label label-primary">9</span>2017/6/21 曾小狼在上海浦东广兰路核查马小云</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- E = 视频操作区域 -->

	

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
	<!-- 播放视频 -->
	<script type="text/javascript" src="js/willesPlay.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
</body>
</html>