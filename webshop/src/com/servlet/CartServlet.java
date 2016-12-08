package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.dao.OrderDao;
import com.dao.impl.CartDaoImpl;
import com.dao.impl.OrderDaoImpl;
import com.entity.Cart;
import com.entity.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
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
		CartDao cd = new CartDaoImpl();
		OrderDao od = new OrderDaoImpl();

		HttpSession session = request.getSession(false);
		if (session != null) {
			User loginUser = (User) session.getAttribute("loginUser");
			int user_id = loginUser.getId();
			System.out.println(user_id);

			if ("All".equals(method)) {
				// // 页面取值
				// int user_id =
				// Integer.parseInt(request.getParameter("user_id"));
				// 执行查询操作
				List<Cart> carts = cd.getAllCartsByUserId(user_id);
				// 设置Session存储并跳转
				request.getSession().setAttribute("carts", carts);
				response.sendRedirect("checkout.jsp");
			} else if ("Add".equals(method)) {
				// // 页面取值
				// int user_id =
				// Integer.parseInt(request.getParameter("user_id"));
				int food_id = Integer.parseInt(request.getParameter("food_id"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				// 执行购物车检查
				if (cd.checkCart(user_id, food_id)) {
					// 执行增加操作
					int n = cd.addCart(user_id, food_id, quantity);
					if (n != 0) {
						out.println("添加成功！");
					} else {
						out.println("添加失败！");
					}
				} else {
					out.println("该食品已存在于购物车中");
				}
			} else if ("Del".equals(method)) {
				// 页面取值
				int id = Integer.parseInt(request.getParameter("cart_id"));
				// 执行增加操作
				int n = cd.delCart(id);
				if (n != 0) {
					out.println("删除成功！");
				} else {
					out.println("删除失败！");
				}
			} else if ("Update".equals(method)) {
				// 页面取值
				int id = Integer.parseInt(request.getParameter("cart_id"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				// 执行增加操作
				int n = cd.updateCart(id, quantity);
				if (n != 0) {
					out.println("更新成功！");
				} else {
					out.println("更新失败！");
				}
			} else if ("Pay".equals(method)) {
				// 页面取值
				double total = Double.parseDouble(request.getParameter("total"));
				// 执行增加操作
				int n = od.addOrder(user_id, total);
				if (n != 0) {
					cd.dropCart(user_id);
					out.println("下单成功！");
				} else {
					out.println("下单失败！");
				}
			}

		}
	}
}
