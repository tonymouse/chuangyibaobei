package com.cybb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;




import org.springframework.web.servlet.ModelAndView;

import com.cybb.domain.City;
import com.cybb.service.SystemManagementService;


@Controller  
 
public class SystemManagementController {
	
	@Autowired
	private SystemManagementService systemService;
	
	@RequestMapping(value="/system/cityManagement", method = RequestMethod.POST) 
	@ResponseBody
	public ModelAndView cityManagement() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<City> cityList = systemService.getAllCities();
		model.put("cityList", cityList);
        return new ModelAndView("cityManagement",model);  
        } 
	
	@RequestMapping(value="/system/cityManagement/saveCity", method = RequestMethod.POST) 
	@ResponseBody
	public Object checkExistCity(String cityId, String cityName) {
		String status = null;
		long id = 0;
		if(cityId != null && !"".equals(cityId)){
			id = Long.parseLong(cityId);
		}
		status = systemService.isExistCity(id, cityName);  
		if("failed".equals(status)){
			return status;
		}else{
			systemService.saveCity(id, cityName);
			return cityManagement();
		}
		
        } 
}
