package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import tlkj.json.JsonUtil;
import tlkj.model.NormalTable;
import tlkj.model.User;
import tlkj.model.UserTable;
import tlkj.service.UserService;
import tlkj.util.MD5Util;

@Controller
public class UserController {
	private UserService userService;
	private JsonUtil jsonutil = new JsonUtil();

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("updateUserPassword.do")
	public void updateUserPassword(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		String password = request.getParameter("password");
		Object sessionUser = session.getAttribute("currentUser") ;
		User currentUser = (User) sessionUser ;
		User user = null;
		user = currentUser;
		user.setPassword(MD5Util.convertMD5(password));
		int num = userService.updateByPrimaryKeySelective(user);
		String jsondata = "fail";
		if(num > 0){
			jsondata = "success";
			user = userService.existsPoliceNum(currentUser.getPolicenum());
			if(user!=null){
				session.setAttribute("currentUser", user);
			}
		}else{
			jsondata = "fail";
		}
		Map map = new HashMap();
		map.put("result", jsondata);
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping("updateUser.do")
	public void updateUser(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		String username = request.getParameter("username");
		String idCard = request.getParameter("idCard");
		String job = request.getParameter("job");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String departmentId = request.getParameter("departmentId");
		User user = null;
		String jsondata = "userexits_idcard";
		user = userService.existsIdCard(idCard);
		Object sessionUser = session.getAttribute("currentUser") ;
		User currentUser = (User) sessionUser ;
		if(user!=null&&user.getId()!=currentUser.getId()){
			jsondata = "userexits_idcard";
		}else{
			user = new User();
			user.setId(currentUser.getId());
			user.setPolicenum(currentUser.getPolicenum());
			//user.setPassword(MD5Util.MD5("111111"));
			user.setUsername(username);
			user.setIdcard(idCard);
			user.setJob(job);
			user.setPhone(phone);
			user.setTel(phone);
			user.setDepartmentid(Integer.parseInt(departmentId));
			user.setEmail(email);
			//user.setIsusing(1);
			//user.setLocked(0);
			//user.setRegisttime(new Date());
			int num = userService.updateByPrimaryKeySelective(user);
			if(num > 0){
				jsondata = "success";
				user = userService.existsPoliceNum(currentUser.getPolicenum());
				if(user!=null){
					session.setAttribute("currentUser", user);
				}
			}else{
				jsondata = "fail";
			}
		}
		Map map = new HashMap();
		map.put("result", jsondata);
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping("addUser.do")
	public void addUser(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		String policeNum = request.getParameter("policeNum");
		String username = request.getParameter("username");
		String idCard = request.getParameter("idCard");
		String job = request.getParameter("job");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String userType = request.getParameter("userType");
		String departmentId = request.getParameter("departmentId");
		
		User user = null;
		user = userService.existsPoliceNum(policeNum);
		String jsondata = "userexits_policenum";
		if(user!=null){
			jsondata = "userexits_policenum";
		}else{
			user = userService.existsIdCard(idCard);
			if(user!=null){
				jsondata = "userexits_idcard";
			}else{
				user = new User();
				user.setId(null);
				user.setPolicenum(policeNum);
				user.setPassword(MD5Util.convertMD5("111111"));
				user.setUsername(username);
				user.setIdcard(idCard);
				user.setJob(job);
				user.setPhone(phone);
				user.setTel(phone);
				user.setUsertype(Integer.parseInt(userType));
				user.setDepartmentid(Integer.parseInt(departmentId));
				user.setEmail(email);
				user.setIsusing(1);
				user.setLocked(0);
				user.setRegisttime(new Date());
				Object sessionUser = session.getAttribute("currentUser") ;
				User currentUser = (User) sessionUser ;
				user.setCreaterid(currentUser.getId());
				
				int num = userService.insertSelective(user);
				if(num > 0){
					jsondata = "success";
				}else{
					jsondata = "fail";
				}
			}
		}
		Map map = new HashMap();
		map.put("result", jsondata);
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping("searchUser.do")
	public void searchUser(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		String param = new String(request.getParameter("XmOrSfzh").getBytes("iso8859-1"), "utf-8");
		// System.out.println("齐天大圣多威风："+param);
		List<UserTable> userTableList = null;
		userTableList = userService.searchUser(param, param, param);
		String jsondata = "nouser";
		Map map = new HashMap();
		if (userTableList.size() > 0) {
			jsondata = jsonutil.ListToJSON(userTableList);
		}

		map.put("jsondata", jsondata);
		// if (jsondata == "" || jsonutil == null) {
		// jsondata = "false";
		// }
		outputJson(response, jsonutil.MapToJSON(map));
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping("getAllUser.do")
	public void getAllUser(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
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
		List<UserTable> userTableList = null;
		if (searchParam == null) {
			userTableList = userService.getAllUser();
		} else {
			userTableList = userService.searchUser(searchParam, searchParam, searchParam);
		}

		count = userTableList.size();
		UserTable userTable = null;
		for (int i = 0; i < count; i++) {
			userTable = userTableList.get(i);
			jsonObject2.put("policenum", userTable.getPolicenum());
			jsonObject2.put("username", userTable.getUsername());
			jsonObject2.put("idcard", userTable.getIdcard());
			jsonObject2.put("job", userTable.getJob());
			jsonObject2.put("phone", userTable.getPhone());
			if(userTable.getEmail()==null){
				jsonObject2.put("email","未填写");
			}else{
				jsonObject2.put("email",userTable.getEmail());
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String registtime = sdf.format(userTable.getRegisttime());
			jsonObject2.put("registtime",registtime);
			if(userTable.getLastlogintime()==null){
				jsonObject2.put("lastlogintime","警员未曾登录过");
			}else{
				String lastlogintime = sdf.format(userTable.getLastlogintime());
				jsonObject2.put("lastlogintime",lastlogintime);
			}
			jsonObject2.put("departmentname",userTable.getDepartmentname());
			if(userTable.getIsusing()==0){
				jsonObject2.put("isusing", "未启用");
			}else{
				jsonObject2.put("isusing", "已启用");
			}
			if(userTable.getLocked()==0){
				jsonObject2.put("locked", "未锁定");
			}else {
				jsonObject2.put("locked", "已锁定");
			}
			jsonArray2.add(jsonObject2);
		}
		// String jsondata = jsonutil.ListToJSON(escapedList);
		String json = "{\"sEcho\":" + initEcho + ",\"iTotalRecords\":" + count + ",\"iTotalDisplayRecords\":" + count
				+ ",\"aaData\":" + jsonArray2 + "}";
		outputJson(response, json);
	}
	
	@RequestMapping("login.do")
	public void login(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		System.out.println("username"+username);
//		System.out.println("password"+password);
		String result = userService.login(username, password);
		Map map=new HashMap();
		if(result=="success"){
			User user = userService.getUserByPoliceNumOrIdCard(username, username);
			session.setAttribute("currentUser", user);
			map.put("result", "success");
		}else{
			map.put("result", result);
		}
		
		JsonUtil jsonutil = new JsonUtil();
		response.getWriter().print(jsonutil.MapToJSON(map));
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
