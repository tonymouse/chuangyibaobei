package com.cybb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.cybb.domain.UserAccess;



public interface UserAccessRepo extends CrudRepository<UserAccess, String>{
	
	@Query("select ua from UserAccess ua where priviledge=:p order by tabId,subTabId")
	public List<UserAccess> findByPriviledge(@Param("p") String priviledge);

}
