package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.TypeDao;
import com.entity.Type;
import com.util.DBUtil;

public class TypeDaoImpl extends DBUtil implements TypeDao {

	@Override
	public List<Type> getAllTypes() {
		// TODO Auto-generated method stub
		// 声明一个List<Type>对象types
		List<Type> types = new ArrayList<Type>();
		// sql语句
		String sql = "SELECT * FROM `types`";
		ResultSet rst = super.exceQuery(sql);
		try {
			while (rst.next()) {
				int id = rst.getInt(1);
				String name = rst.getString(2);

				// 声明并实例化一个Type对象type用来存储查询结果
				Type type = new Type(id, name);
				// 将结果保存至列表
				types.add(type);

			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return types;
	}

}
