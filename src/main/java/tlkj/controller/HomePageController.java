package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tlkj.json.JsonUtil;
import tlkj.model.NormalTable;
import tlkj.model.NormalTwoWeek;
import tlkj.service.DepartmentService;
import tlkj.service.EscapedService;
import tlkj.service.NormalService;
import tlkj.service.UserService;

@Controller
public class HomePageController {
	private EscapedService escapedService;
	private DepartmentService departmentService;
	private NormalService normalService;
	private UserService userService;
	private JsonUtil jsonutil = new JsonUtil();
	public EscapedService getEscapedService() {
		return escapedService;
	}
	@Autowired
	public void setEscapedService(EscapedService escapedService) {
		this.escapedService = escapedService;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	@Autowired
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public NormalService getNormalService() {
		return normalService;
	}
	@Autowired
	public void setNormalService(NormalService normalService) {
		this.normalService = normalService;
	}
	public UserService getUserService() {
		return userService;
	}
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@RequestMapping("getHomePageNeedData.do")
	public void getHomePageNeedData(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		// 获取服务器运行开始到今天为止核查总数
		int normalrecords = normalService.getAllNormal().size();
		
		// 获取今天核查数量
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String todayCommitTime = sdf.format(new Date());
		int toadynormalrecords = normalService.getTodayNormalRecordsNum(todayCommitTime);
		
		// 获取今天核查到的在逃或重点人员数
		int toadyescapednormalrecords = normalService.getTodayEscapedNormalRecordsNum(todayCommitTime);
		
		// 获取核查到的重点人员总数
		int escapednormalrecords = normalService.getTodayEscapedNormalRecordsNum("1970-01-01");
		
		// 获取最新的核查记录
		List<NormalTable> normalTableList = null;
		normalTableList = normalService.getNewNormalRecords();
		
		Map map = new HashMap();
		map.put("normalrecords", normalrecords);
		map.put("toadyescapednormalrecords", toadyescapednormalrecords);
		map.put("escapednormalrecords", escapednormalrecords);
		map.put("toadynormalrecords", toadynormalrecords);
		map.put("normalTableList", jsonutil.ListToJSON(normalTableList));
		
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping("getNormalRecordsTwoWeek.do")
	public void getNormalRecordsTwoWeek(HttpServletRequest request, HttpServletResponse response){
		// 获取今天日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String todayCommitDate = sdf.format(new Date());
		// 计算两周前的日期
		String twoweekagoDate = sdf.format((new Date()).getTime()-14*24*60*60*1000);
		// 获取最近两周核查记录统计
		List<NormalTwoWeek> normalTwoWeekRecordsNum = new ArrayList<NormalTwoWeek>();
		normalTwoWeekRecordsNum = normalService.getNormalRecordsTwoWeek(twoweekagoDate, todayCommitDate);
		// 初始化
		List<NormalTwoWeek> normalTableList2Weeks = new ArrayList<NormalTwoWeek>();
		NormalTwoWeek ntw = null;
		NormalTwoWeek ntws = null;
		String thisDate = null;
		Date todaydate = new Date();
		for (int i = 13; i >=0; i--) {
			thisDate = sdf.format(todaydate.getTime()-(i+1)*24*60*60*1000);
			ntw = new NormalTwoWeek();
			ntw.setNormaldate(thisDate);
			ntw.setNormalnum(0);
			normalTableList2Weeks.add(ntw);
		}
		for (int i = 0; i < normalTwoWeekRecordsNum.size(); i++) {
			ntws = normalTwoWeekRecordsNum.get(i);
			for (int j = 0; j < normalTableList2Weeks.size(); j++) {
				ntw = normalTableList2Weeks.get(j);
				if (ntws.getNormaldate().equals(ntw.getNormaldate())) {
					ntw.setNormalnum(ntws.getNormalnum());
					break;
				}
			}
		}
		Map map = new HashMap();
		map.put("normalTableList2Weeks", jsonutil.ListToJSON(normalTableList2Weeks));
		System.out.println(jsonutil.MapToJSON(map));
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	private void outputJson(HttpServletResponse response, String result) {
		response.setContentType("text/javascript;charset=UTF-8");
		response.setHeader("Cache-Control", "no-store, max-age=0, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		try {
			PrintWriter out = response.getWriter();
			try {
				out.write(result);
			} finally {
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
