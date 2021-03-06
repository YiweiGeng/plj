package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FoodDao;
import com.dao.TypeDao;
import com.dao.impl.FoodDaoImpl;
import com.dao.impl.TypeDaoImpl;
import com.entity.Food;
import com.entity.Type;

/**
 * Servlet implementation class initServlet
 */
@WebServlet("/initServlet")
public class initServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public initServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		// 设置页面请求的编码方式
		request.setCharacterEncoding("UTF-8");
		// 设置页面响应的编码方式
		response.setContentType("text/html;charset=UTF-8");

		// 引用out输出流
		PrintWriter out = response.getWriter();
		// 获取方法值
		String method = request.getParameter("method");
		// 引入相关接口及实现类
		TypeDao td = new TypeDaoImpl();
		FoodDao fd = new FoodDaoImpl();

		// 声明并实例化List<>对象用以存储信息
		List<Type> types = td.getAllTypes();
		List<Food> latestFoods = fd.getLatestFoods(4);

		// 传值并跳转
		request.getSession().setAttribute("types", types);
		request.getSession().setAttribute("latestFoods", latestFoods);
		// request.getRequestDispatcher("index.jsp").forward(request, response);
		response.sendRedirect("index.jsp");
	}

}
