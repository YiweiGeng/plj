package com.entity;

import com.util.DBUtil;

public class User extends DBUtil {
	private int id;
	private String account;
	private String pwd;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User() {
		super();
	}

	public User(int id, String account, String name) {
		super();
		this.id = id;
		this.account = account;
		this.name = name;
	}

	public User(int id, String account, String pwd, String name) {
		super();
		this.id = id;
		this.account = account;
		this.pwd = pwd;
		this.name = name;
	}

}
