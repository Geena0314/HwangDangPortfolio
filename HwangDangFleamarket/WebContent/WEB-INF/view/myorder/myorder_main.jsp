<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<style>
img {
	width : 100px;
	height : 70px;
}
.container{
	min-height:  200px;
	min-width:  500px;
}   
#orderSeqNo{
	display: none;
}
</style>
<script>
	$(document).ready(function(){
		
		var flag = false;
		var ordercancelList = "";
		var url = "";
		var loginId = $("#loginId").val();
		
		//폼전송 함수 
		function sendForm(url){
			
			if(flag){ 
				flag = false;
				ordercancelList = ordercancelList.substring( 0 ,ordercancelList.length-1);
				//console.log("split실행후:" +ordercancelList);
				//alert("split실행후:" +ordercancelList);
				$("#f2").prop("action" , url);
				$("#f2").submit();
			}
		}  
		
		// 주문취소
		$("#btnRequestCancel").on("click",function()
		{
			if($(":checkbox:checked").length == 0)
			{
				alert("주문취소할 상품을 1개 선택해 주세요.");
				return false;
			}
			if($(":checkbox:checked").length != 1)
			{
				alert("한번에 하나의 상품만 주문취소 가능합니다.");
				$(":checkbox:checked").removeAttr("checked");
				return false;
			}
			else
			{
				var flag = confirm("정말취소하시겠습니까?");
				if(flag)
				{
					url ='/HwangDangFleamarket/myorder/ordercancel.go?orderSeqNo='+$(":checkbox:checked").val();
					sendForm(url);
				}
			}
		});
		
		// 환불신청 
		$("#btnRequestRefund").on("click",function(){
			if($(":checkbox:checked").length == 0)
			{
				alert("환불할 상품을 1개 선택해 주세요.")
				return false;
			}
			if($(":checkbox:checked").length != 1)
			{
				alert("한번에 하나의 상품만 환불 가능합니다.");
				$(":checkbox:checked").removeAttr("checked");
				return false;
			}
			else
			{
				window.open('/HwangDangFleamarket/myorder/refundForm.go?orderSeqNo='+$(":checkbox:checked").val(), '환불신청', 'resizable=no scrollbars=yes width=463 height=648 left=500 top=200')
			}	
		});
		
		// 교환신청 
		$("#btnRequestChange").on("click",function()
		{
			if($(":checkbox:checked").length == 0)
			{
				alert("교환할 상품을 1개 선택해 주세요.")
				return false;
			}
			if($(":checkbox:checked").length != 1)
			{
				alert("한번에 하나의 상품만 교환 가능합니다.");
				$(":checkbox:checked").removeAttr("checked");
				return false;
			}
			else
			{
				window.open('/HwangDangFleamarket/myorder/exchangeForm.go?orderSeqNo='+$(":checkbox:checked").val(), '교환신청', 'resizable=no scrollbars=no width=463 height=800 left=500 top=80')
			}
		});
		
		//구매확정 
		$("button").on("click",function(){
			var yes_no = confirm("정말 구매확정하시겠습니다. 구매확정하시면 되돌릴수 없습니다.");
			if(yes_no){
				//alert(this.value);
				var ordersNo = this.value;
				//alert(ordersNo);
				var page =  $("#currentPage").text().trim();
				//alert(page);
				
				url	="/HwangDangFleamarket/myorder/orderStatusChange.go?orderList="+ordersNo+"&loginId="+loginId+"&status="+10+"&page="+page;  
				//alert(url);
				$("#f2").prop("action" , url);
				$("#f2").submit();
			}else{
				alert("취소하셨습니다.");
				return false;
			}
		}); //구매확정
		
		$(".detail").on("click",function(){
			alert("디테일버튼" + this);
			console.log(this);
		}); 
		
	}); //docudent  
</script>

<!-- 배송현황 조회
	배송현황 - 입금대기중 : 0 
	배송현황 - 결제완료    : 1
	배송현황 - 배송준비중 : 2
	배송현황 - 배송중       : 3
	배송현황 - 배송완료    : 4
 -->
 
<div class="container" style="margin-bottom: 30px;">
	<h2 class="page-header store_look_around">나의주문 - 배송현황</h2>
	
	<div class="row" style="position: relative; top: -20px;">
	<!-- 네비게이션 바Area -->
	<ul class="nav nav-tabs">       
	 	<li role="presentation" class="active"><a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }">배송 현황</a></li>
	  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/success.go?loginId=${sessionScope.login_info.memberId }">구매 확정</a></li>
	  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/cancel.go?loginId=${sessionScope.login_info.memberId }">교환/환불/취소</a></li>
	 </ul>
	
	 <!-- 본문 Area -->
	 <div class="col-md-12 ">
	 	<form action=""  method="post"  id="f2">
		<input type="hidden" id="loginId" value="${sessionScope.login_info.memberId }" />
		
		<c:forEach items="${requestScope.orderList }"  var="order" > 
			<div class="parent">
	
			<!-- 주문날짜 -->
			<h4><fmt:formatDate value="${order.orders_date }" pattern="yyyy-MM-dd" /> / orderNo : ${order.ordersNo }</h4><br>
		
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
			<strong class="ordersStatus">  
				<c:choose>
					<c:when test="${orderProduct.orderProductStatus == 0 }">입금대기중</c:when>
					<c:when test="${orderProduct.orderProductStatus == 1 }">결제완료</c:when>
					<c:when test="${orderProduct.orderProductStatus == 2 }">배송준비중</c:when>
					<c:when test="${orderProduct.orderProductStatus == 3 }">배송중</c:when>
					<c:when test="${orderProduct.orderProductStatus == 4 }">배송완료</c:when>
				</c:choose> 
			</strong>  
					</td>
				  
				<td>      
				<!-- 구매확정 버튼 -->       
					<c:if test="${orderProduct.orderProductStatus  == 4 }">
						<button class="btn btn-success"  value="${orderProduct.orderSeqNo}"  >구매확정</button>
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
	<%-- 페이징 처리 --%>
	<div class="pageGroup" align="center">
		<%-- ◀이전 페이지 그룹 처리 --%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.previousPageGroup}">
				<a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }&page=${requestScope.pagingBean.beginPage-1}">
					◀ 
				</a>
			</c:when>
			<c:otherwise>◀</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<%--페이지 처리 --%>
		<c:forEach begin="${requestScope.pagingBean.beginPage}"
			end="${requestScope.pagingBean.endPage}" var="page">
			<c:choose>
				<c:when test="${page == requestScope.pagingBean.page}">
		  				<b>${page}</b>
		 			</c:when>
				<c:otherwise>
					<a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }&page=${page }">
						${page}
					</a>
				</c:otherwise>
			</c:choose>
		&nbsp;&nbsp;
		</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }&page=${requestScope.pagingBean.endPage +1 }">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
	<!-- 버튼 -->
	<input type="button" value="주문취소" id="btnRequestCancel" class="btn btn-default"/>
	<input type="button" value="환불신청" id="btnRequestRefund" class="btn btn-default"/>
	<input type="button" value="교환신청" id="btnRequestChange" class="btn btn-default"/>
  </div>
  </div>
 </div> <!-- container -->
