package com.entity;

import com.util.DBUtil;

public class Type extends DBUtil {
	private int id;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Type() {
		super();
	}

	public Type(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

}
