var alarmTimer = function(interval_period){
	var _this = this ;
	var sysTimer;
	var flash_timer;
	var step = 0;
	var page_load_time = new Date();
	this.period_time = interval_period ;
	this.old_title = document.title;
	this.date_format = function(date, fmt) {
		var o = {
			"M+" : date.getMonth() + 1, // 月份
			"d+" : date.getDate(), // 日
			"h+" : date.getHours(), // 小时
			"H+" : date.getHours(), // 小时
			"m+" : date.getMinutes(), // 分
			"s+" : date.getSeconds(), // 秒
			"q+" : Math.floor((date.getMonth() + 3) / 3), // 季度
			"S" : date.getMilliseconds()
		// 毫秒
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	};
	this.flash_title = function() {
		step++;
		if (step == 3) {
			step = 1;
		}
		if (step == 1) {
			document.title = "[请尽快处理]有新的报警信息";
		}
		if (step == 2) {
			document.title = "            有新的报警信息";
		}
		_this.flash_timer = setTimeout(_this.flash_title, 1000);
	};
	
	this.generate = function(type, layout) {
		var n = noty({
			text : type,
			type : type,
			dismissQueue : true,
			layout : layout,
			theme : 'defaultTheme',
			buttons : [ {
				addClass : 'btn btn-primary',
				text : '查看',
				onClick : function($noty) {
					$noty.close();
					
					window.clearTimeout(_this.flash_timer);
					
					document.title = _this.old_title;
					window.location.href="alarm.htm";
				}
			},{
				addClass : 'btn btn-danger',
				text : '知道了',
				onClick : function($noty) {
					$noty.close();
					window.clearTimeout(_this.flash_timer);
					document.title = _this.old_title;
					
				}
			} ]
		});
	};
	
	this.checkAlarm = function() {
		$.post("syncAlarm.json", {
			"curTime" : _this.date_format(page_load_time, "yyyyMMddHHmmss")
		}, function(result) {
			if (result.resultCode === "000") {
				page_load_time = new Date();
				result.alarms.forEach(function(alarm){
					_this.generate(alarm.hDXGXX+'。【'+alarm.bZ+'】', 'bottomRight');
				}) ;
				
				_this.flash_title();
			}
		});
	};
	
	
	
	this.setPeriod = function(period){
		window.clearInterval(sysTimer) ;
		sysTimer = setInterval(_this.checkAlarm, period);
		_this.period_time = period ;
	} ;
	
	this.getPeriod = function(){
		return _this.period_time ; 
	}
	sysTimer = setInterval(this.checkAlarm, interval_period);
} ;

	
