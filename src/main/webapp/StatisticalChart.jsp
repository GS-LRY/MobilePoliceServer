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
<!-- zTree CSS文件 -->
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
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
<!-- 最新版本的DataTables CSS文件 -->
<link rel="stylesheet" type="text/css"
	href="css/datatables/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="css/datatables/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<title>统计图表</title>
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
						<h3>统计</h3>
					</div>
					<div
						style="width: 800px; margin: 0 auto; text-align: center; padding: 10px 0;">
						开始时间：<input type="text" class="ipt" id="date_start"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', minDate: '2010-01-01', maxDate: '2050-12-31'})" />
						&nbsp;&nbsp;&nbsp;&nbsp; 结束时间：<input type="text" class="ipt"
							id="date_end"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', minDate: '2010-01-01', maxDate: '2050-12-31'})" />
					</div>
					<div id="container"
						style="width: 800px; height: 500px; margin: 0 auto"></div>
					<table id="datatable_sc" class="datatable" style="width: 100%">
				<thead>
					<tr class="th">
						<td>单位</td>
						<td>核录数(条)</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>浦东新区公安分局</td>
						<td>2450</td>
					</tr>
					<tr>
						<td>长宁公安分局</td>
						<td>2310</td>
					</tr>
					<tr>
						<td>卢湾公安分局</td>
						<td>1610</td>
					</tr>
					<tr>
						<td>徐汇公安分局</td>
						<td>2110</td>
					</tr>
					<tr>
						<td>闵行公安分局</td>
						<td>1650</td>
					</tr>
					<tr>
						<td>黄埔公安分局</td>
						<td>1510</td>
					</tr>
					<tr>
						<td>静安公安分局</td>
						<td>1440</td>
					</tr>
					<tr>
						<td>虹口公安分局</td>
						<td>1360</td>
					</tr>
					<tr>
						<td>普陀公安分局</td>
						<td>1350</td>
					</tr>
				</tbody>
			</table>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<!-- zTree 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/ztree/jquery.ztree.core.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script src="js/highcharts/js/highcharts.js"></script>
	<script src="js/highcharts/js/modules/exporting.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<!-- 最新版本的DataTables JavaScript 文件 -->
	<script type="text/javascript"
		src="js/plugins/datatables/jquery.dataTables.min.js"></script>
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
							$('#datatable_sc')
									.DataTable(
											{
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
							$.ajax({
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
		$('#container').highcharts(
				{
					chart : {
						type : 'column'
					},
					title : {
						text : '上海市公安局核录量统计'
					},
					subtitle : {
						text : '数据截止 2017-07'
					},
					xAxis : {
						type : 'category',
						labels : {
							rotation : -45,
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					},
					yAxis : {
						min : 0,
						title : {
							text : '核录量(件)'
						}
					},
					legend : {
						enabled : false
					},
					tooltip : {
						pointFormat : '核录量: <b>{point.y} 件</b>'
					},
					series : [ {
						name : '核录量',
						data : [ [ '浦东新区公安分局', 2450 ], [ '长宁公安分局', 2310 ],
								[ '徐汇公安分局', 2110 ], [ '卢湾公安分局', 1610 ],
								[ '闵行公安分局', 1650 ], [ '黄浦公安分局', 1510 ],
								[ '静安公安分局', 1440 ], [ '虹口公安分局', 1360 ],
								[ '普陀公安分局', 1350 ], [ '青浦区公安局', 1240 ],
								[ '松江区公安分局', 1210 ], [ '杨浦公安分局', 1220 ],
								[ '南汇公安局', 1050 ], [ '宝山公安分局', 1000 ],
								[ '崇明县公安局', 1010 ], [ '奉贤区公安分局', 930 ],
								[ '金山区公安局', 980 ], [ '嘉定公安局分局', 930 ],
								[ '上海市公安局城市轨道交通分局', 670 ],
								[ '上海市公安局国际机场分局', 450 ],
								[ '上海市公安局航运公安局', 770 ], [ '上海市水上公安局', 990 ],
								[ '上海港公安局', 340 ], [ '上海铁路公安局', 570 ],
								[ '长江航运公安局上海分局', 460 ] ],
						dataLabels : {
							enabled : true,
							rotation : -90,
							color : '#FFFFFF',
							align : 'right',
							format : '{point.y}', // one decimal
							y : 10, // 10 pixels down from the top
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					} ]
				});
	</script>
</body>
</html>