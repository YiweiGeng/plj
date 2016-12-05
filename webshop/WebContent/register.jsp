<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp"></c:import>

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="initServlet"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
				<li class="active">注册页面</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- register -->
	<div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">新用户请在此注册</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">注册时务必填写相关信息，谢谢</p>
			<div class="login-form-grids">
				<h6 class="animated wow slideInUp" data-wow-delay=".5s">账户信息</h6>
				<form class="animated wow slideInUp" data-wow-delay=".5s" method="post" action="UserServlet?method=Add">
					<input type="text" name="account" placeholder="账号" required="required " >
					<input type="text" name="name" placeholder="昵称" required="required " >
					<input type="password" name="pwd" placeholder="密码" required="required " >
					<input type="password" name="pwdconfirm" placeholder="请确认密码" required="required " >
					<input type="submit" value="注&nbsp;册">
				</form>
			</div>
		</div>
	</div>
<!-- //register -->

<c:import url="footer.jsp"></c:import>