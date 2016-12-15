package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.CartDao;
import com.entity.Cart;
import com.util.DBUtil;

public class CartDaoImpl extends DBUtil implements CartDao {

	@Override
	public List<Cart> getAllCartsByUserId(int userId) {
		// TODO Auto-generated method stub
		// 声明一个List<cart>对象carts
		List<Cart> carts = new ArrayList<Cart>();
		// sql语句
		String sql = "SELECT * FROM `cart_food` WHERE `user_id` = ?";
		ResultSet rst = super.exceQuery(sql, userId);
		try {
			while (rst.next()) {
				int id = rst.getInt(1);
				int user_id = rst.getInt(2);
				int food_id = rst.getInt(3);
				String food_pic = rst.getString(4);
				String food_name = rst.getString(5);
				double food_price = rst.getDouble(6);
				int food_quantity = rst.getInt(7);
				int food_sum = rst.getInt(8);

				// 声明并实例化一个cart对象cart用来存储查询结果
				Cart cart = new Cart(id, user_id, food_id, food_name, food_pic, food_price, food_quantity, food_sum);
				// 将结果保存至列表
				carts.add(cart);

			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return carts;
	}

	@Override
	public int addCart(int user_id, int food_id, int quantity) {
		// TODO Auto-generated method stub
		// sql语句
		String sql = "INSERT INTO `carts`(`user_id`, `food_id`, `f_quantity`) VALUES(?,?,?)";
		int n = super.exceUpdate(sql, user_id, food_id, quantity);
		return n;
	}

	@Override
	public int delCart(int id) {
		// TODO Auto-generated method stub
		// sql语句
		String sql = "DELETE FROM `carts` WHERE `id` = ?";
		int n = super.exceUpdate(sql, id);
		return n;
	}

	@Override
	public int updateCart(int id, int quantity) {
		// TODO Auto-generated method stub
		// sql语句
		String sql = "UPDATE `carts` SET `f_quantity` = ? WHERE `id` = ?";
		int n = super.exceUpdate(sql, quantity, id);
		return n;
	}

	@Override
	public boolean checkCart(int user_id, int food_id) {
		// TODO Auto-generated method stub
		boolean res = true;
		// sql语句
		String sql = "SELECT * FROM `cart_food` WHERE `user_id` = ? AND `food_id` = ?";
		// 执行查询语句
		ResultSet rst = super.exceQuery(sql, user_id, food_id);
		try {
			if (rst.next())
				res = false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return res;
	}

	@Override
	public int dropCart(int id) {
		// TODO Auto-generated method stub
		// sql语句
		String sql = "DELETE FROM `carts` WHERE `user_id` = ?";
		int n = super.exceUpdate(sql, id);
		return n;
	}

}
