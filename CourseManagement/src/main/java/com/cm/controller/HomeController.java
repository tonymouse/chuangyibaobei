package com.cm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EnableAutoConfiguration
public class HomeController {
	
	
	@RequestMapping(value="/index")
	public String login(HttpSession session) {
		if(session.getAttribute("user")==null||"".equals(session.getAttribute("user"))){
			return "login";
		}else{
			return "index";
		}
	
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
	    return "login";		
	
	}
	
}
