package com.cybb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cybb.domain.User;
import com.cybb.service.UserService;

@RestController  
 
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login", method = RequestMethod.POST) 
	@ResponseBody
	public Object login(String username, String password, HttpSession session) {   
		Map<String, Object> model = new HashMap<String, Object>();
		User user = userService.userLogin(username, password);
        if(user!= null){
            session.setAttribute("user", user.nickName);
            return "index";
        }else{
            model.put("msg", "failed");       
        return model;  
        } 
	}
}
