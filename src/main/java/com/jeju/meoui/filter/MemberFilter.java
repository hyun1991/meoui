package com.jeju.meoui.filter;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.slf4j.*;

@WebFilter({"/accommodationComment/*","/accommodation/*","/accommodaion/*","/site/*","/freeboardComment/*","/meetingboard/*","/membermeeting/*","/metingcomment/*","/member/*","/message/*","/noticecomment/*","/reserve/*","/room/*","/siteComment/*","/ticket/*","/schedule/*","/notice/*", "/freeboard/*"})
public class MemberFilter implements Filter {
	private Logger logger= LoggerFactory.getLogger(MemberFilter.class);
	private ArrayList<String> whiteList= new ArrayList<String>();
	//	로그인 없이 접근할 수 있는 경로를 지정
    public MemberFilter() {
        // TODO Auto-generated constructor stub
    	whiteList.add("/meoui/");
    	whiteList.add("/meoui/notice/list");
    	whiteList.add("/meoui/admin/login");
    	whiteList.add("/meoui/member/logout");
    	whiteList.add("/meoui/member/login");
    	whiteList.add("/meoui/member/join");
    	whiteList.add("/meoui/member/check");
    	whiteList.add("/meoui/member/pwsearch");
    	whiteList.add("/meoui/member/idsearch");
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
		String go= uri;
		String memberId= (String)session.getAttribute("memberId");	//	사용자아이디
		if(!whiteList.contains(uri)&& memberId==null){
			go= "/meoui/";
			session.setAttribute("go", uri);
			if(req.getParameter("memberId")!=null)
				session.setAttribute("memberId", req.getParameter("memberId"));
			res.sendRedirect(go);
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
