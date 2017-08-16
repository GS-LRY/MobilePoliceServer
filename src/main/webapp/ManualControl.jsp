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
<!-- 最新版本的DataTables CSS文件 -->
<link rel="stylesheet" type="text/css"
	href="css/datatables/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="css/datatables/dataTables.bootstrap.min.css">
<!-- 自己的CSS文件 -->
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<title>手动布控</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-body">

			<div class="page-header">
				<h3>手动布控</h3>
			</div>
			<table id="datatable_sdbk" class="datatable" style="width: 100%">
				<thead>
					<tr class="th">
						<td>姓名</td>
						<td>身份证号</td>
						<td>家庭住址</td>
						<td>布控联系人</td>
						<td>布控人电话</td>
						<td>布控人单位</td>
						<td>布控时间</td>
						<td>操作</td>
					</tr>
					<tr>
						<td colspan="8" style="border-bottom: 1px solid #eee;">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#ShouDong">
								<span>手动录入</span>
							</button>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#PiLiang">
								<span>批量导入</span>
							</button>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>郑小犰</td>
						<td>530723198706042804</td>
						<td>上海浦东新区龙东大道2894弄大众村</td>
						<td>左小狳</td>
						<td>18325679652</td>
						<td>上海浦东公安局</td>
						<td>2017/07/25</td>
						<td><a>详情</a>/<a>删除</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 手动录入弹出框 -->
	<div class="modal fade bs-example-modal-sm" id="ShouDong" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<form action="#">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">手动录入布控信息</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="personName">姓名：</span> <input
									type="text" class="form-control" placeholder="姓名"
									aria-describedby="sizing-addon3" name="personName">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="personId">身份证号：</span> <input
									type="text" class="form-control" placeholder="身份证号"
									aria-describedby="sizing-addon3" name="personId">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="personAddress">家庭住址：</span>
								<input type="text" class="form-control" placeholder="家庭住址"
									aria-describedby="sizing-addon3" name="personAddress">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="policeContact">布控联系人：</span>
								<input type="text" class="form-control" placeholder="布控联系人"
									aria-describedby="sizing-addon3" name="policeContact">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="policePhone">布控人联系电话：</span>
								<input type="text" class="form-control" placeholder="布控人联系电话"
									aria-describedby="sizing-addon3" name="policePhone">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="reason">布控原因：</span> <input
									type="text" class="form-control" placeholder="布控原因"
									aria-describedby="sizing-addon3" name="reason">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary">保存信息</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	<!-- 批量导入弹出框 -->
	<div class="modal fade bs-example-modal-sm" id="PiLiang" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<form action="#">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">批量导入</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputFile">File input</label> <input
								type="file" id="exampleInputFile">
							<p class="help-block">excel文件</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary">保存</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- 最新版本的DataTables JavaScript 文件 -->
	<script type="text/javascript"
		src="js/plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatable_sdbk').DataTable({
				language : {
					"sProcessing" : "处理中...",
					"sLengthMenu" : "显示 _MENU_ 项结果",
					"sZeroRecords" : "没有匹配结果",
					"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
					"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
					"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix" : "",
					"sSearch" : "搜索:",
					"sUrl" : "",
					"sEmptyTable" : "表中数据为空",
					"sLoadingRecords" : "载入中...",
					"sInfoThousands" : ",",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "上页",
						"sNext" : "下页",
						"sLast" : "末页"
					},
					"oAria" : {
						"sSortAscending" : ": 以升序排列此列",
						"sSortDescending" : ": 以降序排列此列"
					}
				},

			});
		});
	</script>
</body>
</html>