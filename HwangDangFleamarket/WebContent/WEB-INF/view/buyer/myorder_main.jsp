<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %>
<script type="text/javascript">
$(document).ready(function(){
	$(".cancelBtn").onclick(function(){
		if(!confirm("해당 상품의 주문을 취소하시겠습니까?")){
			return false;
		}else{
			location.href='/HwangDangFleamarket/order/requestStatus.go?page=1'
		}
	});
});
</script>
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
li{
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
ul.btns{
	margin: 0px;
}
</style>
<div class="myorder-container">
	<h2 class="page-header store_look_around">나의주문 - 배송현황</h2>
	
	<div class="myorder-tabs">
		<!-- 네비게이션 바Area -->
		<ul class="nav nav-tabs">       
		 	<li role="presentation" class="active"><a href="/HwangDangFleamarket/order/diliveryStatus.go?page=1">배송 현황</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/success.go">구매 확정</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/order/requestStatus.go?page=1">교환/환불/취소</a></li>
		 </ul>
		 
		 <ul>
      		<c:forEach items="${requestScope.diliveryStatus}" var="myorderList" varStatus="no">
      				<c:choose>
      					<c:when test="${no.index == 0}">
      						<p>
	      						<b>주문일자  <fmt:formatDate value="${myorderList.orders.ordersDate }" pattern="yyyy-MM-dd" /> │ 주문번호  ${myorderList.orders.ordersNo}</b>
      						</p>
      					</c:when>
      					<c:when test="${myorderList.ordersNo != requestScope.diliveryStatus[no.index-1].ordersNo}">
      						<p>
	      						<b>주문일자  <fmt:formatDate value="${myorderList.orders.ordersDate }" pattern="yyyy-MM-dd" /> │ 주문번호  ${myorderList.orders.ordersNo}</b>
      						</p>
      					</c:when>
      				</c:choose>
	      		<li id="list_block">
	      			<div class="thmb">
		               <div class="product_img">
		                  <a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${myorderList.product.productId}&sellerStoreNo=${myorderList.seller.sellerStoreNo}&sellerStoreImage=${myorderList.seller.sellerStoreImage}">
		                  	<img src="../image_storage/${myorderList.product.productMainImage}">
	                  	  </a>
		               </div>
		            </div>
		            <ul class="product_info">
		               <li>
		                  <a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${myorderList.product.productId}&sellerStoreNo=${myorderList.seller.sellerStoreNo}&sellerStoreImage=${myorderList.seller.sellerStoreImage}">
		                  	[${myorderList.seller.sellerStoreName}] ${myorderList.product.productId} - ${myorderList.product.productName}
	                  	  </a>
		               </li>
		               <li>
		                  ${myorderList.productOption.optionSubName} ${myorderList.orderAmount}개
		               </li>
		               <li>
		               	  ${myorderList.product.productPrice + myorderList.productOption.optionAddPrice}	원
		               </li>
		            </ul>
<!-- 배송현황 조회
	배송현황 - 입금대기중 : 0 
	배송현황 - 결제완료    : 1
	배송현황 - 배송준비중 : 2
	배송현황 - 배송중       : 3
	배송현황 - 배송완료    : 4
 -->
		            <div class="status">
		               <ul class="btns">
		               		<c:choose>
		               			<c:when test="${myorderList.orderProductStatus < 3}">
		               				<c:if test="${myorderList.orderProductStatus == 0}">입금 대기</c:if>
		               				<c:if test="${myorderList.orderProductStatus == 1}">결제 완료</c:if>
		               				<c:if test="${myorderList.orderProductStatus == 2}">배송 준비</c:if>
		               				<li><input type="button" value="주문취소" class="cancelBtn"></li>
		               			</c:when>
		               			<c:when test="${myorderList.orderProductStatus == 3}">
		               				배송 중
		               			</c:when>
		               			<c:when test="${myorderList.orderProductStatus == 4}">
		               				<li><input type="button" value="구매확정" class="confirmBtn"></li>
		               				<li><input type="button" value="교환신청" class="exchangeBtn"></li>
		               				<li><input type="button" value="반품신청" class="refundBtn"></li>
		               			</c:when>
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
					<a href="/HwangDangFleamarket/order/diliveryStatus.go?page=${page}">
						${page}
					</a>
				</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/order/diliveryStatus.go?page=${requestScope.pagingBean.endPage +1}">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
</div> <!-- container -->