package com.dao;

import java.util.List;

import com.entity.Food;

public interface FoodDao {
	// 获取所有美食信息
	public List<Food> getAllFoods();

	// 通过分类获取相关美食信息
	public List<Food> getFoodsByType();

}
