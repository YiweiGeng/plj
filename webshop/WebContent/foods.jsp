<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp"></c:import>

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主&nbsp;页</a></li>
				<li class="active">美食</li>
			</ol>
		</div>
	</div>
	<div class="products">
		<div class="container">
			<div class="col-md-3 products-left">
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
				<div class="new-products animated wow slideInUp" data-wow-delay=".5s">
					<h3>新品橱窗</h3>
					<div class="new-products-grids">
						<c:if test="${empty latestFoods }">
							<h4>抱歉，暂无新品，敬请期待</h4>
						</c:if>
						<c:if test="${!empty latestFoods }">
							<c:forEach items="${latestFoods }" var="latestFood">
								<div class="new-products-grid">
								<div class="new-products-grid-left">
									<a href=""><img src="${latestFood.pic }" alt="${latestFood.name } " class="img-responsive" /></a>
								</div>
								<div class="new-products-grid-right">
									<h4><a href="single.html">${latestFood.name }</a></h4>
									<div class="simpleCart_shelfItem new-products-grid-right-add-cart">
										<p> <span class="item_price">￥ ${latestFood.price }</span><a class="item_add" href="" onclick="addToCart(${latestfood.id})">添加到购物车</a></p>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-md-9 products-right">
				<!-- <div class="products-right-grid">
					<div class="products-right-grids-position animated wow slideInRight" data-wow-delay=".5s">
						<img src="images/18.jpg" alt=" " class="img-responsive" />
						<div class="products-right-grids-position1">
							<h4>2016 New Collection</h4>
							<p>Temporibus autem quibusdam et aut officiis debitis aut rerum 
								necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae 
								non recusandae.</p>
						</div>
					</div>
				</div> -->
				<div class="products-right-grids-bottom">
					<c:if test="${empty foods }">
						<h3>抱歉，暂无相关美食</h3>
					</c:if>
					<c:if test="${!empty foods }">
						<c:forEach items="${foods }" var="food">
							<div class="col-md-6 products-right-grids-bottom-grid">
								<div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
									<div class="new-collections-grid1-image">
										<a href="single.html" class="product-image"><img src="${food.pic }" alt=" " class="img-responsive"></a>
										<div class="new-collections-grid1-image-pos products-right-grids-pos">
											<a href="FoodServlet?method=Detail&id=${food.id }">查看详情</a>
										</div>
									</div>
									<h4><a href="single.html">${food.name }</a></h4>
									<div class="simpleCart_shelfItem products-right-grid1-add-cart">
										<p><!-- <i>$325</i>  --><span class="item_price">￥ ${food.price }</span><a class="item_add" href="" onclick="addToCart(${food.id})">添加到购物车</a></p>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="clearfix"> </div>
					</c:if>
				</div>
				<!-- <nav class="numbering animated wow slideInRight" data-wow-delay=".5s">
				  <ul class="pagination paging">
					<li>
					  <a href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					  </a>
					</li>
					<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
					  <a href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					  </a>
					</li>
				  </ul>
				</nav> -->
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //breadcrumbs -->

<c:import url="footer.jsp"></c:import>