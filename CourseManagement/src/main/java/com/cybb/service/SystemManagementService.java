package com.cybb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cybb.domain.City;
import com.cybb.repository.CityRepo;
import com.cybb.util.ListUtil;

@Service
public class SystemManagementService {
	
	@Autowired
	private CityRepo cityRepo;

	
	public List<City> getAllCities() {
		List<City> cityList = ListUtil.checkNullOrEmpty(cityRepo.findAll());
		return cityList;
	}
	
	public String isExistCity(Long cityId, String cityName) {
		String message = null;
		City city = cityRepo.checkExistCity(cityId, cityName);
		if(city!=null && !"".equals(city.getCityName())){
			message = "failed";
		}else{
			message= "success";
		}
		return message;
	}
	
	public void saveCity(Long cityId, String cityName) {
		
		City city = new City();
		if(cityId != 0){
			city.setCityId(cityId);
		}
		city.setCityName(cityName);
		city.setIsActive("Y");
		cityRepo.save(city);
		
	}
}
