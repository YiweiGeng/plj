package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.FoodDao;
import com.entity.Food;
import com.util.DBUtil;

public class FoodDaoImpl extends DBUtil implements FoodDao {

	@Override
	public List<Food> getLatestFoods(int num) {
		// TODO Auto-generated method stub
		// 声明一个List<Food>对象foods
		List<Food> foods = new ArrayList<Food>();
		// sql语句
		String sql = "SELECT * FROM `foods` ORDER BY `id` DESC Limit ?";
		ResultSet rst = super.exceQuery(sql, num);
		try {
			while (rst.next()) {
				int id = rst.getInt(1);
				String name = rst.getString(2);
				double price = rst.getDouble(3);
				int quantity = rst.getInt(4);
				String pic = rst.getString(5);
				int type_id = rst.getInt(6);

				// 声明并实例化一个food对象food用来存储查询结果
				Food food = new Food(id, name, price, quantity, pic, type_id);
				// 将结果保存至列表
				foods.add(food);

			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return foods;
	}

	@Override
	public List<Food> getFoodsByType(int type_id) {
		// TODO Auto-generated method stub
		// 声明一个List<Food>对象foods
		List<Food> foods = new ArrayList<Food>();
		// sql语句
		String sql = "SELECT * FROM `foods` WHERE `type_id` = ?";
		ResultSet rst = super.exceQuery(sql, type_id);
		try {
			while (rst.next()) {
				int id = rst.getInt(1);
				String name = rst.getString(2);
				double price = rst.getDouble(3);
				int quantity = rst.getInt(4);
				String pic = rst.getString(5);

				// 声明并实例化一个food对象food用来存储查询结果
				Food food = new Food(id, name, price, quantity, pic, type_id);
				// 将结果保存至列表
				foods.add(food);

			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return foods;
	}

	@Override
	public Food getFood(int id) {
		// TODO Auto-generated method stub
		// 声明一个Food对象food
		Food food = null;
		// sql语句
		String sql = "SELECT * FROM `foods` WHERE `id` = ?";
		ResultSet rst = super.exceQuery(sql, id);
		try {
			while (rst.next()) {
				String name = rst.getString(2);
				double price = rst.getDouble(3);
				int quantity = rst.getInt(4);
				String pic = rst.getString(5);
				int type_id = rst.getInt(6);

				// 实例化food对象food用来存储查询结果
				food = new Food(id, name, price, quantity, pic, type_id);

			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return food;
	}

	@Override
	public List<Food> searchFoods(String keyword) {
		// TODO Auto-generated method stub
		// 声明一个List<Food>对象foods
		List<Food> foods = new ArrayList<Food>();
		// sql语句
		String sql = "SELECT * FROM `foods` WHERE `name` LIKE '%" + keyword + "%'";
		ResultSet rst = super.exceQuery(sql);
		try {
			while (rst.next()) {
				int id = rst.getInt(1);
				String name = rst.getString(2);
				double price = rst.getDouble(3);
				int quantity = rst.getInt(4);
				String pic = rst.getString(5);
				int type_id = rst.getInt(6);

				// 声明并实例化一个food对象food用来存储查询结果
				Food food = new Food(id, name, price, quantity, pic, type_id);
				// 将结果保存至列表
				foods.add(food);

			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return foods;
	}

}
