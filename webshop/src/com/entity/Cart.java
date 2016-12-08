package com.entity;

import com.util.DBUtil;

public class Cart extends DBUtil {
	private int id;
	private int user_id;
	private int food_id;
	private int food_quantity;
	private String food_name;
	private String food_pic;
	private double food_price;
	private int food_sum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getFood_id() {
		return food_id;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}

	public int getFood_quantity() {
		return food_quantity;
	}

	public void setFood_quantity(int food_quantity) {
		this.food_quantity = food_quantity;
	}

	public int getFood_sum() {
		return food_sum;
	}

	public void setFood_sum(int food_sum) {
		this.food_sum = food_sum;
	}

	public Cart() {
		super();
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_pic() {
		return food_pic;
	}

	public void setFood_pic(String food_pic) {
		this.food_pic = food_pic;
	}

	public double getFood_price() {
		return food_price;
	}

	public void setFood_price(double food_price) {
		this.food_price = food_price;
	}

	public Cart(int id, int user_id, int food_id, int food_quantity) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.food_id = food_id;
		this.food_quantity = food_quantity;
	}

	public Cart(int id, int user_id, int food_id, String food_name, String food_pic, double food_price,
			int food_quantity, int food_sum) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.food_id = food_id;
		this.food_name = food_name;
		this.food_pic = food_pic;
		this.food_price = food_price;
		this.food_quantity = food_quantity;
		this.food_sum = food_sum;
	}

}
