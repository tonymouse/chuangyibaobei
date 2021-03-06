package com.cybb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cybb.domain.City;
import com.cybb.domain.Site;
import com.cybb.repository.CityRepo;
import com.cybb.repository.SiteRepo;
import com.cybb.util.ListUtil;

@Service
public class SystemManagementService {
	
	@Autowired
	private CityRepo cityRepo;
	
	@Autowired
	private SiteRepo siteRepo;

	
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
	
	public List<Site> getAllSites() {
		List<Site> siteList = ListUtil.checkNullOrEmpty(siteRepo.findAll());
		return siteList;
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
