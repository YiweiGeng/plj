package com.dao;

import java.util.List;

import com.entity.Cart;

public interface CartDao {
	// 通过用户ID获取所有购物车信息
	public List<Cart> getAllCartsByUserId();

}
