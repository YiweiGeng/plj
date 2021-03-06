<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<title>在线点餐系统</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- cart -->
<!-- <script src="js/simpleCart.min.js"></script> -->
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<!-- <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'> -->
<!-- timer -->
<link rel="stylesheet" href="css/jquery.countdown.css" />
<!-- //timer -->
<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<script type="text/javascript">	
function addToCart(food_id){
	var user_id = $("#user_id").val();
	if (user_id==null){
		alert("您未登录，请登录后再尝试！");
	}
	var quantity = $("#quantity").val();
	if (quantity==null)
		quantity = 1;
	$.ajax({
		type:"post",
		url:"CartServlet?method=Add",
				dataType:"text",
				data:{
					"user_id":user_id,
					"food_id":food_id,
					"quantity":quantity,
				},
				success:function(data){
					alert(data);
				}
	}) 
}
</script>
</head>
	
<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="header-grid">
				<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<ul>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">webshop@example.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+0791 87046xxx</li>
						<c:if test="${empty loginUser }">
							<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="login.jsp">登&nbsp;录</a></li>
							<li><i class="glyphicon glyphicon-book" aria-hidden="true"></i><a href="register.jsp">注&nbsp;册</a></li>
						</c:if>
						<c:if test="${!empty loginUser }">
							<%-- <input type="hidden" id="id" value="${loginUser.id }" /> --%>
							<li>欢迎回来，${loginUser.name }<li>
							<input type="hidden" value="${loginUser.id }" id="user_id" />
							<li><i class="glyphicon glyphicon-log-out" aria-hidden="true"></i><a href="UserServlet?method=Logout">注&nbsp;销</a></li>
						</c:if>
						</ul>
				</div>
				<!-- <div class="header-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<ul class="social-icons">
						<li><a href="#" class="facebook"></a></li>
						<li><a href="#" class="twitter"></a></li>
						<li><a href="#" class="g"></a></li>
						<li><a href="#" class="instagram"></a></li>
					</ul>
				</div> -->
				<div class="clearfix"> </div>
			</div>
			<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
					<h1><a href="initServlet">在线点餐<span>计算机1301&nbsp;普乐锦</span></a></h1>
				</div>
				<div class="logo-nav-left1">
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li class="active"><a href="initServlet" class="act">主&nbsp;页</a></li>	
							<!-- Mega Menu -->
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">美食天地<b class="caret"></b></a>
								<c:if test="${!empty types}">
									<ul class="dropdown-menu">
										<c:forEach items="${types }" var="type">
											<li><a href="FoodServlet?method=GetByType&type=${type.id }">${type.name }</a></li>
										</c:forEach>
									</ul>
								</c:if>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">我的账户<b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Home Collection</h6>
												<li><a href="furniture.html">Cookware</a></li>
												<li><a href="furniture.html">Sofas</a></li>
												<li><a href="furniture.html">Dining Tables</a></li>
												<li><a href="furniture.html">Shoe Racks</a></li>
												<li><a href="furniture.html">Home Decor</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Office Collection</h6>
												<li><a href="furniture.html">Carpets</a></li>
												<li><a href="furniture.html">Tables</a></li>
												<li><a href="furniture.html">Sofas</a></li>
												<li><a href="furniture.html">Shoe Racks</a></li>
												<li><a href="furniture.html">Sockets</a></li>
												<li><a href="furniture.html">Electrical Machines</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Decorations</h6>
												<li><a href="furniture.html">Toys</a></li>
												<li><a href="furniture.html">Wall Clock</a></li>
												<li><a href="furniture.html">Lighting</a></li>
												<li><a href="furniture.html">Top Brands</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
							<!-- <li><a href="short-codes.html">Short Codes</a></li> -->
							<li><a href="mail.html">联系我们</a></li>
						</ul>
					</div>
					</nav>
				</div>
				<div class="logo-nav-right">
					<div class="search-box">
						<div id="sb-search" class="sb-search">
							<form action="FoodServlet?" method="get">
								<input type="hidden" name="method" value="Search" />
								<input class="sb-search-input" name="keyword" placeholder="请输入关键词" type="search" id="search">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search"> </span>
							</form>
						</div>
					</div>
						<!-- search-scripts -->
						<script src="js/classie.js"></script>
						<script src="js/uisearch.js"></script>
							<script>
								new UISearch( document.getElementById( 'sb-search' ) );
							</script>
						<!-- //search-scripts -->
				</div>
				<div class="header-right">
					<div class="cart box_1">
							<a href="javascript:;" class="simpleCart_empty">
								<c:if test="${!empty loginUser }">
									<a href="CartServlet?method=All&user_id=${loginUser.id }">
										<h3> 
												<c:if test="${empty carts }">购物车为空</c:if>
												<c:if test="${!empty carts }">
													<div class="total">
													<img src="images/bag.png" alt="" />
													<span class="simpleCart_total"></span> (${fn:length(carts) }<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div>
													
												</c:if>
										</h3>
									</a>
									<!-- <script type="text/javascript">
										function cart(){
											var id = $("#id").val();
											$.ajax({
												type:"post",
												url:"CartServlet?method=All",
												data:{
													"user_id":id,
												}
											})
										}
									</script> -->
								</c:if>
							</a>
						<div class="clearfix"> </div>
					</div>	
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //header -->