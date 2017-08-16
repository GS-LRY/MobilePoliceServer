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
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- zTree CSS文件 -->
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- 最新版本的DataTables CSS文件 -->
<link rel="stylesheet" type="text/css"
	href="css/datatables/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="css/datatables/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<title>报警管理</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-md-2">
					<div class="page-header">
						<h3>单位</h3>
					</div>
					<ul id="treeDemo" class="ztree"></ul>

				</div>

				<div class="col-md-10">
					<div class="page-header">
						<h3>报警管理</h3>
					</div>
					<div
						style="width: 800px; margin: 0 auto; text-align: center; padding: 10px 0;">
						选择日期：<input type="text" class="ipt" id="date_start"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', minDate: '2010-01-01', maxDate: '2050-12-31'})" />
						<button type="button" class="btn btn-primary">查看</button>
					</div>
					<table id="datatable_bjgl" class="datatable" style="width: 100%">
						<thead>
							<tr class="th">
								<td>姓名</td>
								<td>身份证号</td>
								<td>核录地址</td>
								<td>场所</td>
								<td>时间</td>
								<td width="80" align="right">详情</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>郑小犰</td>
								<td>530723198706042804</td>
								<td>上海浦东新区龙东大道2894弄大众村</td>
								<td>室外</td>
								<td>2017/07/25</td>
								<td>上访</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- zTree 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/ztree/jquery.ztree.core.js"></script>
	<!-- 最新版本的DataTables JavaScript 文件 -->
	<script type="text/javascript"
		src="js/plugins/datatables/jquery.dataTables.min.js"></script>
	<!-- 日期选择 核心 JavaScript 文件 -->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
		var setting = {
			data : {
				simpleData : {
					enable : true
				}
			}
		};
		var departments = [];

		$(document)
				.ready(
						function() {
							//$.Huimodalalert("diyic",2000);
							$
									.ajax({
										type : 'GET',
										url : 'getAllDepartment.do',
										dataType : 'json',
										success : function(data) {
											departments = eval(data.departments);
											var treeList = new Array();
											var departmentList = eval(data.departments);
											for (i = 0; i < departments.length; i++) {
												treeList[i] = new Object();
												treeList[i].id = departments[i].id;
												treeList[i].pId = departmentList[i].parentid;
												treeList[i].name = departmentList[i].name;
												if (departmentList[i].level == 0) {
													treeList[i].icon = "css/zTreeStyle/img/diy/1_open.png";
													treeList[i].open = true;
												} else if (departmentList[i].level == 1) {
													treeList[i].icon = "css/zTreeStyle/img/diy/1_close.png";
													if (departments[i].id > 8) {
														treeList[i].isParent = true;
													}
												} else if (departmentList[i].level == 2)
													treeList[i].icon = "css/zTreeStyle/img/diy/1_close.png";
											}
											var zNodes = treeList;
											$.fn.zTree.init($("#treeDemo"),
													setting, zNodes);
										},
										error : function(XMLHttpRequest,
												textStatus, errorThrown) {
											$.Huimodalalert('服务器访问失败', 2000);
										}
									});

						});
		$(document).ready(function() {
			$('#datatable_bjgl').DataTable({
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