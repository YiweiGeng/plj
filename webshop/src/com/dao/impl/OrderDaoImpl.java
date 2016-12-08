package com.dao.impl;

import java.util.List;

import com.dao.OrderDao;
import com.entity.Order;
import com.util.DBUtil;

public class OrderDaoImpl extends DBUtil implements OrderDao {

	@Override
	public List<Order> getAllOrdersByUserId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addOrder(int user_id, double total) {
		// TODO Auto-generated method stub
		// sql语句
		String sql = "INSERT INTO `orders`(`user_id`,`total`) VALUES(?,?)";
		// 执行增加操作
		int num = super.exceUpdate(sql, user_id, total);
		return num;
	}

}
