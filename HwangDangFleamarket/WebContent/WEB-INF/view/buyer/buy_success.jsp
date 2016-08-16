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
ul.btns{
	margin: 0px;
}
.orderSeqNo{
	display: none;
}
</style>
<div class="myorder-container">
	<h2 class="page-header store_look_around">주문 내역</h2>
	<div class="myorder-tabs">
		<c:choose>
			<c:when test="${empty requestScope.diliveryStatus}">
				주문에 실패했습니다.
			</c:when>
			<c:otherwise>
				<p>
					<b>주문일자  <fmt:formatDate value="${requestScope.diliveryStatus[0].orders.ordersDate }" pattern="yyyy-MM-dd" /> │ 주문번호  ${requestScope.diliveryStatus[0].orders.ordersNo}</b>
				</p>
				<ul class="contentList">
		      		<c:forEach items="${requestScope.diliveryStatus}" var="myorderList" varStatus="no">
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
				               	  ${myorderList.product.productPrice + myorderList.productOption.optionAddPrice}원
				               </li>
				            </ul>
				            <div class="status">
				               <ul class="btns">
			               			<li>배송 준비</li>
				               </ul>
				            </div>
				         </li>
		   			</c:forEach>
		   		 </ul>
			</c:otherwise>
		</c:choose>
	</div> <!-- my order tabs -->
</div>