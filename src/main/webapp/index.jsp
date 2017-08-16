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
<link rel="bookmark"href="lib/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
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
<link rel="stylesheet" type="text/css" href="lib/iconfont/iconfont.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>移动警务后台管理系统主页</title>
</head>
<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<a class="logo navbar-logo f-l mr-10 hidden-xs"
					href="/aboutHui.shtml">移动警务后台管理系统</a> <a
					class="logo navbar-logo-m f-l mr-10 visible-xs"
					href="/aboutHui.shtml">上海图丽信息技术有限公司</a> <span
					class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>

				<nav id="Hui-userbar"
					class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li>超级管理员</li>
						<li class="dropDown dropDown_hover"><a href="#"
							class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="exit.jsp" target="_top">退出</a></li>
							</ul></li>
						<li id="Hui-msg"><a href="#" title="消息"><span
								class="badge badge-danger">1</span><i class="Hui-iconfont"
								style="font-size: 18px">&#xe68a;</i></a></li>
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
								class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default"
									title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
								<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside">
		<div class="menu_dropdown bk_2">
			<dl id="menu-article">
				<dt>
					<i class="icon iconfont">&#xe70d;</i> 系统首页<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="home.jsp" data-title="系统首页"
							href="javascript:void(0)">系统首页</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="icon iconfont">&#xe611;</i> 个人中心<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="user_information.jsp" data-title="个人信息修改"
							href="javascript:void(0)">信息修改</a></li>
						<li><a data-href="user_password.jsp" data-title="密码修改"
							href="javascript:void(0)">密码修改</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-product">
				<dt>
					<i class="icon iconfont">&#xe60b;</i> 分级统计<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="StatisticalChart.jsp" data-title="统计图表"
							href="javascript:void(0)">统计图表</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-comments">
				<dt>
					<i class="icon iconfont">&#xe67a;</i> 手动布控<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="ManualControl.jsp"
							data-title="手动布控" href="javascript:;">手动布控</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-member">
				<dt>
					<i class="icon iconfont">&#xe601;</i> 报警管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="CallPolice.jsp" data-title="报警管理"
							href="javascript:;">报警管理</a></li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-system">
				<dt>
					<i class="icon iconfont">&#xe607;</i> 资源管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="escaped.jsp" data-title="在逃人员列表"
							href="javascript:void(0)">在逃人员列表</a></li>
						<li><a data-href="normal.jsp" data-title="核查记录列表"
							href="javascript:void(0)">核查记录列表</a></li>
						<li id="user-list"><a data-href="user.jsp" data-title="用户列表"
							href="javascript:void(0)">用户列表</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-vedio">
				<dt>
					<i class="icon iconfont">&#xe88a;</i> 视频监控<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="realtime_video.jsp" data-title="实时视频监控"
							href="javascript:void(0)">实时视频监控</a></li>
						<li><a data-href="history_video.jsp" data-title="历史录像回放"
							href="javascript:void(0)">历史录像回放</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-check">
				<dt>
					<i class="icon iconfont">&#xe9e8;</i> 网内核录<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="NetVerificationRecord.jsp" data-title="网内核录"
							href="javascript:void(0)">网内核录</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-notice">
				<dt>
					<i class="icon iconfont">&#xe608;</i> 通知通报<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="notice.jsp" data-title="通知通报"
							href="javascript:void(0)">通知通报</a></li>
						<li><a data-href="notice_add.jsp" data-title="添加通知通报"
							href="javascript:void(0)">添加通知通报</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="我的桌面" data-href="home.jsp">我的桌面</span>
						<em></em></li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
					id="js-tabNav-next" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0" src="home.jsp"></iframe>
			</div>
		</div>
	</section>

	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前</li>
			<li id="closeall">关闭全部</li>
		</ul>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			if (
	<%=currentUser%>
		== null) {
				window.location.href('login.jsp');
			}
			if (
	<%=userType%>
		== 0) {
				$("#user-list").hide();
			} else {
				$("#user-list").show();
			}
		});
		$(function() {
			/*$("#min_title_list li").contextMenu('Huiadminmenu', {
				bindings: {
					'closethis': function(t) {
						console.log(t);
						if(t.find("i")){
							t.find("i").trigger("click");
						}		
					},
					'closeall': function(t) {
						alert('Trigger was '+t.id+'\nAction was Email');
					},
				}
			});*/
		});
	</script>
</body>
</html>