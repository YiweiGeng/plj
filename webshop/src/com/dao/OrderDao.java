package com.dao;

import java.util.List;

import com.entity.Order;

public interface OrderDao {
	// 通过用户ID获取所有的订单信息
	public List<Order> getAllOrdersByUserId();
}
