package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tlkj.json.JsonUtil;
import tlkj.model.Escaped;
import tlkj.service.EscapedService;

@Controller
public class EscapedController {
	private EscapedService escapedService;
	private JsonUtil jsonutil = new JsonUtil();

	public EscapedService getEscapedService() {
		return escapedService;
	}

	@Autowired
	public void setEscapedService(EscapedService escapedService) {
		this.escapedService = escapedService;
	}

	@RequestMapping(value = "getEscapedHundred", method = RequestMethod.POST)
	@ResponseBody
	public void getEscapedRecord_Hundred(HttpServletRequest request, HttpServletResponse response) {
		List<Escaped> escapedList = null;
		escapedList = escapedService.getHundredRecord();
		String jsondata = jsonutil.ListToJSON(escapedList);
		if (jsondata == "" || jsonutil == null) {
			jsondata = "false";
		}
		outputJson(response, jsondata);
		response.setStatus(HttpServletResponse.SC_OK);
	}

	@RequestMapping("searchEscapedByXmOrSfzh.do")
	public void SearchEscapedByXmOrSfzh(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		String param = new String(request.getParameter("XmOrSfzh").getBytes("iso8859-1"),"utf-8");
		//System.out.println("齐天大圣多威风："+param);
		List<Escaped> escapedList = null;
		escapedList = escapedService.searchEscaped(param,param);
		String jsondata = "nouser";
		Map map = new HashMap();
		if(escapedList.size()>0){
			jsondata = jsonutil.ListToJSON(escapedList);
		}
		
		map.put("jsondata", jsondata);
//		if (jsondata == "" || jsonutil == null) {
//			jsondata = "false";
//		}
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping("getAllEscapedRecord.do")
	public void getAllEscapedRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String statName =null;
		String sEcho = "0";//记录操作的次数
		String iDisplayStart = "0";//起始
		String iDisplayLength = "10";//size
		int count = 0;//查询出来的数量
		String aoData = request.getParameter("aoData");
		String searchParam = request.getParameter("XmOrSfzh");
		if(searchParam!=null){
			searchParam =  new String(request.getParameter("XmOrSfzh").getBytes("iso8859-1"),"utf-8");
		}
		// 获取JQuery datatables当前配置参数
		JSONArray jsonArray = JSONArray.fromObject(aoData);
		for (int i = 0; i < jsonArray.size(); i++) {
			try {
				JSONObject jsonObject = (JSONObject)jsonArray.get(i);
				if (jsonObject.get("name").equals("sEcho")) {
					sEcho = jsonObject.get("value").toString();
				}else if(jsonObject.get("name").equals("iDisplayStart")){
					iDisplayStart = jsonObject.get("value").toString();
				}else if(jsonObject.get("name").equals("iDisplayLength")){
					iDisplayLength = jsonObject.get("value").toString();
				}else if(jsonObject.get("name").equals("startId")){
					statName = jsonObject.get("value").toString();
				}
			} catch (Exception e) {
				break;
			}
		}

		JSONArray jsonArray2 = new JSONArray();
		JSONObject jsonObject2 = new JSONObject();
		
		int initEcho = Integer.parseInt(sEcho)+1;
		List<Escaped> escapedList = null;
		if(searchParam==null){
			escapedList = escapedService.getAllRecord();
		}else{
			escapedList = escapedService.searchEscaped(searchParam, searchParam);
		}
		
		count = escapedList.size();
		Escaped escaped = null;
		for (int i = 0; i < count; i++) {
			escaped = escapedList.get(i);
			jsonObject2.put("id", escaped.getId());
			jsonObject2.put("xm", escaped.getXm());
			jsonObject2.put("xb", escaped.getXb());
			jsonObject2.put("sfzh", escaped.getSfzh());
			jsonObject2.put("zdryxl", escaped.getZdryxl());
			jsonObject2.put("hjdxz", escaped.getHjdxz());
			jsonObject2.put("xzdxz", escaped.getXzdxz());
			jsonObject2.put("ladw", escaped.getLadw());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strzjlasj = sdf.format(escaped.getZjlasj());
			jsonObject2.put("zjlasj", strzjlasj);
			String strnrbjzdryksj = sdf.format(escaped.getNrbjzdryksj());
			jsonObject2.put("nrbjzdryksj", strnrbjzdryksj);
			jsonArray2.add(jsonObject2);
		}
		//String jsondata = jsonutil.ListToJSON(escapedList);
		String json = "{\"sEcho\":" + initEcho + ",\"iTotalRecords\":" + count + ",\"iTotalDisplayRecords\":" + count + ",\"aaData\":" + jsonArray2 + "}";  
		outputJson(response, json);
	}

	@RequestMapping("addEscapedRecord.do")
	public void addEscapedRecord(HttpServletRequest request, HttpServletResponse response)
			throws ParseException, IOException {
		String xm = request.getParameter("xm");
		String xb = request.getParameter("xb");
		String sfzh = request.getParameter("sfzh");
		String zdrylbbj = request.getParameter("zdrylbbj");
		String zdryxl = request.getParameter("zdryxl");
		String ladw = request.getParameter("ladw");
		String nrbjzdryksj = request.getParameter("nrbjzdryksj");
		String hjdqh = request.getParameter("hjdqh");
		String hjdxz = request.getParameter("hjdxz");
		String xzdqh = request.getParameter("xzdqh");
		String xzdxz = request.getParameter("xzdxz");
		String zjlasj = request.getParameter("zjlasj");

		Escaped escaped = new Escaped();
		escaped.setId(null);
		escaped.setXm(xm);
		escaped.setXb(xb);
		escaped.setSfzh(sfzh);
		escaped.setZdrylbbj(zdrylbbj);
		escaped.setZdryxl(zdryxl);
		escaped.setLadw(ladw);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date nrbjzdryksj_date = sdf.parse(nrbjzdryksj);
		escaped.setNrbjzdryksj(nrbjzdryksj_date);
		escaped.setHjdqh(hjdqh);
		escaped.setHjdxz(hjdxz);
		escaped.setXzdqh(xzdqh);
		escaped.setXzdxz(xzdxz);
		Date zjlasj_date = sdf.parse(zjlasj);
		escaped.setZjlasj(zjlasj_date);
		Escaped escapedexist = null;
		escapedexist = escapedService.selectByPersonId(sfzh);
		String result = "fail";
		Map map = new HashMap();
		if (escapedexist == null) {
			int num = escapedService.insertEscaped(escaped);

			if (num > 0) {
				result = "success";
			}

		} else {
			result = "exist";
		}
		map.put("result", result);

		JsonUtil jsonutil = new JsonUtil();
		System.out.println("Map转JSON：" + jsonutil.MapToJSON(map));
		response.getWriter().print(jsonutil.MapToJSON(map));
	}

	@RequestMapping(value = "compareEscapedByPersonId", method = RequestMethod.POST)
	@ResponseBody
	public void compareEscapedByPersonId(HttpServletRequest request, HttpServletResponse response) {
		String personId = request.getParameter("jsondata");
		System.out.println("需要比对的身份证号：" + personId);
		ArrayList<Escaped> escapedList = new ArrayList<Escaped>();
		Escaped escaped = escapedService.selectByPersonId(personId);
		escapedList.add(escaped);
		String result = jsonutil.ListToJSON(escapedList);
		if (escaped == null) {
			result = "false";
		}
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
