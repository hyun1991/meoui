package com.jeju.meoui.util;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.security.core.*;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.savedrequest.*;

import com.google.gson.*;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		map.put("username", authentication.getName());
		String jsonString = new Gson().toJson(map);
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
}
