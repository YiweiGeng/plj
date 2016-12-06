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
import com.dao.impl.FoodDaoImpl;
import com.entity.Food;

/**
 * Servlet implementation class FoodServlet
 */
@WebServlet("/FoodServlet")
public class FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FoodServlet() {
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
		FoodDao fd = new FoodDaoImpl();

		if ("GetFood".equals(method)) {
			// 页面取值
			int type_id = Integer.parseInt(request.getParameter("type_id"));
			// 执行查询操作
			List<Food> foods = fd.getFoodsByType(type_id);
			// 设置session存储并重定向跳转
			request.getSession().setAttribute("foods", foods);
			response.sendRedirect("foods.jsp");

		} else if ("Detail".equals(method)) {
			// 页面取值
			int id = Integer.parseInt(request.getParameter("id"));
			// 执行查询操作
			Food food = fd.getFood(id);
			// 变量存储并转发跳转
			request.setAttribute("foodDetail", food);
			request.getRequestDispatcher("detail.jsp").forward(request, response);
		} else if ("Search".equals(method)) {
			// 页面取值
			String keyword = request.getParameter("keyword");
			// 执行查询操作
			List<Food> foods = fd.searchFoods(keyword);
			// 变量存储并转发跳转
			request.setAttribute("foods", foods);
			request.getRequestDispatcher("foods.jsp").forward(request, response);
		}
	}

}
