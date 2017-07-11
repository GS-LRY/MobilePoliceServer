<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tlkj.model.User"%>
<%
	User currentUser = (User)request.getSession().getAttribute("currentUser");
	Integer userType = currentUser.getUsertype();
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
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
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>在逃人员列表</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		资源管理 <span class="c-gray en">&gt;</span> 在逃人员列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<!-- 日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })"
				id="datemin" class="input-text Wdate" style="width: 120px;">
			- <input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })"
				id="datemax" class="input-text Wdate" style="width: 120px;"> -->
			<input type="text" class="input-text" style="width: 250px"
				placeholder="输入在逃人员姓名或身份证号" id="inputXmorSfzh" name="">
			<button type="submit" class="btn btn-success radius"
				id="searchEscaped" name="" onclick="searchescaped()">
				<i class="Hui-iconfont">&#xe665;</i> 搜在逃人员
			</button>
		</div>
		<div id="addescaped" class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a href="javascript:;"
				onclick="member_add('添加在逃人员','escaped_add.jsp','','510')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加在逃人员</a></span> 
		</div>
		<div class="mt-20">
			<table id="datatable"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="20"><input type="checkbox" name="" value=""></th>
						<th width="20">ID</th>
						<th width="40">姓名</th>
						<th width="20">性别</th>
						<th width="90">身份证号</th>
						<th width="150">重点人员分类</th>
						<th width="150">户籍地详址</th>
						<th width="150">现居住地址</th>
						<th width="150">立案单位</th>
						<th width="80">最近立案时间</th>
						<th width="100">纳入部级重点人员库时间</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript"
		src="js/artDialog/jquery.artDialog.js?skin=aero"></script>
	<script type="text/javascript" src="lib/datatables/fnReloadAjax.js"></script>
	<script type="text/javascript">
	/*用户-添加*/
	function member_add(title,url,w,h){
		layer_show(title,url,w,h);
	}
	var dtable;
	var CONSTANT = {
			DATA_TABLES : {
				COLUMN : {
					// 复选框单元格  
					CHECKBOX : {
						className : "td-checkbox",
						orderable : false,
						bSortable : false,
						data : "id",
						render : function(data, type, row, meta) {
							var content = '<input type="checkbox" name="" value="">';
							return content;
						}
					}
				}
			},
		};
	$(document).ready(function(){
			if(<%=userType%>==0){
				$("#addescaped").hide();
			}else{
				$("#addescaped").show();
			}
			if (dtable != null) {
				dtable.fnClearTable(0);
				dtable.fnDraw();//重新改加载数据
			} else {
				dtable = $("#datatable").dataTable({
					"bStateSave" : true,
					"bJQueryUI" : false,
					"bPaginate" : true,// 分页按钮  
					"bFilter" : true,// 搜索栏  
					"bLengthChange" : true,// 每行显示记录数  
					"bPaginage":true,
					"iDisplayLength" : 10,// 每页显示行数  
					"bAutoWidth":false,
					"aaSorting": [[ 1, "desc" ]],//默认排序
					"bSort" : true,// 排序  
					"bInfo" : true,// Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息  
					"bWidth" : true,
					"bScrollCollapse" : true,
					"sPaginationType" : "full_numbers", // 分页，一共两种样式 另一种为two_button // 是datatables默认  
					"bProcessing" : true,
					"bServerSide" : false,
					"bDestroy" : true,
					"bSortCellsTop" : true,
					"sAjaxSource" : "getAllEscapedRecord.do",
					"sScrollY" : "100%",
					"fnInitComplete" : function() {
						this.fnAdjustColumnSizing(true);
					},
					"fnServerParams" : function(aoData) {
						aoData.push({
							"name" : "statId",
							"value" : encodeURI($("#s_statId").val())
						});
					},
					"aoColumns" : [ 
									CONSTANT.DATA_TABLES.COLUMN.CHECKBOX,
									{"mData" : "id"}, 
									{"mData" : "xm"}, 
									{"mData" : "xb"}, 
									{"mData" : "sfzh"},
									{"mData" : "zdryxl"}, 
									{"mData" : "hjdxz"}, 
									{"mData" : "xzdxz"}, 
									{"mData" : "ladw"}, 
									{"mData" : "zjlasj"}, 
									{"mData" : "nrbjzdryksj"}],
					"fnRowCallback" : function(nRow, aData, iDisplayIndex) {//相当于对字段格式化  
						if (aData["revampStatus"] == 0) {
							$('td:eq(5)', nRow).html("结束");
						} else if (aData["revampStatus"] == 1) {
							$('td:eq(5)', nRow).html("进行中");
						} else if (aData["revampStatus"] == 2) {
							$('td:eq(5)', nRow).html("完成");
						} else if (aData["revampStatus"] == 3) {
							$('td:eq(5)', nRow).html("驳回");
						}
					},
					"fnDrawCallback":function(){
						
					},
					"aoColumnDefs": [
						 {"orderable":false,"aTargets":[0,6,7]}// 制定列不参与排序
						 ],
					"fnServerData" : function(sSource, aoData, fnCallback) {
						$.ajax({
							"type" : 'get',
							"url" : sSource,
							"dataType" : "json",
							"data" : {
								aoData : JSON.stringify(aoData)
							},
							"success" : function(resp) {
								fnCallback(resp);
							}
						});
					}
				});
			}
		});
		function searchescaped(){
			var XmOrSfzh = $.trim($('#inputXmorSfzh').val());
			//art.dialog.alert(param);
			if (XmOrSfzh == '') {
				art.dialog.alert('请输入姓名或者身份证号');
				return false;
			};
			var params = {
				"XmOrSfzh" : XmOrSfzh,
			};
			 $.ajax({
				type:'GET',
				url:'searchEscapedByXmOrSfzh.do',
				dataType:'json',
				data:params,
				contentType: 'application/json; charset=UTF-8',
				success:function(data) {
					if (data.jsondata=="nouser") {
						art.dialog.alert('没有该用户');
					} else {
							//art.dialog.alert('有该用户');
						dtable.fnDestroy();
						dtable = $("#datatable").dataTable({
							"bStateSave" : true,
							"bJQueryUI" : false,
							"bPaginate" : true,// 分页按钮  
							"bFilter" : true,// 搜索栏  
							"bLengthChange" : true,// 每行显示记录数  
							"bPaginage":true,
							"iDisplayLength" : 10,// 每页显示行数  
							"bAutoWidth":false,
							"aaSorting": [[ 1, "desc" ]],//默认排序
							"bSort" : true,// 排序  
							"bInfo" : true,// Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息  
							"bWidth" : true,
							"bScrollCollapse" : true,
							"sPaginationType" : "full_numbers", // 分页，一共两种样式 另一种为two_button // 是datatables默认  
							"bProcessing" : true,
							"bServerSide" : false,
							"bDestroy" : true,
							"bSortCellsTop" : true,
							"sAjaxSource" : "getAllEscapedRecord.do",
							"sScrollY" : "100%",
							"fnInitComplete" : function() {
								this.fnAdjustColumnSizing(true);
							},
							"fnServerParams" : function(aoData) {
								aoData.push({
									"name" : "statId",
									"value" : encodeURI($("#s_statId").val())
								});
							},
							"aoColumns" : [ 
											CONSTANT.DATA_TABLES.COLUMN.CHECKBOX,
											{"mData" : "id"}, 
											{"mData" : "xm"}, 
											{"mData" : "xb"}, 
											{"mData" : "sfzh"},
											{"mData" : "zdryxl"}, 
											{"mData" : "hjdxz"}, 
											{"mData" : "xzdxz"}, 
											{"mData" : "ladw"}, 
											{"mData" : "zjlasj"}, 
											{"mData" : "nrbjzdryksj"}],
							"fnRowCallback" : function(nRow, aData, iDisplayIndex) {//相当于对字段格式化  
								if (aData["revampStatus"] == 0) {
									$('td:eq(5)', nRow).html("结束");
								} else if (aData["revampStatus"] == 1) {
									$('td:eq(5)', nRow).html("进行中");
								} else if (aData["revampStatus"] == 2) {
									$('td:eq(5)', nRow).html("完成");
								} else if (aData["revampStatus"] == 3) {
									$('td:eq(5)', nRow).html("驳回");
								}
							},
							"fnDrawCallback":function(){
								
							},
							"aoColumnDefs": [
								 {"orderable":false,"aTargets":[0,6,7]}// 制定列不参与排序
								 ],
							"fnServerData" : function(sSource, aoData, fnCallback) {
								$.ajax({
									"type" : 'get',
									"url" : sSource,
									"dataType" : "json",
									"data" : {
										aoData : JSON.stringify(aoData),
										"XmOrSfzh" : XmOrSfzh,
									},
									"success" : function(resp) {
										fnCallback(resp);
									}
								});
							}
						});
						
						
					}
				
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					alert("服务器访问失败");
				}
			}); 
		}
		
		
	</script>
</body>
</html>