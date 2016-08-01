<%@ page contentType="text/html;charset=utf-8"%>
<div class="myorder-container">
	<h2 class="page-header store_look_around">나의주문 - 배송현황</h2>
	
	<div class="myorder-tabs">
		<!-- 네비게이션 바Area -->
		<ul class="nav nav-tabs">       
		 	<li role="presentation" class="active"><a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }">배송 현황</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }">구매 확정</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/cancel.go?loginId=${sessionScope.login_info.memberId }">교환/환불/취소</a></li>
		 </ul>
		 
		 <!-- 주문일자 | 주문번호 -->
		 <!-- 상품 img, 상품 id, 상품명, 옵션, 수량, 가격 -->
		 <!-- 배송 현황이 '배송중' 이전 일 경우 배송 현황 + 주문취소 버튼 -->
		 <!-- 배송 중 일 경우에는................배송중만 보여줌.............. -->
		 <!-- 배송 완료 이후에는 구매확정, 교환신청, 환불신청 버튼 -->
		 
		 
		 
		 
	 </div> <!-- my order tabs -->
</div> <!-- container -->