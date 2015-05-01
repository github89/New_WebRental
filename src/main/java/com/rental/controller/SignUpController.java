package com.rental.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rental.dao.SignUpDao;
import com.rental.model.User;

@Controller
@RequestMapping("/signup")
public class SignUpController {
	
	static Log log = LogFactory.getLog(SignUpController.class);
	
	@Autowired
	SignUpDao signUpDao;
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signUp() {		
	
		log.info("##########################################");
		log.info("signUp() GET...");
		log.info("##########################################");
		
		return "signup/signupform";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signUp(User user, HttpSession session) {		
	
		log.info("##########################################");
		log.info("signUp() POST...");
		log.info("##########################################");
		
		signUpDao.insertUserInfo(user);
		
		session.setAttribute("user", user);
		
		return "signup/success";
		
	}

}
