package com.dao;

import java.util.List;

import com.entity.Food;

public interface FoodDao {
	// 获取所有美食信息
	public List<Food> getLatestFoods(int num);

	// 通过分类获取相关美食信息
	public List<Food> getFoodsByType(int Type_id);

	// 通过ID获取美食信息
	public Food getFood(int id);

	// 通过名称检索得到食物信息
	public List<Food> searchFoods(String keyword);

}
