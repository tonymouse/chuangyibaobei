package com.cybb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cybb.domain.User;
import com.cybb.repository.UserRepo;

@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	public User userLogin(String username, String password) {
		User user = userRepo.findByUserName(username);
		if (null == user || !user.password.equals(password)) {			
				return null;
		}
		return user;
	}

}
