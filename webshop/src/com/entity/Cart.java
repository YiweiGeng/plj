package com.entity;

import com.util.DBUtil;

public class Cart extends DBUtil {
	private int id;
	private int user_id;
	private int food_id;
	private int f_quantity;

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

	public int getF_quantity() {
		return f_quantity;
	}

	public void setF_quantity(int f_quantity) {
		this.f_quantity = f_quantity;
	}

	public Cart() {
		super();
	}

	public Cart(int id, int user_id, int food_id, int f_quantity) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.food_id = food_id;
		this.f_quantity = f_quantity;
	}

}
