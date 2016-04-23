package com.cybb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.cybb.domain.Site;

public interface SiteRepo extends CrudRepository<Site, Long>{
	public List<Site> findAll();
	
}
