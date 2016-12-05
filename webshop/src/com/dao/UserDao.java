package com.dao;

import com.entity.User;

public interface UserDao {
	// 增加用户
	public int addUser(String account, String pwd, String name);

	// 登录认证
	public User loginUser(String account, String pwd);

	// 帐号查重
	public boolean check(String account);
}
