package com.dao;

import java.util.List;

import com.entity.Cart;

public interface CartDao {
	// 通过用户ID获取所有购物车信息
	public List<Cart> getAllCartsByUserId(int id);

	// 添加到购物车
	public int addCart(int user_id, int food_id, int quantity);

	// 删除购物车信息
	public int delCart(int id);

	// 修改购物车信息
	public int updateCart(int id, int quantity);

	// 检查购物车是否存在即将添加的商品
	public boolean checkCart(int user_id, int food_id);

	// 删除某用户所有购物车信息
	public int dropCart(int id);
}
