<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp"></c:import>

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="initServlet"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
				<li class="active">用户登录</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- login -->
	<div class="login">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">用户登录</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
				<form method="post" action="UserServlet?method=Login">
					<input type="text" name="account" placeholder="帐号" required=" " >
					<input type="password" name="pwd" placeholder="密码" required=" " >
					<div class="forgot">
						<a href="#">忘记密码？</a>
					</div>
					<input type="submit" value="Login">
				</form>
			</div>
			<h4 class="animated wow slideInUp" data-wow-delay=".5s">没有帐号？</h4>
			<p class="animated wow slideInUp" data-wow-delay=".5s"><a href="register.jsp">点此注册</a></p>
		</div>
	</div>
<!-- //login -->

<c:import url="footer.jsp"></c:import>