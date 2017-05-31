package com.jeju.meoui.filter;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.slf4j.*;

@WebFilter({"/admin/*"})
public class AdminFilter implements Filter {
	private Logger logger= LoggerFactory.getLogger(AdminFilter.class);
	private ArrayList<String> whiteList= new ArrayList<String>();
	//	로그인 없이 접근할 수 있는 경로를 지정
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    	whiteList.add("/meoui/admin/login");
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req= (HttpServletRequest)request;
		HttpServletResponse res= (HttpServletResponse)response;
		HttpSession session= req.getSession();
		String uri= req.getRequestURI();
		String go2= uri;
		String username= (String)session.getAttribute("username");
		if(!whiteList.contains(uri)&& username==null){
			go2= "/meoui/admin/login";
			session.setAttribute("go2", uri);
			if(req.getParameter("username")!=null)
				session.setAttribute("username", req.getParameter("username"));
			res.sendRedirect(go2);
			}
			else{
			// pass the request along the filter chain
			chain.doFilter(request, response);
			}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
