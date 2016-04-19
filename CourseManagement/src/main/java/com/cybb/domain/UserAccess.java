package com.cybb.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "priviledge_tab")
public class UserAccess {
	
	@Column(name = "priviledge_tab_id")
	@Id
	@GeneratedValue
	public String priviledgeTabId;

	@Column(name = "priviledge")
	public String priviledge;
	
	@Column(name = "tab_id")
	public Long tabId;
	
	@Column(name = "tab_name")
	public String tabName;
	
	@Column(name = "tab_action_url")
	public String tabActionUrl;
	
	@Column(name = "subtab_id")
	public Long subTabId;
	
	@Column(name = "subtab_name")
	public String subTabName;
	
	@Column(name = "subtab_action_url")
	public String subTabActionUrl;

	public String getPriviledge() {
		return priviledge;
	}

	public void setPriviledge(String priviledge) {
		this.priviledge = priviledge;
	}

	public Long getTabId() {
		return tabId;
	}

	public void setTabId(Long tabId) {
		this.tabId = tabId;
	}

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

	public Long getSubTabId() {
		return subTabId;
	}

	public void setSubTabId(Long subTabId) {
		this.subTabId = subTabId;
	}

	public String getSubTabName() {
		return subTabName;
	}

	public void setSubTabName(String subTabName) {
		this.subTabName = subTabName;
	}

	public String getSubTabActionUrl() {
		return subTabActionUrl;
	}

	public void setSubTabActionUrl(String subTabActionUrl) {
		this.subTabActionUrl = subTabActionUrl;
	}
	
	
}
