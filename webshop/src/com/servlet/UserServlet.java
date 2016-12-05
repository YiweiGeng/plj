package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.entity.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
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
		UserDao ud = new UserDaoImpl();

		if ("Add".equals(method)) {
			// 页面取值
			String account = request.getParameter("account");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");

			// 对必须字段进行判空
			if (account == null || name == null || pwd == null) {
				response.sendRedirect("register.jsp");
			}
			// 对登录名（联系方式）进行检查，要求唯一
			else if (!ud.check(account)) {
				response.sendRedirect("register.jsp");
			}
			// 所有核验通过，执行新增操作
			else {
				ud.addUser(account, pwd, name);
				response.sendRedirect("login.jsp");
			}
		}

		else if ("Login".equals(method)) {
			// 页面取值
			String account = request.getParameter("account");
			String pwd = request.getParameter("pwd");

			User loginUser = ud.loginUser(account, pwd);
			// 设置Session存储并跳转转发
			request.getSession().setAttribute("loginUser", loginUser);
			// request.getRequestDispatcher("index.jsp").forward(request,
			// response);
			response.sendRedirect("index.jsp");
		}
	}

}
