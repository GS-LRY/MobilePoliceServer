package tlkj.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import tlkj.model.User;

public class OneMoreFunction {
	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	HttpSession session = request.getSession();
	
	// 判断当前登录用户类型
	public int AdminOrUser(){
		Object sessionUser = session.getAttribute("currentUser") ;
		User currentUser = (User) sessionUser ;
		return currentUser.getUsertype();
	}
}
