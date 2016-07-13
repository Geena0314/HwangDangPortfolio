<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<style>
img {
	width : 100px;
	height : 70px;
}

div .parent  {
	/* border : 1px solid pink; */
	/* float : left; */
}
div .child  {
	/* border : 1px solid black; */
	/* float : left; */
}

#orderSeqNo
{
	display: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		
		
	});
</script>

<!-- 교환/환불/취소 -  교환신청 : 5
	교환/환불/취소 -  환불신청 :  6 
	교환/환불/취소 - 구매취소(배송전) :  7 
	교환/환불/취소 -   교환신청 승인 : 8 
	교환/환불/취소 -   환불신청 승인  : 9   -->



<div class="container">
	<h2 class="page-header store_look_around">나의주문 - 배송완료</h2>
	<div class="row">
	<!-- 네비게이션 바Area -->
	 <ul class="nav nav-tabs">
	 	 <li role="presentation" class="active"><a class="btn btn-default" role="button"  href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }">배송 현황</a></li>
	  	<li role="presentation"><a class="btn btn-default" role="button" href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }">구매 확정</a></li>
	  	<li role="presentation">	<a class="btn btn-default" role="button" href="/HwangDangFleamarket/myorder/cancel.go?loginId=${sessionScope.login_info.memberId }">교환/환불/취소</a></li>
	</ul>
	
	
	 <!-- 본문 Area -->
	<div class="col-md-12">
	<form action=""  method="post"  id="f2">
	<input type="hidden" id="loginId" value="${sessionScope.login_info.memberId }" />
		
	
	<c:forEach items="${requestScope.orderList }"  var="order" > 
	<div class="parent">
	
	
	<!-- 주문날짜 -->
	<h4><fmt:formatDate value="${order.orders_date }" pattern="yyyy-MM-dd" /> / orderno:${order.ordersNo }</h4><br/>
		
		<c:forEach items="${order.orderProductList }" var="orderProduct">		
		
			<table class="table">
				<tr>
					<td>
						<!--  체크박스   -->
						<input type="checkbox" name="items" value="${orderProduct.orderSeqNo}" />
						<img class="main-image" src="/HwangDangFleamarket/image_storage/${orderProduct.product.productMainImage }" />
					</td>
						
					<td>
						${orderProduct.product.productName } /
						${orderProduct.orderAmount} 개 /
						(${orderProduct.productOption.optionSubName })
						<font color="lightgray">추가가격(+${orderProduct.productOption.optionAddPrice})</font>
						가격 :<fmt:formatNumber value="${(orderProduct.product.productPrice +orderProduct.productOption.optionAddPrice) * orderProduct.orderAmount  }" pattern="#,###원"/>
					</td>
					
					<td>
						<a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${orderProduct.seller.sellerStoreNo }&sellerImage=${orderProduct.seller.sellerStoreImage }">
							${orderProduct.seller.sellerStoreName }  
						</a>	 
					</td>
					
					<td>
							<!-- 배송상태  -->
			<strong>  
				<c:choose>
					<c:when test="${orderProduct.orderProductStatus  == 10 }">구매확정</c:when>
				</c:choose> 

			</strong>  
					</td>
				
				<td>
				<!-- 구매확정 버튼 -->
					<c:if test="${orderProduct.orderProductStatus  == 4 }">
						<button class="btn btn-success">구매확정</button>
					</c:if>
				</td>
				</tr>
			</table>
	</c:forEach> 
	
		<p class="text-center">
			<mark> <fmt:formatNumber value="${order.ordersTotalPrice }" type="currency" /></mark>
		</p>
		<hr>
</div>     
</c:forEach>
</form>
<!-- ***************페이징처리************************************** -->
	
	<p class="text-center">
	<!-- 페이징 ◀버튼처리 -->  
	<c:choose>
		<c:when test="${requestScope.pagingBean.previousPageGroup }">
			<a href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }&page=${requestScope.pagingBean.beginPage-1}">
			◀
			</a>
		</c:when>
		<c:otherwise>
		 	◁	  
		</c:otherwise>
	</c:choose>
		<!-- 페이지 번호 처리 -->  
		<c:forEach begin="${requestScope.pagingBean.beginPage }" end="${requestScope.pagingBean.endPage }" var="page">
			<c:choose>
				<c:when test="${requestScope.pagingBean.page == page }">
					<font id="currentPage" size="6px">  ${page}  </font>
				</c:when>
				<c:otherwise>
					<a href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }&page=${page }">${page}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 페이징 ▶버튼 처리  -->
	<c:choose>
		<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }&page=${requestScope.pagingBean.endPage +1 }">▶ </a>
		</c:when>
		<c:otherwise>
			▷	  
		</c:otherwise>
	</c:choose>
	</p>
  </div>
</div>

 </div> <!-- container -->


