package com.cybb.repository;

import org.springframework.data.repository.CrudRepository;

import com.cybb.domain.User;

public interface UserRepo extends CrudRepository<User, Long>{
	
	public User findByUserName(String userName);

}
