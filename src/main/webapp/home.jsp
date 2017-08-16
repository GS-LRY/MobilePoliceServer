<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy年MM月dd日");
	java.util.Date currentTime = new java.util.Date();
	String currentDate = format.format(currentTime).toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>主界面</title>
<!-- bootstrap 3.0.2 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet"
	type="text/css" />
<!-- fullCalendar -->
<link href="css/fullcalendar/fullcalendar.css" rel="stylesheet"
	type="text/css" />
<!-- Daterange picker -->
<link href="css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<!-- <section class="content-header">
				<h1>
					Dashboard <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section> -->

			<!-- Main content -->
			<section class="content">

				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3>
									<span id="normalrecords"></span>
								</h3>
								<p>核查记录数</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer"> 更多信息<i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>
									<span id="todayescapeds"></span>/<span id="escapedsall"></span>
								</h3>
								<p>今日核查到重点人员数</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-stalker"></i>
							</div>
							<a href="#" class="small-box-footer"> 更多信息 <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3>44</h3>
								<p>用户数</p>
							</div>
							<div class="icon">
								<i class="ion ion-person"></i>
							</div>
							<a href="#" class="small-box-footer"> 更多信息 <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3>
									<span id="todaynormalrecords"></span>
								</h3>
								<p>今日更新核查数</p>
							</div>
							<div class="icon">
								<i class="ion ion-pie-graph"></i>
							</div>
							<a href="#" class="small-box-footer"> 更多信息<i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col 左侧部分-->
					<section class="col-lg-6 connectedSortable">
						<!-- S=核查信息即时更新时间轴 -->
						<div class="row">
							<div class="col-md-12">
								<ul class="timeline" id="">
									<!-- timeline time label -->
									<li class="time-label"><span class="bg-blue">
											最新核录情况 </span></li>
									<!-- /.timeline-label -->
									<!-- timeline item -->
									<li><i class="fa fa-envelope bg-aqua"></i>
										<div class="timeline-item">
											<span class="time" id="time0"> <i
												class="fa fa-clock-o"></i>

											</span>

											<h3 class="timeline-header no-border">
												<a href="#"><span id="username0"></span></a> 在 <b><span
													id="addressname0"></span></b> 核查了 <b><span id="personname0"></span></b>
											</h3>
										</div></li>
									<!-- END timeline item -->
									<!-- timeline item -->
									<li>
										<!-- timeline icon --> <i class="fa fa-envelope bg-blue"></i>
										<div class="timeline-item">
											<span class="time" id="time1"> <i
												class="fa fa-clock-o"></i>

											</span>

											<h3 class="timeline-header no-border">
												<a href="#"><span id="username1"></span></a> 在 <b><span
													id="addressname1"></span></b> 核查了 <b><span id="personname1"></span></b>
											</h3>
										</div>
									</li>
									<!-- END timeline item -->
									<!-- timeline item -->
									<li><i class="fa fa-envelope bg-aqua"></i>
										<div class="timeline-item">
											<span class="time" id="time2"> <i
												class="fa fa-clock-o"></i>

											</span>

											<h3 class="timeline-header no-border">
												<a href="#"><span id="username2"></span></a> 在 <b><span
													id="addressname2"></span></b> 核查了 <b><span id="personname2"></span></b>
											</h3>
										</div></li>
									<!-- END timeline item -->
									<!-- timeline item -->
									<li><i class="fa fa-envelope bg-blue"></i>
										<div class="timeline-item">
											<span class="time" id="time3"> <i
												class="fa fa-clock-o"></i>

											</span>

											<h3 class="timeline-header no-border">
												<a href="#"><span id="username3"></span></a> 在 <b><span
													id="addressname3"></span></b> 核查了 <b><span id="personname3"></span></b>
											</h3>
										</div></li>
									<!-- END timeline item -->
									<!-- timeline item -->
									<li><i class="fa fa-envelope bg-aqua"></i>
										<div class="timeline-item">
											<span class="time" id="time4"> <i
												class="fa fa-clock-o"></i>

											</span>

											<h3 class="timeline-header no-border">
												<a href="#"><span id="username4"></span></a> 在 <b><span
													id="addressname4"></span></b> 核查了 <b><span id="personname4"></span></b>
											</h3>
										</div></li>
									<!-- END timeline item -->

									<li><i class="fa fa-clock-o"></i></li>
								</ul>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
						<!-- E=核查信息即时更新时间轴 -->
					</section>
					<!-- /.Left col -->

					<!-- Right col 右侧部分-->
					<section class="col-lg-6 connectedSortable">
						<!-- row -->
						<div class="box box-info">
							<div class="box-header">
								<div class="pull-right box-tools">
									<button class="btn btn-primary pull-right" onclick="notice_add('通知通报','notice.jsp','','700')">更多</button>
								</div>
								<i class="fa fa-bullhorn"></i>
								<h3 class="box-title">通知</h3>

							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="callout callout-danger">
									<h4>
										<b><span>2017-07-24</span></b> <a href="#"><b><span>孙小猪</span></b></a>被<b><span>上海市公安局</span></b>列为<b><span>在逃人员</span></b>
									</h4>
								</div>
								<div class="callout callout-danger">
									<h4>
										<b><span>2017-07-24</span></b> <a href="#"><b><span>曹小熊</span></b></a>被<b><span>上海市公安局</span></b>列为<b><span>在逃人员</span></b>
									</h4>
								</div>
								<div class="callout callout-info">
									<h4>
										<b><span>2017-07-23</span></b> <a href="#"><b><span>李小狗</span></b></a>被<b><span>上海市浦东新区公安分局</span></b>列为<b><span>重点人员</span></b>
									</h4>
								</div>
								<div class="callout callout-warning">
									<h4>
										<b><span>2017-07-23</span></b> <a href="#"><b><span>赵小猫</span></b></a>被<b><span>上海市杨浦区公安分局</span></b>列为<b><span>重点人员，贩毒人员</span></b>
									</h4>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
						<!-- /.col -->
						<!-- /.row -->
					</section>
					<!-- /.Right col -->
				</div>
				<!-- /.row (main row) -->

				<!-- Line Chart row-->
				<div class="row">
					<section class="col-lg-12 connectedSortable">
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
						<div id="main" style="width: 100%; height: 300px;"></div>
					</section>

				</div>
				<!-- /.row (line chart row) -->
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.0.2 -->
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>
	<!-- jQuery UI 1.10.3 -->
	<script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- Echarts.js charts -->
	<script src="js/echarts.min.js"></script>
	<script src="js/macarons.js"></script>
	<!-- Morris.js charts -->
	<script src="js/raphael-min.js"></script>
	<script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>
	<script src="js/plugins/morris/morris.js" type="text/javascript"></script>
	<!-- Sparkline -->
	<script src="js/plugins/sparkline/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- jvectormap -->
	<script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
		type="text/javascript"></script>
	<script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
		type="text/javascript"></script>
	<!-- fullCalendar -->
	<script src="js/plugins/fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>
	<!-- jQuery Knob Chart -->
	<script src="js/plugins/jqueryKnob/jquery.knob.js"
		type="text/javascript"></script>
	<!-- daterangepicker -->
	<script src="js/plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

	<!-- AdminLTE App -->
	<script src="js/AdminLTE/app.js" type="text/javascript"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="js/AdminLTE/dashboard.js" type="text/javascript"></script>

	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!-- 从后台获取需要显示的数据 -->
	<script type="text/javascript">
	
	function notice_add(title,url,w,h){
		layer_show(title,url,w,h);
	}
		$(function() {
			getData();
		});

		var normalTableList = [];
		//$(document).ready(function() {

		function getData() {
			$.ajax({
				type : 'GET',
				url : 'getHomePageNeedData.do',
				async : true,
				dataType : 'json',
				success : function(data) {
					//alert(data.normalrecords+"/"+data.toadynormalrecords);
					$('#normalrecords').html(data.normalrecords);
					$('#todayescapeds').html(data.toadyescapednormalrecords);
					$('#todaynormalrecords').html(data.toadynormalrecords);
					$('#escapedsall').html(data.escapednormalrecords);
					normalTableList = eval(data.normalTableList);
					initNewNormalList();
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$(window).attr('location', '404.html');
				}
			});
			//setInterval(getData(),60000);
			setTimeout('getData()', 50000);
		};

		//setInterval(getData(),5000);
		//});
		// 实时更新核录列表信息
		function initNewNormalList() {
			for (var i = 0; i < normalTableList.length; i++) {
				/* if(!DateCompare(normalTableList[i].committime.substr(0,9),getTodayDate())){
					$('#newNormalRecords').append("<li class='time-label'><span class='bg-blue'>"+normalTableList[i].committime.substr(0,3)+"年"+normalTableList[i].committime.substr(5,6)+"月"+normalTableList[i].committime.substr(8,9)+"日</span></li>");
				}else{
					$('#newNormalRecords').append("<li class='time-label'><span class='bg-blue'>123</span></li>");
				} */

				$('#time' + i).html(normalTableList[i].committime);
				$('#username' + i).html(normalTableList[i].username);
				$('#addressname' + i).html(normalTableList[i].addressname);
				$('#personname' + i).html(normalTableList[i].personname);
				//$('#newNormalRecords').append("<li><i class='fa fa-envelope bg-aqua'></i><div class='timeline-item'><span class='time'> <i class='fa fa-clock-o'></i></span><h3 class='timeline-header no-border'><a href='#'><span>"+normalTableList[i].username+"</span></a> 在 <b><span>"+normalTableList[i].addressname+"</span></b> 核查了 <b><span>"+normalTableList[i].personname+"</span></b></h3></div></li>");
			}
		};
		// 日期比较
		function DateCompare(a, b) {
			var arr = a.split('-');
			var starttime = new Date(arr[0], arr[1], arr[2]);
			var starttimes = starttime.getTime();

			var arrs = b.split('-');
			var endtime = new Date(arrs[0], arrs[1], arrs[2]);
			var endtimes = endtime.getTime();
			if (starttimes > endtimes) {
				return true;
			} else {
				return false;
			}
		};
		// 获取今天日期
		function getTodayDate() {
			var date = new Date();
			var seperator = "-";
			var month = date.getMonth() + 1;
			var strDate = date.getDate();
			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}
			if (strDate >= 0 && strDate <= 9) {
				strDate = "0" + strDate;
			}
			var currentdate = date.getFullYear() + seperator + month
					+ seperator + strDate;
			return currentdate;
		};
		var normalTableList2Weeks = [];
		$.ajax({
			type : 'GET',
			url : 'getNormalRecordsTwoWeek.do',
			dataType : 'json',
			success : function(data) {
				//alert(data.normalrecords+"/"+data.toadynormalrecords);

				normalTableList2Weeks = eval(data.normalTableList2Weeks);
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('main'),
						'macarons');

				// 指定图表的配置项和数据
				var option = {
					title : {
						text : '最近两周核查情况'
					},
					tooltip : {},
					legend : {
						data : [ '核查数' ]
					},
					xAxis : {
						data : [ normalTableList2Weeks[0].normaldate,
								normalTableList2Weeks[1].normaldate,
								normalTableList2Weeks[2].normaldate,
								normalTableList2Weeks[3].normaldate,
								normalTableList2Weeks[4].normaldate,
								normalTableList2Weeks[5].normaldate,
								normalTableList2Weeks[6].normaldate,
								normalTableList2Weeks[7].normaldate,
								normalTableList2Weeks[8].normaldate,
								normalTableList2Weeks[9].normaldate,
								normalTableList2Weeks[10].normaldate,
								normalTableList2Weeks[11].normaldate,
								normalTableList2Weeks[12].normaldate,
								normalTableList2Weeks[13].normaldate ]
					},
					yAxis : {},
					series : [ {
						name : '核查数',
						type : 'line',
						data : [ normalTableList2Weeks[0].normalnum,
								normalTableList2Weeks[1].normalnum,
								normalTableList2Weeks[2].normalnum,
								normalTableList2Weeks[3].normalnum,
								normalTableList2Weeks[4].normalnum,
								normalTableList2Weeks[5].normalnum,
								normalTableList2Weeks[6].normalnum,
								normalTableList2Weeks[7].normalnum,
								normalTableList2Weeks[8].normalnum,
								normalTableList2Weeks[9].normalnum,
								normalTableList2Weeks[10].normalnum,
								normalTableList2Weeks[11].normalnum,
								normalTableList2Weeks[12].normalnum,
								normalTableList2Weeks[13].normalnum ]
					} ]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {

			}
		});
	</script>



</body>
</html>