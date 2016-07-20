<%@page import="com.hwangdang.serviceimpl.MemberServiceImpl"%>
<%@page import="com.hwangdang.service.MemberService"%>
<%@page import="com.hwangdang.vo.Member"%>
<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"  %>
<style>
	#layer{
		width : 1000px;
	}
.center-block {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.element {
  .center-block();
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#gotoMainBtn").click(function(){
			location.href = "/HwangDangFleamarket/main.go";
			
		});
	});  

</script>   
    
<div class="container">
	<div class="center-block">
	<div style="border: 6px solid lightgray; padding: 25px; margin: 20px; width: 500px; float: left">
	<mark>저희 마켓을 이용해주셔서 감사합니다.</mark>
	<input type="button" class="btn btn-default" value="확인" id="gotoMainBtn"/>
	</div>
	
	
	<div style="border: 6px solid lightgray; padding: 25px; margin: 20px; width: 500px; float: left">
	<h2>배송정보</h2>
	<hr>
	받는사람 : ${sessionScope.orders.ordersReceiver } <br/>
	배송지 :[${sessionScope.orders.ordersZipcode }] 
	${sessionScope.orders.ordersAddress } 
	${sessionScope.orders.ordersSubAddress } 
	 / ${sessionScope.orders.ordersPhone }<br/>
	 ${sessionScope.orders.ordersRequest }  
	  <!-- 결제방식 0 무통장입금 : , 1카드결제 , 2자동이체 , 3.간편결제       -->
	  <!--  결제여부 0 : 미결제  , 1. 결제완료  -->
	</div>
	
	<div style="border: 6px solid lightgray; padding: 25px; margin: 20px; margin-bottom: 50px; width: 500px; float: left">
	<h2>결제정보</h2>
	<hr>
		결제방식 :
		<c:choose>
			<c:when test="${sessionScope.orders.ordersPayment  == 0 }">무통장입금</c:when>
			<c:when test="${sessionScope.orders.ordersPayment  == 1 }">카드</c:when>
			<c:when test="${sessionScope.orders.ordersPayment  == 2 }">자동이체</c:when>
			<c:otherwise>간편결제</c:otherwise>
		</c:choose>
		/결제여부 : 
		<c:choose>
			<c:when test="${sessionScope.orders.ordersPayment  == 0 }">입금전 </c:when>
			<c:otherwise>결제 완료</c:otherwise>
		</c:choose>
		<br/>		
		<c:choose>
			<c:when test="${sessionScope.bank != null }">
				 은행명 : ${sessionScope.bank }
				 계좌번호 : ${sessionScope.vitualBankNo }
		
			</c:when>
			<c:when test="${sessionScope.card != null }">
				 카드회사 : ${sessionScope.card }
				 할부 : ${sessionScope.quota }
			</c:when>
		</c:choose>
		<br/>
		<%--  <!-- 사용한 마일리지가 있다면 사용한 마일리지금액 및 남은 금액 화면에 출력-->--%>
		사용한 마일리지 금액 :
		<c:choose>
			<c:when test="${sessionScope.usedMileage > 0  }">
				 ${sessionScope.usedMileage } 점
			</c:when>
			<c:otherwise>
				0점
			</c:otherwise>
		</c:choose>
		<br/>
		<font size="8px" color="blue"><fmt:formatNumber type="currency"> ${sessionScope.orders.ordersTotalPrice }
		 </fmt:formatNumber> 원</font><br/>
		
		</div>
		
		<%  
			// 세션정보 삭제!
			if(session.getAttribute("bank") != null){
				session.removeAttribute("bank");
				session.removeAttribute("vitualBankNo");
			}else if(session.getAttribute("card") != null){
				session.removeAttribute("card");
				session.removeAttribute("quota");
			}else if(session.getAttribute("usedMileage") != null){
				session.removeAttribute("usedMileage");
			}
		%>
	<hr/>	         
	
		<div style="border: 6px solid lightgray; padding: 25px; margin: 20px; width: 500px; float: left">
		<h2>주문정보</h2>
		<hr>  
		주문번호 : ${sessionScope.orders.ordersNo } <br/> 
		<c:forEach  var="op" items="${sessionScope.orders.orderProductList }">
			상품명/가격  :  ${op.product.productName } / ${op.product.productPrice } <br/>
			수량/옵션정보 :  ${op.orderAmount}개    / ${op.productOption.optionSubName } <br/>
		</c:forEach> 
		</div>
	</div> 
</div>     


