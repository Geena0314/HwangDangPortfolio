<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %>
<style type="text/css">
div.myorder-tabs{
   float: left;
   margin: 20px 20px 20px 20px;
   padding: 20px 20px 20px 20px;
   max-width: 800px;
}
ul{
   display: block;
   list-style: none;
}
div.myorder-tabs li#list_block{
   float: left;
   overflow: hidden;
   position: relative;
   height: 180px;
   min-width: 800px;
   padding: 15px 15px 15px 15px;
}
li{
   display: list-item;
   margin: 0px;
}

div{
   display: block;
}
.thmb{
   float: left;
   width: 150px;
   height: 150px;
}
.product_info{
   float: left;
   width: 400px;
   height: 150px;
   border-right: 1px solid gray;
}
.status{
   float: left;
   width: 150px;
   height: 150px;
}
p{
   clear: both;
}
b{
   font-size: 15pt;
}
img{
   width: 150px;
   height: 150px;
}
.product_img{
   border-radius: 10px;
   overflow: hidden;
}
</style>
<div class="myorder-container">
	<h2 class="page-header store_look_around">나의주문 - 배송현황</h2>
	
	<div class="myorder-tabs">
		<!-- 네비게이션 바Area -->
		<ul class="nav nav-tabs">       
		 	<li role="presentation" class="active"><a href="/HwangDangFleamarket/order/diliveryStatus.go">배송 현황</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/success.go">구매 확정</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/cancel.go">교환/환불/취소</a></li>
		 </ul>
		 
		 <ul>
      		<c:forEach items="${requestScope.diliveryStatus}" var="myorderList">
      			주문일자  <fmt:formatDate value="${myorderList.ordersDate }" pattern="yyyy-MM-dd" /> │ 주문번호  ${myorderList.ordersNo}<br>
	      		<c:forEach items="${myorderList.orderProductList}" var="productList">
	      		<li id="list_block">
	      			<div class="thmb">
		               <div class="product_img">
		                  <a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${productList.seller.sellerStoreNo}&sellerStoreImage=${productList.seller.sellerStoreImage}">
		                  	<img src="../image_storage/${productList.product.productMainImage}">
	                  	  </a>
		               </div>
		            </div>
		            <ul class="product_info">
		               <li>
		                  <a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${productList.seller.sellerStoreNo}&sellerStoreImage=${productList.seller.sellerStoreImage}">
		                  	[${productList.product.productId}] ${productList.product.productName}
	                  	  </a>
		               </li>
		               <li>
		                  ${productList.productOption.optionSubName} ${productList.orderAmount}
		               </li>
		            </ul>
		            <div class="status">
		               <ul class="btns">
		                  <li>show btn</li>
		               </ul>
		            </div>
		         </li>
	      		</c:forEach>
   			</c:forEach>
   		 </ul>
		 
		 <!-- 주문일자 | 주문번호 -->
		 <!-- 상품 img, 상품 id, 상품명, 옵션, 수량, 가격 -->
		 <!-- 배송 현황이 '배송중' 이전 일 경우 배송 현황 + 주문취소 버튼 -->
		 <!-- 배송 중 일 경우에는................배송중만 보여줌.............. -->
		 <!-- 배송 완료 이후에는 구매확정 (action), 교환신청, 환불신청 버튼 -->
		 
	</div> <!-- my order tabs -->
	<%-- *********페이징 처리********* --%>
	<div class="pageGroup" align="center">
		<%-- ◀이전 페이지 그룹 처리 --%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.previousPageGroup}">
				<a href="/HwangDangFleamarket/order/diliveryStatus.go?page=${requestScope.pagingBean.beginPage-1}">
					◀ 
				</a>
			</c:when>
			<c:otherwise>◀</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<%-- 페이지 처리 --%>
		<c:forEach begin="${requestScope.pagingBean.beginPage}" end="${requestScope.pagingBean.endPage}" var="page">
			<c:choose>
				<c:when test="${page == requestScope.pagingBean.page}">
		  				<b>${page}</b>
		 			</c:when>
				<c:otherwise>
					<a href="/HwangDangFleamarket/order/diliveryStatus.go?page=${page }">
						${page}
					</a>
				</c:otherwise>
			</c:choose>
		&nbsp;&nbsp;
		</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/order/diliveryStatus.go?page=${requestScope.pagingBean.endPage +1 }">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
</div> <!-- container -->