<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    
<c:import url="header.jsp"></c:import>
<c:if test="${empty loginUser }">
	<script type="text/javascript">
		window.location.href='initServlet';
	</script>
</c:if>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="initServlet"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主&nbsp;页</a></li>
				<li class="active">购物车详情</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- checkout -->
	<div class="checkout">
		<div class="container">
			<h3 class="animated wow slideInLeft" data-wow-delay=".5s">
				<c:if test="${empty carts }">您的购物车暂无食品</h3></c:if>
			<c:if test="${!empty carts }">
					您的购物车目前有： <span>${fn:length(carts) } 种食品</span>
			</h3>
			<div class="checkout-right animated wow slideInUp" data-wow-delay=".5s">
				<table class="timetable_sub" width="100%">
					<thead>
						<tr>
							<th width="20%">食品名称</th>	
							<th width="20%">食品图片</th>
							<th width="20%">食品价格</th>
							<th width="20%">食品数量</th>
							<th width="20%">操作</th>
						</tr>
					</thead>
					<c:forEach items="${carts }" var="cart">
					<tr class="rem" id="${cart.id }">
						<td class="invert">${cart.food_name }</td>
						<td class="invert-image"><a href="FoodServlet?method=Get&id=${cart.food_id }"><img src="${cart.food_pic }" alt="${cart.food_name } " class="img-responsive" /></a></td>
						<td class="invert p">${cart.food_price }</td>
						<td class="invert">
							 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="entry value q">${cart.food_quantity }</div>
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
						</td>
						<td class="invert">
							<input type="button" class="btn btn-primary update" value="更新" onclick="update(this)" />
							<input type="button" class="btn btn-danger" value="移除" onclick="del(this)" />
							<script type="text/javascript">
								function update(k){
									var cart_id = $(k).parent().parent().attr('id');
									console.log(cart_id);
									var f_quantity = $(k).parent().parent().find(".q").text();
									console.log(f_quantity)
									$.ajax({
										type:"post",
										url:"CartServlet?method=Update",
										dataType:"text",
												data:{
													"cart_id":cart_id,
													"quantity":f_quantity,
												},
												success:function(data){
													alert(data);
													var user_id = $("#user_id").val();
													$.ajax({
														type:"post",
														url:"CartServlet?method=All",
																data:{
																	"user_id":user_id,
																}
													})
													location.reload();
												}
									})
								}
								function del(k){
									var cart_id = $(k).parent().parent().attr('id');
									$.ajax({
										type:"post",
										url:"CartServlet?method=Del",
										dataType:"text",
												data:{
													"cart_id":cart_id,
												},
												success:function(data){
													alert(data);
													var user_id = $("#user_id").val();
													$.ajax({
														type:"post",
														url:"CartServlet?method=All",
																data:{
																	"user_id":user_id,
																}
													});
													location.reload();
												}
									})
								}
							</script>
							<!-- <div class="rem">
								<div class="close1"> </div>
							</div>
							<script>$(document).ready(function(c) {
								$('.close1').on('click', function(c){
									$('.rem1').fadeOut('slow', function(c){
										$('.rem1').remove();
									});
									});	  
								});
						   </script> -->
						</td>
					</tr>
					</c:forEach>
					
								<!--quantity-->
									<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									
									function test(){
										var price = $(".p").text();
										var quantity = $(".q").text();
										alert(price+","+quantity);
									}
									</script>
								<!--quantity-->
				</table>
			</div>
			<div class="checkout-left">	
				<div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
				
					<a href="" onclick="pay()"><h4><span >总计：￥</span><span id="count"></span>&nbsp;&nbsp;&nbsp;&nbsp;点击买单</h4></a>
					<script>
						$(document).ready(function(){
							trs = $(".timetable_sub").find(".rem");
							var sum = 0;
							$.each(trs,function(){
								var price = $(this).find(".p");
								var qu    = $(this).find(".q");
								p = parseFloat(price.text());
								q = parseInt(qu.text());
								sum += p*q;
							})
							$("#count").html(sum);
						})
						function pay(){
							var total = $("#count").text();
							$.ajax({
								type:"post",
								url:"CartServlet?method=Pay",
										dataType:"text",
										data:{
											"total":total,
										},
										success:function(data){
											alert(data);
											window.location.href="initServlet";
										}
							})
						}
					</script>
				</div>
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					<a href="initServlet"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>继续购买食品</a>
				</div>
			</c:if>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //checkout -->

<c:import url="footer.jsp"></c:import>