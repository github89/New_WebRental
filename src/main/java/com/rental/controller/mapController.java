package com.rental.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Servlet implementation class home
 */
@Controller
@RequestMapping("/page")
public class mapController{
	@Autowired
	DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@RequestMapping(value="/map", method=RequestMethod.GET)
    public String Home() {
		
        return "/page/map";
    }

}
