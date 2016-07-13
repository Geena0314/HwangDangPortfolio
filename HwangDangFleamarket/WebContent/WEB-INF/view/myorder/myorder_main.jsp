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
	min-height:  300px;
	min-width:  500px;
}   

#orderSeqNo
{
	display: none;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		
		var flag = false;
		var orderCancelList = "";
		var url = "";
		var loginId = $("#loginId").val();
		
		//폼전송 함수 
		function sendForm(url){
			
			if(flag){ 
				flag = false;
				orderCancelList = orderCancelList.substring( 0 ,orderCancelList.length-1);
				//console.log("split실행후:" +orderCancelList);
				//alert("split실행후:" +orderCancelList);
				$("#f2").prop("action" , url);
				$("#f2").submit();
			}
		}  
		//체크박스검증 및 orderList 검증  함수 
		function checkboxValidation(num1 , num2 , num3 , msg ){
			if( !$("input:checkbox").is(":checked") ){  //true,false
				alert("체크박스를선택해주세요.");
			}else{
				// 체크박스선택하였고 주문취소가 가능한 상태인지 검증 
				orderCancelList = "";
				$("input:checkbox:checked").each(function(){
					//console.log(this);
					//console.log("ordersSeqNo: " + $(this).val());
					var orderNo = $(this).val()
					//alert("ordersSeqNo: " +orderNo);
					var tr = $(this).parent().parent();
					//console.log($(tr).children().eq(3).text());
					var orderStatusText =$(tr).children().eq(3).text().trim();
					//console.log(orderStatusText);
					//alert("상태:" +orderStatusText);
					var orderStatus =  0;
					
					if(orderStatusText == "입금대기중" ){
						orderStatus = 0;
					}if(orderStatusText == "결제완료" ){
						orderStatus = 1;
					}if(orderStatusText == "배송준비중" ){
						orderStatus = 2;
					}if(orderStatusText == "배송중" ){
						orderStatus = 3;
					}if(orderStatusText == "배송완료" ){
						orderStatus = 4;
					}
					//alert("orderStatus 숫자:"+orderStatus);  //orderStatus 숫자로변경 
					
					if(orderStatus == num1 || orderStatus ==num2 || orderStatus ==num3 ){
						//취소할 주문번호 배열에 누적 
						orderCancelList = orderCancelList + orderNo +","
						flag = true;
					}else{
						alert(msg);
						flag = false;
						
					}
				}); //orderList 누적 for문
			} //else 
				
		}
		
		// 주문취소
		$("#btnRequestCancel").on("click",function(){
			var yesNO = confirm("정말취소하시겠습니까?");
			if(yesNO){
				var page =  $("#currentPage").text().trim();
				checkboxValidation(0 , 1 , 2 ,  "상품 발송후에는 주문취소를 할수없습니다.");
				url	="/HwangDangFleamarket/myorder/orderCancelList.go?orderCancelList="+orderCancelList+"&loginId="+loginId+"&status="+7+"&page="+page;
				sendForm(url);
			}
		}); //btn 
		
		
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
		$("#btnRequestChange").on("click",function(){
			var yesNO = confirm("정말 교환 신청을 하시겠습니까?");
			if(yesNO){
				//1.교환신청시 검증 수행 
				checkboxValidation(4,4, 4, "배송완료상품만 교환을 신청할수 있습니다.");
				
				//2. 검증통과 되었을 경우에만 폼오픈!
				if(flag){
					var option ='resizable=no scrollbars=yes width=513 height=660 left=500 top=200';
					window.open("/HwangDangFleamarket/myorder/exchangeRequestFormMove.go?orderSeqNo="+$(":checkbox:checked").val(), "교환신청", option);
				}
				//3. 교환로직, 입력폼 입력 끝나면 이동
				/* url	="/HwangDangFleamarket/myorder/cancel.go?loginId=${sessionScope.login_info.memberId}";
				$("#f2").prop("action" , url);
				$("#f2").submit(); */
			}
			
		});//교환신청
		
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
	배송현황 - 결제완료 : 1
	배송현황 - 배송준비중 : 2
	배송현황 - 배송중 : 3
	배송현황  - 배송완료 : 4
 -->
 
<div class="container">
	<h2 class="page-header store_look_around">나의주문 - 배송현황</h2>
	
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
	<h4><fmt:formatDate value="${order.orders_date }" pattern="yyyy-MM-dd" /> / orderno : ${order.ordersNo }</h4><br/>
		
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
				<c:when test="${orderProduct.orderProductStatus  == 0 }">입금대기중</c:when>
				<c:when test="${orderProduct.orderProductStatus  == 1 }">결제완료</c:when>
				<c:when test="${orderProduct.orderProductStatus  == 2 }">배송준비중</c:when>
				<c:when test="${orderProduct.orderProductStatus  == 3 }">배송중</c:when>
				<c:when test="${orderProduct.orderProductStatus ==  4 }">배송완료</c:when>
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
	<!-- 페이징 ◀버튼처리 -->  
	<p class="text-center">
	<c:choose>
		<c:when test="${requestScope.pagingBean.previousPageGroup }">
			<a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }&page=${requestScope.pagingBean.beginPage-1}">◀</a>
		</c:when>
		<c:otherwise>◁</c:otherwise>
	</c:choose>
		<!-- 페이지 번호 처리 -->  
		<c:forEach begin="${requestScope.pagingBean.beginPage }" end="${requestScope.pagingBean.endPage }" var="page">
			<c:choose>
				<c:when test="${requestScope.pagingBean.page == page }">
					<span id="currentPage">${page}</span>
				</c:when>
				<c:otherwise>
					<a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }&page=${page }">${page}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
	<!-- 페이징 ▶버튼 처리  -->
	<c:choose>
		<c:when test="${requestScope.pagingBean.nextPageGroup}">
			<a href="/HwangDangFleamarket/myorder/main.go?loginId=${sessionScope.login_info.memberId }&page=${requestScope.pagingBean.endPage +1 }">▶ </a>
		</c:when>
		<c:otherwise>▷</c:otherwise>
	</c:choose>
	<br/>  
	<!-- 버튼 -->
	<input type="button" value="주문취소" id="btnRequestCancel" class="btn btn-default"/>
	<input type="button" value="환불신청" id="btnRequestRefund" class="btn btn-default"/>
	<input type="button" value="교환신청" id="btnRequestChange" class="btn btn-default"/>
	</p>
  </div>
</div>

 </div> <!-- container -->
