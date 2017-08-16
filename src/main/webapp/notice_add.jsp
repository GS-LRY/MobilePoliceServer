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
<link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/notice/style.css">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<!--summernote富文本编辑器-->
<link rel="stylesheet" type="text/css"
	href="lib/summernote/summernote.css">
<title>添加通知通报</title>
</head>
<body style="padding-top: 10px">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-sm-12">
					<div class="tabs-container">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#tab-1"
								aria-expanded="true">一般通知</a></li>
							<li class=""><a data-toggle="tab" href="#tab-2"
								aria-expanded="false">特别通知</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="row">
										<form action="#" method="post" class="add-article-form">
											<div class="col-md-9">
												<h1 class="page-header">撰写新通知</h1>
												<div class="form-group">
													<label for="article-title" class="sr-only">标题</label> <input
														type="text" id="article-title" name="title"
														class="form-control" placeholder="在此处输入标题" required
														autofocus autocomplete="off">
												</div>
												<div class="form-group">
													<label for="article-content" class="sr-only">内容</label>
													<textarea id="article-content" name="content"
														class="form-control"></textarea>
												</div>
												<div class="add-article-box">
													<h2 class="add-article-box-title">
														<span>关键字</span>
													</h2>
													<div class="add-article-box-content">
														<input type="text" class="form-control"
															placeholder="请输入关键字" name="keywords" autocomplete="off">
														<span class="prompt-text">多个标签请用英文逗号,隔开。</span>
													</div>
												</div>
												<div class="add-article-box">
													<h2 class="add-article-box-title">
														<span>描述</span>
													</h2>
													<div class="add-article-box-content">
														<textarea class="form-control" name="describe"
															autocomplete="off"></textarea>
														<span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<h1 class="page-header">操作</h1>
												<div class="add-article-box">
													<h2 class="add-article-box-title">
														<span>发布</span>
													</h2>
													<div class="add-article-box-content">
														<p>
															<label>状态：</label><span class="article-status-display">未发布</span>
														</p>
														<p>
															<label>公开度：</label><input type="radio" name="visibility"
																value="0" checked />公开 <input type="radio"
																name="visibility" value="1" />加密
														</p>
														<p>
															<label>发布于：</label><span class="article-time-display"><input
																style="border: none;" type="datetime" name="time"
																value="2016-01-09 17:29:37" /></span>
														</p>
													</div>
													<div class="add-article-box-footer">
														<button class="btn btn-primary" type="submit"
															name="submit">发布</button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div id="tab-2" class="tab-pane">
								<div class="panel-body">
									<!-- S = 特别通知 -->
									
										<div class="row">
											<form action="#" method="post"
												class="add-article-form">
												<div class="col-md-9">
													<h1 class="page-header">撰写特别通知</h1>
													<div class="form-group">
														<label for="article-title" class="sr-only">标题</label> <input
															type="text" id="article-title" name="title"
															class="form-control" placeholder="在此处输入标题" required
															autofocus autocomplete="off">
													</div>
													<div class="form-group">
														<label for="article-contents" class="sr-only">内容</label>
														<script id="article-contents" name="content" type="text/plain"></script>
													</div>
													<div class="add-article-box">
														<h2 class="add-article-box-title">
															<span>关键字</span>
														</h2>
														<div class="add-article-box-content">
															<input type="text" class="form-control"
																placeholder="请输入关键字" name="keywords" autocomplete="off">
															<span class="prompt-text">多个标签请用英文逗号,隔开。</span>
														</div>
													</div>
													<div class="add-article-box">
														<h2 class="add-article-box-title">
															<span>描述</span>
														</h2>
														<div class="add-article-box-content">
															<textarea class="form-control" name="describe"
																autocomplete="off"></textarea>
															<span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<h1 class="page-header">操作</h1>
													<div class="add-article-box">
														<h2 class="add-article-box-title">
															<span>特别通知类别</span>
														</h2>
														<div class="add-article-box-content">
															<ul class="category-list">
																<li><label> <input name="category"
																		type="radio" value="1" checked> 增减在逃人员</label></li>
																<li><label> <input name="category"
																		type="radio" value="2"> 数据库更新 </label></li>
																<li><label> <input name="category"
																		type="radio" value="3"> 增减重点人员 </label></li>
															</ul>
														</div>
													</div>
													<div class="add-article-box">
														<h2 class="add-article-box-title">
															<span>标签</span>
														</h2>
														<div class="add-article-box-content">
															<input type="text" class="form-control"
																placeholder="输入新标签" name="tags" autocomplete="off">
															<span class="prompt-text">多个标签请用英文逗号,隔开</span>
														</div>
													</div>
													<div class="add-article-box">
														<h2 class="add-article-box-title">
															<span>标题图片</span>
														</h2>
														<div class="add-article-box-content">
															<input type="text" class="form-control"
																placeholder="点击按钮选择图片" id="pictureUpload"
																name="titlepic" autocomplete="off">
														</div>
														<div class="add-article-box-footer">
															<button class="btn btn-default" type="button"
																ID="upImage">选择</button>
														</div>
													</div>
													<div class="add-article-box">
														<h2 class="add-article-box-title">
															<span>发布</span>
														</h2>
														<div class="add-article-box-content">
															<p>
																<label>状态：</label><span class="article-status-display">未发布</span>
															</p>
															<p>
																<label>公开度：</label><input type="radio" name="visibility"
																	value="0" checked />公开 <input type="radio"
																	name="visibility" value="1" />加密
															</p>
															<p>
																<label>发布于：</label><span class="article-time-display"><input
																	style="border: none;" type="datetime" name="time"
																	value="2016-01-09 17:29:37" /></span>
															</p>
														</div>
														<div class="add-article-box-footer">
															<button class="btn btn-primary" type="submit"
																name="submit">发布</button>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								<!-- E = 特别通知 -->
							</div>
						</div>
					</div>
</div></div></div></div>

					<!-- 全局js -->
					<script src="js/jquery.min.js?v=2.1.4"></script>
					<script src="js/bootstrap.min.js?v=3.3.6"></script>
					<script src="lib/ueditor/ueditor.config.js"></script>
					<script src="lib/ueditor/ueditor.all.min.js"></script>
					<script src="js/admin-scripts.js"></script>
					<script src="lib/ueditor/lang/zh-cn/zh-cn.js"></script>
					<script id="uploadEditor" type="text/plain" style="display: none;"></script>
					<script type="text/javascript">
						var editor = UE.getEditor('article-contents');
						window.onresize = function() {
							window.location.reload();
						}
						var _uploadEditor;
						$(function() {
							//重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
							_uploadEditor = UE.getEditor('uploadEditor');
							_uploadEditor
									.ready(function() {
										//设置编辑器不可用
										//_uploadEditor.setDisabled();
										//隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
										_uploadEditor.hide();
										//侦听图片上传
										_uploadEditor
												.addListener(
														'beforeInsertImage',
														function(t, arg) {
															//将地址赋值给相应的input,只去第一张图片的路径
															$("#pictureUpload")
																	.attr(
																			"value",
																			arg[0].src);
															//图片预览
															//$("#imgPreview").attr("src", arg[0].src);
														})
										//侦听文件上传，取上传文件列表中第一个上传的文件的路径
										_uploadEditor
												.addListener(
														'afterUpfile',
														function(t, arg) {
															$("#fileUpload")
																	.attr(
																			"value",
																			_uploadEditor.options.filePath
																					+ arg[0].url);
														})
									});
						});
						//弹出图片上传的对话框
						$('#upImage').click(
								function() {
									var myImage = _uploadEditor
											.getDialog("insertimage");
									myImage.open();
								});
						//弹出文件上传的对话框
						function upFiles() {
							var myFiles = _uploadEditor.getDialog("attachment");
							myFiles.open();
						}
					</script>

					

					<script src="lib/summernote/summernote.js"></script>
					<script src="lib/summernote/lang/summernote-zh-CN.js"></script>
					<script>
						$('#article-content').summernote({
							lang : 'zh-CN'
						});
					</script>
					<!-- 自定义js -->
					<script src="js/content.js?v=1.0.0"></script>
					
</body>
</html>