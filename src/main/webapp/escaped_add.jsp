<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="libs/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加在逃人员</title>
</head>
<body>
	<article class="page-container">
		<form action="" method="post" class="form form-horizontal"
			id="form-member-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="xm" name="xm">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>性别：</label>
				<div class="formControls col-xs-8 col-sm-9 skin-minimal">
					<div class="radio-box">
						<input type="radio" id="xb-1" name="xb" value="男" checked>
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="xb-2" name="xb" value="女"> <label
							for="xb-2">女</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>身份证号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="sfzh" name="sfzh">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>重点人员类别标记：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder=""
						name="zdrylbbj" id="zdrylbbj">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>重点人员细类：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="zdryxl"
						id="zdryxl">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>立案单位：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="ladw"
						id="ladw">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>最近立案时间：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'nrbjzdryksj\')||\'%y-%M-%d\'}' })"
						id="zjlasj" name="zjlasj" class="input-text Wdate"
						style="width: 120px;">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>纳入部级重点人员库时间：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'zjlasj\')}',maxDate:'%y-%M-%d' })"
						id="nrbjzdryksj" name="nrbjzdryksj" class="input-text Wdate"
						style="width: 120px;">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>户籍地区划：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="hjdqh"
						id="hjdqh">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>户籍地详址：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="hjdxz"
						id="hjdxz">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>现住地区划：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="xzdqh"
						id="xzdqh">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>现住地详址：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="" name="xzdxz"
						id="xzdxz">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						
				</div>
			</div>
		</form>
		<!--S = 添加的在逃人员，在核查记录中已经存在，发出警报 -->
		<div id="modal-demo" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content radius">
					<div class="modal-header">
						<h3 class="modal-title">对话框标题</h3>
						<a class="close" data-dismiss="modal" aria-hidden="true"
							href="javascript:void();">×</a>
					</div>
					<div class="modal-body">
						<p>对话框内容…</p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary">确定</button>
						<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!--E = 添加的在逃人员，在核查记录中已经存在，发出警报 -->
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
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
	<script type="text/javascript">
	function modaldemo(){
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-member-add")
					.validate(
							{
								rules : {
									xm : {
										required : true,
										minlength : 2,
										maxlength : 16
									},
									xb : {
										required : true,
									},
									sfzh : {
										required : true,
										isIdCardNo : true,
									},
									zdrylbbj : {
										required : true,
									},
									zdryxl : {
										required : true,
									},
									ladw : {
										required : true,
									},
									nrbjzdryksj : {
										required : true,
									},
									hjdqh : {
										required : true,
									},
									hjdxz : {
										required : true,
									},
									xzdqh : {
										required : true,
									},
									xzdxz : {
										required : true,
									},
									zjlasj : {
										required : true,
									},

								},
								onkeyup : false,
								focusCleanup : true,
								success : "valid",
								submitHandler : function(form) {
									var xm = $.trim($('#xm').val());
									var xb = $("input[name='xb']:checked")
											.val();
									var sfzh = $.trim($('#sfzh').val());
									var zdrylbbj = $.trim($('#zdrylbbj').val());
									var zdryxl = $.trim($('#zdryxl').val());
									var ladw = $.trim($('#ladw').val());
									var nrbjzdryksj = $.trim($('#nrbjzdryksj')
											.val());
									var hjdqh = $.trim($('#hjdqh').val());
									var hjdxz = $.trim($('#hjdxz').val());
									var xzdqh = $.trim($('#xzdqh').val());
									var xzdxz = $.trim($('#xzdxz').val());
									var zjlasj = $.trim($('#zjlasj').val());
									var params = {
										"xm" : xm,
										"xb" : xb,
										"sfzh" : sfzh,
										"zdrylbbj" : zdrylbbj,
										"zdryxl" : zdryxl,
										"ladw" : ladw,
										"nrbjzdryksj" : nrbjzdryksj,
										"hjdqh" : hjdqh,
										"hjdxz" : hjdxz,
										"xzdqh" : xzdqh,
										"xzdxz" : xzdxz,
										"zjlasj" : zjlasj,
									};
									$(form)
											.ajaxSubmit(
													{
														async : false,
														type : 'POST',
														url : 'addEscapedRecord.do',
														dataType : 'json',
														data : params,
														success : function(data) {
															//art.dialog.alert(data);
															if (data.result == "success") {
																$.Huimodalalert('添加成功',2000);
																// 检测到添加的在逃人员在核查记录中被核查过，弹出警报提示框
																if(data.isEscaped == "t"){
																	$("#modal-demo").modal("show");
																}
															} else {
																if (data.result == "exist") {
																	$.Huimodalalert('该在逃人员已经入库，请勿重复添加！',2000);
																} else {
																	$.Huimodalalert('添加失败',2000);
																}
															}
														},
														error : function(data,
																XMLHttpRequest,
																textStatus,
																errorThrown) {
															/* alert(data.result);
															alert(XMLHttpRequest.status);
															alert(XMLHttpRequest.readyState);
															alert(textStatus); */
															$.Huimodalalert(
																	'服务器访问失败',
																	2000);
														},
													});
									var index = parent.layer
											.getFrameIndex(window.name);
									//parent.$('.btn-refresh').click();
									parent.layer.close(index);
								}
							});
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>