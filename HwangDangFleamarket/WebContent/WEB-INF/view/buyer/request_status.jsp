<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %>
<style type="text/css">
div.myorder-tabs{
   float: left;
   position: relative;
   left: 16%;
   top: -20px;
   margin: 0px 20px 20px 20px;
   padding: 20px 20px 20px 20px;
   max-width: 850px;
}
ul{
   display: block;
   list-style: none;
   margin: 10px;
}
div.myorder-tabs li#list_block{
   float: left;
   overflow: hidden;
   position: relative;
   height: 180px;
   min-width: 800px;
   padding: 15px 15px 15px 15px;
}
.contentList li{
   display: list-item;
   margin: 10px;
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
   border-right: 2px solid lightgray;
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
	<h2 class="page-header store_look_around">나의주문 - 교환/환불/취소 현황</h2>
	
	<div class="myorder-tabs">
		<!-- 네비게이션 바Area -->
		<ul class="nav nav-tabs">       
		 	<li role="presentation"><a href="/HwangDangFleamarket/order/diliveryStatus.go?page=1">배송 현황</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/order/purchaseConfirm.go?page=1">구매 확정</a></li>
		  	<li role="presentation" class="active"><a href="/HwangDangFleamarket/order/requestStatus.go?page=1">교환/환불/취소</a></li>
		</ul>
		<ul class="contentList">
   			<c:forEach items="${requestScope.requestStatus}" var="requestList" varStatus="no">
				<c:choose>
					<c:when test="${no.index == 0}">
						<p>
							<b>주문일자  <fmt:formatDate value="${requestList.orders.ordersDate }" pattern="yyyy-MM-dd" /> │ 주문번호  ${requestList.orders.ordersNo}</b>
  						</p>
  					</c:when>
  					<c:when test="${requestList.ordersNo != requestScope.requestStatus[no.index-1].ordersNo}">
  						<p>
   							<b>주문일자  <fmt:formatDate value="${requestList.orders.ordersDate }" pattern="yyyy-MM-dd" /> │ 주문번호  ${requestList.orders.ordersNo}</b>
  						</p>
  					</c:when>
  				</c:choose>
	      		<li id="list_block">
	      			<div class="thmb">
		               <div class="product_img">
		                  <a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${requestList.product.productId}&sellerStoreNo=${requestList.seller.sellerStoreNo}">
		                  	<img src="../image_storage/${requestList.product.productMainImage}">
	                  	  </a>
		               </div>
		            </div>
		            <ul class="product_info">
		               <li>
		                  <a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${requestList.product.productId}&sellerStoreNo=${requestList.seller.sellerStoreNo}">
		                  	[${requestList.seller.sellerStoreName}] ${requestList.product.productId} - ${requestList.product.productName}
	                  	  </a>
		               </li>
		               <li>
		                  ${requestList.productOption.optionSubName} ${requestList.orderAmount}개
		               </li>
		               <li>
		               	  ${requestList.product.productPrice + requestList.productOption.optionAddPrice}원
		               </li>
		            </ul>
		            <div class="status">
		               <ul>
		               		<c:choose>
								<c:when test="${requestList.orderProductStatus  == 5 }">교환신청</c:when>
								<c:when test="${requestList.orderProductStatus  == 6 }">환불신청  </c:when>
								<c:when test="${requestList.orderProductStatus  == 7 }">구매취소 </c:when>
								<c:when test="${requestList.orderProductStatus  == 8 }">교환완료</c:when>
								<c:when test="${requestList.orderProductStatus  == 9 }">환불완료</c:when>
								<c:when test="${requestList.orderProductStatus  == 11 }">교환거부</c:when>
							</c:choose> 
		               </ul>
		            </div>
		         </li>
   			</c:forEach>
   		 </ul>
	</div> <!-- my order tabs -->
	<%-- *********페이징 처리********* --%>
	<div class="pageGroup" align="center">
		<%-- ◀이전 페이지 그룹 처리 --%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.previousPageGroup}">
				<a href="/HwangDangFleamarket/order/requestStatus.go?page=${requestScope.pagingBean.beginPage-1}">
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
					<a href="/HwangDangFleamarket/order/requestStatus.go?page=${page}">
						${page}
					</a>
				</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/order/requestStatus.go?page=${requestScope.pagingBean.endPage +1}">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
</div> <!-- container -->