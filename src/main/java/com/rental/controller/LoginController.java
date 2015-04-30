package com.rental.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rental.dao.LoginDao;
import com.rental.model.User;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	static Log log = LogFactory.getLog(LoginController.class);
	
	@Autowired
	LoginDao loginDao;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		
		log.info("#############################");
		log.info("login() GET...");
		log.info("#############################");
		
		return "login/loginform";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, HttpSession session) {
		
		log.info("#############################");
		log.info("login() POST... " );
		log.info("id = " + user.getId());
		log.info("password = " + user.getPassword());
		log.info("#############################");
		
		User returnedUser = loginDao.getUserInfo(user.getId());
		
		log.info("#############################");
		log.info("쿼리 검증" );
		log.info("id = " + returnedUser.getId());
		log.info("password = " + returnedUser.getPassword());
		log.info("#############################");
		
		if (user.getId().equals(returnedUser.getId()) && user.getPassword().equals(returnedUser.getPassword())) {
			session.setAttribute("user", user);
			return "login/success";
		} else { 
			return "redirect:login";
		}
			
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "login/logoutsuccess";
	}
}
