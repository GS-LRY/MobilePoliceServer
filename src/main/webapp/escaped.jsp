<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="resource/special/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="resource/special.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="libs/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="resource/special.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="resource/special.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>在逃人员列表</title>
</head>
<body onload="loadrecord()">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资源管理 <span class="c-gray en">&gt;</span> 在逃人员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加在逃人员','escaped_add.jsp','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加在逃人员</a></span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
	<div class="mt-20">
	<table id="example" class="table table-border table-bordered table-hover table-bg table-sort">
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
		<tbody id="tr_data"></tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="libs/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="libs/layer/2.4/layer.js"></script>
<script type="text/javascript" src="resource/special/js/H-ui.min.js"></script> 
<script type="text/javascript" src="resource/special.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="libs/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="libs/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="libs/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="js/artDialog/jquery.artDialog.js?skin=aero"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	"bProcessing":true,
	"bServerSide":true,
	"sAjaxSource":"getAllEscapedRecord.do",
	"fnServerData":retrieveData
}); 
function retrieveData(sSource,aoData,fnCallBack){
	$.ajax({
		url:sSource,
		data:{"aoData":JSON.stringify(aoData)},
		dataType:'json'
		type:'post'
		success:function(result){
			fnCallBack(result);
		},
		error:function(msg){}
	});
}*/

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,6,7]}// 制定列不参与排序
		]
	});
	
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
/*页面加载时，载入数据*/
function loadrecord(){
	$.ajax({
		type:'GET',
		url:'getAllEscapedRecord.do',
		dataType:'json',
		success:function(data) {
			//var d = data[1];
			//var newDate = new Date();
			//newDate.setTime(d.zjlasj);
			//art.dialog.alert(newDate.toLocaleDateString()); 
			 for (var i in data) {
				var d = data[i];
				var zjlasj = new Date();
				zjlasj.setTime(d.zjlasj);
				var nrbjzdryksj = new Date();
				nrbjzdryksj.setTime(d.nrbjzdryksj);
				$('#tr_data').append("<tr class='text-c'><td><input type='checkbox' value='1' name=''></td><td>"+d.id+"</td><td>"+d.xm+"</td><td>"+d.xb+"</td><td>"+d.sfzh+"</td><td>"+d.zdryxl+"</td><td>"+d.hjdxz+"</td><td>"+d.xzdxz+"</td><td>"+d.ladw+"</td><td>"+zjlasj.toLocaleDateString()+"</td><td>"+nrbjzdryksj.toLocaleDateString()+"</td></tr>");
			}
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			art.dialog.alert('获取数据失败，请检查服务器');
		}
	}); 
}

</script> 
</body>
</html>