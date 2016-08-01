<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<div class="myorder-container">
	<h2 class="page-header store_look_around">나의주문 - 배송현황</h2>
	
	<div class="myorder-tabs">
		<!-- 네비게이션 바Area -->
		<ul class="nav nav-tabs">       
		 	<li role="presentation" class="active"><a href="/HwangDangFleamarket/order/diliveryStatus.go">배송 현황</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }">구매 확정</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/cancel.go?loginId=${sessionScope.login_info.memberId }">교환/환불/취소</a></li>
		 </ul>
		 
		 <!-- 주문일자 | 주문번호 -->
		 <!-- 상품 img, 상품 id, 상품명, 옵션, 수량, 가격 -->
		 <!-- 배송 현황이 '배송중' 이전 일 경우 배송 현황 + 주문취소 버튼 -->
		 <!-- 배송 중 일 경우에는................배송중만 보여줌.............. -->
		 <!-- 배송 완료 이후에는 구매확정 (action), 교환신청, 환불신청 버튼 -->
		 <form action="/HwangDangFleamarket/myorder/success.go?page=${requestScope.pagingBean.page}">
		 
		 
		 
		 </form>
		 
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