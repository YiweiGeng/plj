package com.entity;

import com.util.DBUtil;

public class Order extends DBUtil {
	private int id;
	private int user_id;
	private int total;

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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Order() {
		super();
	}

	public Order(int id, int user_id, int total) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.total = total;
	}

}
