package com.cybb.vo;

import java.util.List;
import java.util.Map;

public class UserAccessVO {
	
	public String tabName;
	public String tabActionUrl;
	
	public List<Map<String, String>> subTabMapList;

	public String getTabName() {
		return tabName;
	}

	public void setTabName(String tabName) {
		this.tabName = tabName;
	}

	public String getTabActionUrl() {
		return tabActionUrl;
	}

	public void setTabActionUrl(String tabActionUrl) {
		this.tabActionUrl = tabActionUrl;
	}

	public List<Map<String, String>> getSubTabMapList() {
		return subTabMapList;
	}

	public void setSubTabMapList(List<Map<String, String>> subTabMapList) {
		this.subTabMapList = subTabMapList;
	}

}
