package com.cybb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cybb.domain.User;
import com.cybb.domain.UserAccess;
import com.cybb.repository.UserAccessRepo;
import com.cybb.repository.UserRepo;
import com.cybb.vo.UserAccessVO;

@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private UserAccessRepo userAccessRepo;
	
	public User userLogin(String username, String password) {
		User user = userRepo.findByUserName(username);
		if (null == user || !user.password.equals(password)) {			
				return null;
		}
		return user;
	}
	
	public List<UserAccessVO> userAccess(String priviledge) {
		List<UserAccess> userAccessList = userAccessRepo.findByPriviledge(priviledge);
		
		List<UserAccessVO> userAccessVoList = new ArrayList<UserAccessVO>();
		
		if(userAccessList!= null && userAccessList.size()!=0){
			userAccessVoList = generateUserAccessVO(userAccessList);
		}
		return userAccessVoList;
	}

	private List<UserAccessVO> generateUserAccessVO(List<UserAccess> userAccessList){
		List<UserAccessVO> userAccessVoList = new ArrayList<UserAccessVO>();
		UserAccessVO userAccessVo = null;
		List<Map<String, String>> subTabList = null;
		Map<String, String> subTabMap = null;
		for(int i=0;i<userAccessList.size();i++){
			if(i==0 && userAccessList.size()==1){//deal with only 1 userAccess
				userAccessVo = new UserAccessVO();
				subTabList = new ArrayList<Map<String, String>>();
				subTabMap = new HashMap<String, String>();
				userAccessVo.setTabName(userAccessList.get(i).getTabName());
				userAccessVo.setTabActionUrl(userAccessList.get(i).getTabActionUrl());
				subTabMap.put("subTabName", userAccessList.get(i).getSubTabName());
				subTabMap.put("subTabUrl", userAccessList.get(i).getSubTabActionUrl());
				subTabList.add(subTabMap);
				userAccessVo.setSubTabMapList(subTabList);
				userAccessVoList.add(userAccessVo);				
			}else if(i==0){
				userAccessVo = new UserAccessVO();
				subTabList = new ArrayList<Map<String, String>>();
				subTabMap = new HashMap<String, String>();
				userAccessVo.setTabName(userAccessList.get(i).getTabName());
				userAccessVo.setTabActionUrl(userAccessList.get(i).getTabActionUrl());
				subTabMap.put("subTabName", userAccessList.get(i).getSubTabName());
				subTabMap.put("subTabUrl", userAccessList.get(i).getSubTabActionUrl());
				subTabList.add(subTabMap);
			}else if(i==userAccessList.size()-1 || userAccessList.get(i).getTabId()!=userAccessList.get(i+1).getTabId()){//add into the final list
				subTabMap = new HashMap<String, String>();
				userAccessVo.setTabName(userAccessList.get(i).getTabName());
				userAccessVo.setTabActionUrl(userAccessList.get(i).getTabActionUrl());
				subTabMap.put("subTabName", userAccessList.get(i).getSubTabName());
				subTabMap.put("subTabUrl", userAccessList.get(i).getSubTabActionUrl());
				subTabList.add(subTabMap);
				userAccessVo.setSubTabMapList(subTabList);
				userAccessVoList.add(userAccessVo);
				userAccessVo = new UserAccessVO();
				subTabList = new ArrayList<Map<String, String>>();
			}else{
				subTabMap = new HashMap<String, String>();
				userAccessVo.setTabName(userAccessList.get(i).getTabName());
				userAccessVo.setTabActionUrl(userAccessList.get(i).getTabActionUrl());
				subTabMap.put("subTabName", userAccessList.get(i).getSubTabName());
				subTabMap.put("subTabUrl", userAccessList.get(i).getSubTabActionUrl());
				subTabList.add(subTabMap);
			}
		}
		return userAccessVoList;
	}

}
