package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tlkj.json.JsonUtil;
import tlkj.model.Escaped;
import tlkj.model.Normal;
import tlkj.model.NormalTable;
import tlkj.service.NormalService;

@Controller
public class NormalController {

	private NormalService normalService;
	private JsonUtil jsonutil = new JsonUtil();
	
	public NormalService getNormalService() {
		return normalService;
	}

	@Autowired
	public void setNormalService(NormalService normalService) {
		this.normalService = normalService;
	}

	@RequestMapping("/showNormal/{id}")
	public String showNormal(@PathVariable int id, HttpServletRequest request) {
		Normal n = normalService.getNormalById(id);
		request.setAttribute("user", n);
		return "showNormal";
	}

	@RequestMapping("searchNoramlRecord.do")
	public void searchNormalRecord(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String param = new String(request.getParameter("XmOrSfzh").getBytes("iso8859-1"),"utf-8");
		//System.out.println("齐天大圣多威风："+param);
		List<NormalTable> normalTableList = null;
		normalTableList = normalService.searchNormalRecord(param, param, param, param, param, param);
		String jsondata = "nouser";
		Map map = new HashMap();
		if(normalTableList.size()>0){
			jsondata = jsonutil.ListToJSON(normalTableList);
		}
		
		map.put("jsondata", jsondata);
//		if (jsondata == "" || jsonutil == null) {
//			jsondata = "false";
//		}
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}

	@RequestMapping("getNormalRecords.do")
	public void getNormalRecords(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String statName = null;
		String sEcho = "0";// 记录操作的次数
		String iDisplayStart = "0";// 起始
		String iDisplayLength = "10";// size
		int count = 0;// 查询出来的数量
		String aoData = request.getParameter("aoData");
		String searchParam = request.getParameter("XmOrSfzh");
		if (searchParam != null) {
			searchParam = new String(request.getParameter("XmOrSfzh").getBytes("iso8859-1"), "utf-8");
		}
		// 获取JQuery datatables当前配置参数
		JSONArray jsonArray = JSONArray.fromObject(aoData);
		for (int i = 0; i < jsonArray.size(); i++) {
			try {
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				if (jsonObject.get("name").equals("sEcho")) {
					sEcho = jsonObject.get("value").toString();
				} else if (jsonObject.get("name").equals("iDisplayStart")) {
					iDisplayStart = jsonObject.get("value").toString();
				} else if (jsonObject.get("name").equals("iDisplayLength")) {
					iDisplayLength = jsonObject.get("value").toString();
				} else if (jsonObject.get("name").equals("startId")) {
					statName = jsonObject.get("value").toString();
				}
			} catch (Exception e) {
				break;
			}
		}

		JSONArray jsonArray2 = new JSONArray();
		JSONObject jsonObject2 = new JSONObject();

		int initEcho = Integer.parseInt(sEcho) + 1;
		List<NormalTable> normalTableList = null;
		if (searchParam == null) {
			normalTableList = normalService.getAll();
		} else {
			normalTableList = normalService.searchNormalRecord(searchParam, searchParam, searchParam, searchParam,
					searchParam, searchParam);
		}

		count = normalTableList.size();
		NormalTable normalTable = null;
		for (int i = 0; i < count; i++) {
			normalTable = normalTableList.get(i);
			System.out.println("personName" + normalTable.getPersonname());
			System.out.println("personId" + normalTable.getPersonid());
			System.out.println("addressName" + normalTable.getAddressname());
			System.out.println("commitTime" + normalTable.getCommittime());
			System.out.println("username" + normalTable.getUsername());
			System.out.println("name" + normalTable.getName());
			jsonObject2.put("personName", normalTable.getPersonname());
			jsonObject2.put("personId", normalTable.getPersonid());
			jsonObject2.put("addressName", normalTable.getAddressname());
			jsonObject2.put("commitTime", normalTable.getCommittime());
			jsonObject2.put("username", normalTable.getUsername());
			jsonObject2.put("name", normalTable.getName());
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// String strzjlasj = sdf.format(escaped.getZjlasj());
			// jsonObject2.put("zjlasj", strzjlasj);
			// String strnrbjzdryksj = sdf.format(escaped.getNrbjzdryksj());
			// jsonObject2.put("nrbjzdryksj", strnrbjzdryksj);
			jsonArray2.add(jsonObject2);
		}
		// String jsondata = jsonutil.ListToJSON(escapedList);
		String json = "{\"sEcho\":" + initEcho + ",\"iTotalRecords\":" + count + ",\"iTotalDisplayRecords\":" + count
				+ ",\"aaData\":" + jsonArray2 + "}";
		outputJson(response, json);
	}

	@RequestMapping(value = "addNormal", method = RequestMethod.POST)
	@ResponseBody
	public void addNormalRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String jsondata = request.getParameter("jsondata");
		System.out.println("数据：" + jsondata);
		ArrayList<Normal> list = jsonutil.StringFromJSON(jsondata);
		Normal record = null;
		// System.out.println(list.size());
		List<Normal> norlist = null;
		ArrayList<String> errorNormalRecord = null;
		String result = "true";
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				record = list.get(i);
				record.setId(null);
				// 插入之前查询记录数
				norlist = normalService.getAllNormal();
				int before_normal_num = norlist.size();
				System.out.println("before_normal_num:" + before_normal_num);
				// 插入记录
				normalService.AddNormalRecord(record);
				// 插入之后查询记录数
				norlist = normalService.getAllNormal();
				int after_normal_num = norlist.size();
				System.out.println("after_normal_num:" + after_normal_num);
				if (after_normal_num == before_normal_num) {
					result = "false";
					// result = "身份证号为"+record.getPersonid()+"的记录插入错误";
					// errorNormalRecord.add(result);
				}
			}
		} else {
			result = "您的设备上核录信息已经全部提交完毕，不需要重复提交，谢谢！";
		}

		// if(errorNormalRecord.size()==0){
		// errorNormalRecord.add(result);
		// }
		// result = jsonutil.ListToJSON(errorNormalRecord);
		outputJson(response, result);
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
