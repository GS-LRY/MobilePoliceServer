package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;

import tlkj.json.JsonUtil;
import tlkj.model.Department;
import tlkj.service.DepartmentService;

@Controller
public class DepartmentController {
	private DepartmentService departmentService;
	private JsonUtil jsonutil = new JsonUtil();
	
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	@Autowired
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	@RequestMapping("getAllDepartment.do")
	public void getAllDepartment(HttpServletRequest request, HttpServletResponse response){
		List<Department> departmentList = departmentService.getAllDepartment();
		Map map = new HashMap();
		String jsondata = jsonutil.ListToJSON(departmentList);
		map.put("departments", jsondata);
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
