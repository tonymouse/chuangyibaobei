package com.cm.repository;

import org.springframework.data.repository.CrudRepository;

import com.cm.domain.User;

public interface UserRepo extends CrudRepository<User, Long>{
	
	public User findByUserName(String userName);

}
