package com.cm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cm.domain.User;
import com.cm.repository.UserRepo;

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
