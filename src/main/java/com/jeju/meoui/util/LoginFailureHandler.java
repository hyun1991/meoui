package com.jeju.meoui.util;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.security.core.*;
import org.springframework.security.web.authentication.*;

import com.google.gson.*;

public class LoginFailureHandler implements AuthenticationFailureHandler {
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		String jsonString = new Gson().toJson(map);
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
}