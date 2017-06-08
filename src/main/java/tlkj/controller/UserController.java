package tlkj.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tlkj.json.JsonUtil;
import tlkj.service.UserService;

@Controller
public class UserController {
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("login.do")
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username"+username);
		System.out.println("password"+password);
		String result = userService.login(username, password);
		Map map=new HashMap();
		if(result=="success"){
			map.put("result", "success");
		}else{
			map.put("result", result);
		}
		
		JsonUtil jsonutil = new JsonUtil();
		response.getWriter().print(jsonutil.MapToJSON(map));
	}
	
}
