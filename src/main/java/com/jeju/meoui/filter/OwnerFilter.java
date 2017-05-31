package com.jeju.meoui.filter;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.slf4j.*;

@WebFilter({"/manage/*","/menage/*"})
public class OwnerFilter implements Filter {
	private Logger logger= LoggerFactory.getLogger(OwnerFilter.class);
	private ArrayList<String> whiteList= new ArrayList<String>();
	//	로그인 없이 접근할 수 있는 경로를 지정
    public OwnerFilter() {
        // TODO Auto-generated constructor stub
    	whiteList.add("/meoui/manage/login");
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
		String go3= uri;
		String ownerId= (String)session.getAttribute("ownerId");	//	사용자아이디
		if(!whiteList.contains(uri)&& ownerId==null){
			go3= "/meoui/manage/login";
			session.setAttribute("go3", uri);
			if(req.getParameter("ownerId")!=null)
				session.setAttribute("ownerId", req.getParameter("ownerId"));
			res.sendRedirect(go3);
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
