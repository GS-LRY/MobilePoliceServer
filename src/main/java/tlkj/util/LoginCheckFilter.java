package tlkj.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		request.setCharacterEncoding("UTF-8");//设置字符编码
        response.setCharacterEncoding("UTF-8");
        res.setHeader("Pragma", "No-cache");//禁止缓存
        res.setHeader("Cache-Control","no-cache");
        res.setHeader("Expires", "0");
        PrintWriter out=res.getWriter();
        HttpSession session=req.getSession();
        if(session.getAttribute("currentUser")!=null){
            chain.doFilter(request, response);
        }
        else{
               out.println("<script>alert('您没有登录登录，请先登录！');this.location.replace('../login.jsp','_parent'); </script>");
        
        }
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
