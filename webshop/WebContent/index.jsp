<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp"></c:import>
<!-- banner -->
	<div class="banner">
		<div class="container">
			<div class="banner-info animated wow zoomIn" data-wow-delay=".5s">
				<h3>随心随意</h3>
				<h4>尽在<span><i> 在线点餐系统 </i></span></h4>
				<div class="wmuSlider example1">
					<div class="wmuSliderWrapper">
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner-info1">
									<p>广告语1</p>
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner-info1">
									<p>广告语2</p>
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner-info1">
									<p>广告语3</p>
								</div>
							</div>
						</article>
					</div>
				</div>
					<script src="js/jquery.wmuSlider.js"></script> 
					<script>
						$('.example1').wmuSlider();         
					</script> 
			</div>
		</div>
	</div>
<!-- //banner -->

<!-- collections -->
	<div class="new-collections">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">美食展橱</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">部分最近更新美食在此</p>
			<c:if test="${empty latestFoods }">
				<h3>抱歉，暂无美食，敬请期待</h3>
			</c:if>
			<c:if test="${!empty latestFoods }">
				<c:forEach items="${latestFoods }" var="latestFood">
				<div class="col-md-3 new-collections-grid">
					<div class="new-collections-grid1 new-collections-grid1-image-width animated wow slideInUp" data-wow-delay=".5s">
						<div class="new-collections-grid1-image">
							<a href="FoodServlet?method=GetById/${latestFood.id }" class="product-image"><img src="${latestFood.pic }" alt="${latestFood.name } " class="img-responsive" /></a>
							<div class="new-collections-grid1-image-pos new-collections-grid1-image-pos1">
								<a href="">查看详情</a>
							</div>
							<div class="new-one">
								<p>新品</p>
							</div>
						</div>
						<h4><a href="FoodServlet?method=GetById/${latestFood.id }">${latestFood.name }</a></h4>
						<p></p>
						<div class="new-collections-grid1-left simpleCart_shelfItem">
							<p><!-- <i>$580</i>  --><span class="item_price">￥ ${latestFood.price }</span><a class="item_add" href="#">添加到购物车</a></p>
						</div>
					</div>
				</div>
				</c:forEach>
			</c:if>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //collections -->
<c:import url="footer.jsp"></c:import>