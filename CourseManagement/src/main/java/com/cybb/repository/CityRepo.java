package com.cybb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.cybb.domain.City;

public interface CityRepo extends CrudRepository<City, Long>{
	public List<City> findAll();
	
	@Query("select city from City city where cityName=:cityName and cityId <>:cityId")
	public City checkExistCity(@Param("cityId") Long cityId, @Param("cityName") String cityName);
}
