package com.dao.impl;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

import com.dao.UserDao;
import com.entity.User;
import com.util.DBUtil;

public class UserDaoImpl extends DBUtil implements UserDao {

	@Override
	public int addUser(String account, String pwd, String name) {
		// TODO Auto-generated method stub
		// 密码md5加密
		String pwdm = null;
		try {
			pwdm = DigestUtils.md5Hex(pwd.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// sql语句
		String sql = "INSERT INTO `users`(`account`, `pwd`, `name`) VALUES(?, ?, ?) ";
		// 执行增加操作
		int num = super.exceUpdate(sql, name, pwdm, name);
		return num;
	}

	@Override
	public User loginUser(String account, String pwd) {
		// TODO Auto-generated method stub
		// 声明一个User对象loginUser
		User loginUser = null;
		// 密码md5加密
		String pwdm = null;
		try {
			pwdm = DigestUtils.md5Hex(pwd.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// sql语句
		String sql = "SELECT * FROM `users` WHERE `account` = ?";
		ResultSet rst = super.exceQuery(sql, account);
		try {
			if (rst.next()) {
				int uid = rst.getInt(1);
				String loginAccount = rst.getString(2);
				String loginPwd = rst.getString(3);
				String name = rst.getString(4);

				// 验证密码
				if (pwdm.equals(loginPwd)) {
					// 实例化User对象loginuser用以存储查询结果
					loginUser = new User(uid, loginAccount, name);
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return loginUser;
	}

	@Override
	public boolean check(String account) {
		// TODO Auto-generated method stub
		boolean checkres = true;
		// sql语句
		String sql = "SELECT * FROM users WHERE `account` = ?";
		ResultSet rst = super.exceQuery(sql, account);
		try {
			if (rst.next())
				checkres = false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return checkres;
	}

}
