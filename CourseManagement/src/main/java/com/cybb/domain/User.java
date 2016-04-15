package com.cybb.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "user")
public class User {
	
	@Column(name = "user_id")
	@Id
	@GeneratedValue
	public Long userId;
	
	@Column(name = "password")
	public String password;

	@Column(name = "username")
	public String userName;
	
	@Column(name = "nick_name")
	public String nickName;

}
