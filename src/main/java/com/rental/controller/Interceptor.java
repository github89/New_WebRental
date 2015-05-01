package com.rental.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.rental.model.User;

@Controller
public class Interceptor extends HandlerInterceptorAdapter {

	static Log log = LogFactory.getLog(Interceptor.class);
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		session.getAttribute("user");
		
		log.info("################################################");
		log.info(session.getId());
		log.info(session.getAttribute("user"));
		log.info("################################################");

		if ((session.getAttribute("user") == null)) {
			log.info("################################################");
			log.info("                  interceptor                   ");
			log.info("################################################");
			response.sendRedirect("http://localhost:8080/WebRental/webapp/login/login");
			return false;
		}
		return true;
	}
}
