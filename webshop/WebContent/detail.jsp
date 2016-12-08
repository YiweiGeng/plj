<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp"></c:import>

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="initServlet"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主&nbsp;页</a></li>
				<li class="active">食品详情</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- single -->
	<div class="single">
		<div class="container">
			<div class="col-md-4 products-left">
				<!-- <div class="filter-price animated wow slideInUp" data-wow-delay=".5s">
					<h3>Filter By Price</h3>
					<ul class="dropdown-menu1">
							<li><a href="">								               
							<div id="slider-range"></div>							
							<input type="text" id="amount" style="border: 0" />
							</a></li>	
					</ul>
						<script type='text/javascript'>//<![CDATA[ 
						$(window).load(function(){
						 $( "#slider-range" ).slider({
								range: true,
								min: 0,
								max: 100000,
								values: [ 10000, 60000 ],
								slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
								}
					 });
					$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );


						});//]]>
						</script>
						<script type="text/javascript" src="js/jquery-ui.min.js"></script>
					
				</div> -->
				<div class="categories animated wow slideInUp" data-wow-delay=".5s">
					<h3>美食分类</h3>
					<c:if test="${empty types }">暂无分类信息</c:if>
					<c:if test="${!empty types }">
						<ul class="cate">
							<c:forEach items="${types }" var="type">
								<li><a href="FoodServlet?method=GetByType/${type.id }">${type.name }</a> <span>(15)</span></li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<!-- <div class="men-position animated wow slideInUp" data-wow-delay=".5s">
					<a href="single.html"><img src="images/29.jpg" alt=" " class="img-responsive" /></a>
					<div class="men-position-pos">
						<h4>Summer collection</h4>
						<h5><span>55%</span> Flat Discount</h5>
					</div>
				</div> -->
			</div>
			<div class="col-md-8 single-right">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${food.pic }">
								<div class="thumb-image"> <img src="${food.pic }" alt="${food.name }" data-imagezoom="true" class="img-responsive"> </div>
							</li>
						</ul>
					</div>
					<!-- flixslider -->
						<script defer src="js/jquery.flexslider.js"></script>
						<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
						<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
						  $('.flexslider').flexslider({
							animation: "slide",
							controlNav: "thumbnails"
						  });
						});
						</script>
					<!-- flixslider -->
				</div>
				<div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3>${food.name }</h3>
					<h4><span class="item_price">￥ ${food.price }</span></h4>
					<div class="color-quality">
						<div class="color-quality-left">
							
						</div>
						<div class="color-quality-right">
							<h5>数&nbsp;量：</h5>
							<input class="form-control" type="button" onclick="more()" value="+" /><input class="form-control" readonly="readonly" type="text" id="quantity" name="quantity" value="1" class="read"/><input class="form-control" type="button" onclick="less()" value="-" />
							<input type="hidden" id="q" value="${food.quantity }" />
						</div>
						<script type="text/javascript">
							function less(){
								var q = $("#quantity").val();
								var n = --q;
								if ( n < 1) {
									alert("已是最小数量，无法减少");
								}else {
									$("#quantity").val(n);
								}
							}
							function more(){
								var q = $("#quantity").val();
								var n = ++q;
								if ( n > $("#q").val()) {
									alert("已是最大数量，无法增加");
								}else {
									$("#quantity").val(n);
								}
							}
						</script>
						<div class="clearfix"> </div>
					</div>
					<div class="occasion-cart">
						<a class="item_add"  href="" onclick="addToCart(${food.id})">添加到购物车</a>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //single -->
<!-- single-related-products -->
	<div class="single-related-products">
		<div class="container">
			<div class="new-products animated wow slideInUp" data-wow-delay=".5s">
					<h3>新品橱窗</h3>
					<div class="new-products-grids">
						<c:if test="${empty latestFoods }">
							<h4>抱歉，暂无新品，敬请期待</h4>
						</c:if>
						<c:if test="${!empty latestFoods }">
							<c:forEach items="${latestFoods }" var="latestFood">
							<div class="col-md-3 new-collections-grid">
								<div class="new-products-grid">
									<div class="new-products-grid-left">
										<a href=""><img src="${latestFood.pic }" alt="${latestFood.name } " class="img-responsive" /></a>
									</div>
									<div class="new-products-grid-right">
										<h4><a href="FoodServlet?method=Detail&id=${latestFood.id}">${latestFood.name }</a></h4>
										<div class="simpleCart_shelfItem new-products-grid-right-add-cart">
											<p> <span class="item_price">￥ ${latestFood.price }</span><a class="item_add" href="" onclick="addToCart(${latestFood.id})">添加到购物车</a></p>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<div class="clearfix"> </div>
						</c:if>
					</div>
				</div>
		</div>
	</div>
<!-- //single-related-products -->

<c:import url="footer.jsp"></c:import>