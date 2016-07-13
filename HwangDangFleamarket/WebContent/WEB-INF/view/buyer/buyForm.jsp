<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>


	function addMileage(mileage){
		
		var originalMileage = $("#memberMileage").text().trim();
		
		var sum = 0;
		console.log(mileage);
		var value = $(mileage).html();
		parseInt(value);
		
		 var beforeTotal = $("#ordersTotalPrice").html().trim();
		parseInt(beforeTotal);
		totalTemp =  beforeTotal;
		
		sum =  beforeTotal - value;
		$("#ordersTotalPrice").html(sum); 
		$("#mileageCheckbox").prop("disabled" ,"disabled");
		
		originalMileage = originalMileage -value;
		$("#memberMileage").text(originalMileage);
		
	}  

	/* 멤버 마일리지 조회 */
	function getMemberMileage(){
		$.ajax({
			"url" : "/HwangDangFleamarket/buy/getMemberMileageAjax.go" ,
			"type" : "POST"  ,
			"data" : "memberId="+$("#hiddenMemberId").val().trim() ,
			"dataType" : "text" ,
			"beforeSend" : function(){
				//alert("TEST ID: "+$("#hiddenMemberId").val().trim());
			},
			"success" : function(returnMileage){
				//alert(returnMileage);
				$("#memberMileage").html(returnMileage);
			}, 
			"error"  : function(a ,status , httpErrorMsg){
				alert("마일리지조회 ajax 예외: " + status +httpErrorMsg);
			}
			
		});
	}
	
	$(document).ready(function(){
		
		//마일리지 ajax통신을 이용하여 조회
		getMemberMileage();
		   
		var total = 0;  
		//총 주문가격 조회  - productPrice   
		$(".partProductPrice").each(function(index){
			var oneProductPrice  = $(this).html().trim();
			var price = parseInt(oneProductPrice);
			total = total + price;
		});
		//계산한 결과를 반영
		$("#productPrice").html(total);
		$("#ordersTotalPrice").html(total);
		 
		// 주문자 정보를 임시로 저장할 변수들  
		var temp_ordersReceiver =$("#memberName").html().trim();
		var temp_ordersPhone =$("#memberPhone").html().trim();
		var temp_ordersZipcode =$("#memberZipcode").html().trim();
		var temp_ordersAddress =$("#memberAddress").html().trim();
		var temp_ordersSubAddress = $("#memberSubAddress").html().trim();
		var temp_currentAddress = "";
		
		var ordersTotalPriceTemp  = $("#ordersTotalPrice").html().trim();
		var memberMileageTemp  =  getMemberMileage();
		var productPriceTemp = $("#productPrice").html().trim();
		
		//배송옵션 선택시 자동입력
		$("#requestOption").on("change", function(){
			//alert(this.value); 
			$("#requestInfo").val(this.value);
			
		});
		
		//ajax : 최근배송지 조회하기
		$("#currentDeliveryAddress").on("click" ,function(){
			//alert($("#hiddenMemberId").val());
			$.ajax({
				"url" : "/HwangDangFleamarket/buy/currentDeliveryAddress.go" ,
				"type" : "POST"  ,
				"data" : "memberId="+$("#hiddenMemberId").val().trim() ,
				"dataType" : "json" ,
				"beforeSend" : function(){
					//alert("TEST ID: "+$("#hiddenMemberId").val().trim());
				},
				"success" : function(orders){
					//alert(orders.ordersPhone);
					$("#originalAddress").show();
					$("#hiddenAddress").hide();
					temp_ordersReceiver = $("#memberName").html().trim();
					$("#memberName").html(orders.ordersReceiver);
					
					temp_currentAddress = $("#memberAddress").html().trim();
					$("#memberAddress").html(orders.currentAddress);
					
					temp_ordersPhone = $("#memberPhone").html().trim();
					$("#memberPhone").html(orders.ordersPhone);
					
					temp_ordersSubAddress = $("#memberSubAddress").html().trim();
					$("#memberSubAddress").html(orders.ordersSubAddress);
					
					temp_ordersZipcode = $("#memberZipcode").html().trim();
					$("#memberZipcode").html(orders.ordersZipcode);
				} ,
				"error" : function( a , status, HttpErrorMsg ){
					alert("ajax:통신실패:" + status + HttpErrorMsg);
					//console.log("ajax:통신실패:" + status + HttpErrorMsg);
				}
			});
		});
		
		//배송지선택 -원상복귀 - memberTB의 주소정보로 변경 
		$("#diliverAddress").on("click" ,function(){
			$("#memberName").html(temp_ordersReceiver);
			$("#memberAddress").html(temp_ordersAddress);
			$("#memberPhone").html(temp_ordersPhone);
			$("#memberSubAddress").html(temp_ordersSubAddress);
			$("#memberZipcode").html(temp_ordersZipcode);
		});
		
		//새로운배송지 입력태그들 show 
		$("#newAddress").on("click" , function(){
			$("#originalAddress").hide();
			$("#hiddenAddress").show();
			
		});
		
		//새로운배송지 입력태그들 hide 
		$("#diliverAddress").on("click" , function(){
			$("#originalAddress").show();
			$("#hiddenAddress").hide();
			
		});
		
		//주소지입력 버튼 클릭 
		$("#findAddress").on("click",function(){
			var specs = "left=100,top=100,width=600,height=500";
			  specs += ",toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
			window.open("/HwangDangFleamarket/popup.jsp","addressForm" ,specs);
		});
	
		
		//결제버튼 클릭
		$("#submitBtn").on("click",function(){
			
			//검증1. 결제수단 반드시 체크확인 !
			if($('input:radio[name=payment]').is(':checked') == false){
				alert("결제방법을 확인하세요.");
				return false;
			}
			
			//검증2. 사용한 마일리지 > 실제결제금액 큰경우 확인 
			//즉 실제결제금액이 마이너스 인경우 !!! 
			if($('#ordersTotalPrice').html().trim() < 0 ){
				alert("마일리지 사용금액이 실제 결제금액을 초과합니다. 마일리지 사용값을 확인해주세요");
				return false;
			}
			
			
			//0. 파라미터 
			var ordersReceiver = "";
			var ordersZipcode = "";
			var ordersAddress = "";
			var ordersSubAddress = "";
			var ordersPhone ="";

			//1.새로운 배송지 선택시 검증 로직 
			if( $("#newAddress").is(":checked") ){
				ordersReceiver = $("#name").val();
				var phone1 = $("#phone1").val().trim();
				var phone2 = $("input[name=phone2]").val().trim();
				var phone3 = $("#phone3").val().trim();
				
				 ordersZipcode = $("#zipcode").val().trim();
				 ordersAddress = $("#address1").val().trim();
				 ordersSubAddress = $("input[name=address2]").val().trim();
				//alert(name+phone1+phone2+phone3+zipcode+address1+address2);
				
				if(ordersReceiver.length == 0){
					alert("받는분을 입력해주세요.");
					return false;
				}if(phone2.length == 0 ||  phone2.length > 4 ){
					alert("연락처를 정확히 입력해주세요.");
					return false;
				}if(phone3.length == 0 || phone3.length > 4 ){
					alert("연락처를 정확히 입력해주세요.");
					return false;
				}if(ordersZipcode.length == 0){
					alert("주소찾기 버튼을 눌러 주소를 입력해주세요.");
					return false;
				}if(ordersAddress.length == 0){
					alert("주소찾기 버튼을 눌러 주소를 입력해주세요.");
					return false;
				}if(ordersSubAddress.length == 0){
					alert("주소찾기 버튼을 눌러 주소를 입력해주세요.");
					return false;
				}
				ordersPhone = ordersPhone+phone1+"-"+phone2+"-"+phone3;
				
			}else{
				//기존주소로 구매하였다면 히든요소 삭제 
				$("#newAddress").empty();
				 ordersReceiver = $("#memberName").html().trim();
				 ordersPhone = $("#memberPhone").html().trim();
				 ordersZipcode = $("#memberZipcode").html().trim();
				 ordersAddress = $("#memberAddress").html().trim();
				 ordersSubAddress = $("#memberSubAddress").html().trim();
				 
			}
			
			
			var ordersTotalPrice = $("#ordersTotalPrice").html().trim();
			//결제방식 0:현금결제 ,1 카드결제등등 		
			var ordersPayment = $(":radio[name=payment]:checked").val();
			
			
			var bank = "";
			var card  = "";
			var quota = "";
			if(ordersPayment == 0){
				//현금결제시 은행명 가져오기
				bank = $("#bankSelect option:selected").text().trim(); 
			}else if(ordersPayment == 1){
				//카드 결제시  , 
				card = $("#cardSelect option:selected").text().trim(); 
				quota = $("#cardSelectOption option:selected").text().trim(); 
			}
			//주문요청사항
			var ordersRequest = $("#requestInfo").val();
			
			//결제상태 결제완료 :1 /결제대기중 :0 .. 
			var paymentStatus = 1;
			
			
			/* var ordersDate = new Date().format("yyyy-MM-dd"); */
			var memberId = $("#hiddenMemberId").val();
			
			var ordersPayment = $(":radio[name=payment]:checked").val();
			var orderProductStatus = 0;
			
		
			if(ordersPayment == 0){
				orderProductStatus = 0; //미결재 
			}else if (ordersPayment == 1 || ordersPayment == 2 || ordersPayment == 3 ) {
				orderProductStatus =1;  //결제완료 
			}
			 var queryString = "";
			// if($("#oneOrN").html().trim() == '1'){
				if($("#hiddenFlaN").val() != 'ok'){
				
				 	//alert("한개구매");
				 	//한개구매  
				 	 queryString = "?ordersNo=${requestScope.ordersNo}&ordersReceiver="+ordersReceiver+"&ordersPhone="+ordersPhone+"&ordersZipcode="
					 +ordersZipcode+"&ordersAddress="+ordersAddress+"&ordersSubAddress="+ordersSubAddress
					 +"&ordersTotalPrice="+ordersTotalPrice+"&ordersPayment="+ordersPayment
					 +"&ordersRequest="+ordersRequest+"&paymentStatus="+paymentStatus+"&memberId="+memberId+
					 "&orderAmount=${param.amount }&productId=${param.productId  }&sellerStoreNo=${param.sellerStoreNo }&orderProductStatus="
					 +orderProductStatus+"&optionId="+$("#optionId").val().trim() +"&usedMileage="+$("#useMileage").html()+"&bank="+bank
					 +"&card="+card+"&quota="+quota;	
					$("form").prop("action", "/HwangDangFleamarket/buy/buyProductOne.go"+queryString);
		        
			 }else{
				 	//alert("n개구매");
				 	//N개구매
				 	//optionId sellerStoreNo  productId amount
				 	var optionIdList = "";
				 	var sellerStoreNoList ="";
				 	var productIdList = "";
				 	var amountList = "";
				 	
				 	$(".optionId").each( function(index){
				 		optionIdList = optionIdList + this.value + ",";
				 	});
				 	
				 	$(".sellerStoreNo").each( function(index){
				 		sellerStoreNoList = sellerStoreNoList + this.value + ",";
				 	});
				 	
					$(".productId").each( function(index){
						productIdList = productIdList + this.value + ",";
				 	});
					
					$(".amount").each( function(index){
						amountList = amountList + $(this).html().trim() + ",";
				 	});
				 	
					//alert("optoinIdList:"+optionIdList+" , sellerStoreNoList :" + sellerStoreNoList +", productIdList: "+ productIdList + ",amountList "+amountList);
				 	        
				 	  queryString = "?ordersNo=${requestScope.ordersNo}&ordersReceiver="+ordersReceiver+"&ordersPhone="+ordersPhone+"&ordersZipcode="
					 +ordersZipcode+"&ordersAddress="+ordersAddress+"&ordersSubAddress="+ordersSubAddress
					 +"&ordersTotalPrice="+ordersTotalPrice+"&ordersPayment="+ordersPayment
					 +"&ordersRequest="+ordersRequest+"&paymentStatus="+paymentStatus+"&memberId="+memberId+
					 "&amountList="+ amountList + "&productIdList=" +productIdList+ "&sellerStoreNoList="+sellerStoreNoList +"&orderProductStatus="+orderProductStatus+
					 "&optionIdList="+optionIdList  +"&usedMileage="+$("#useMileage").html().trim()+"&cartNoList=${requestScope.cartNoList }&bank="+bank+"&card="+card+"&quota="+quota;	;	
					$("form").prop("action", "/HwangDangFleamarket/buy/buyProducts.go"+queryString);
			 }
			  
			// alert(queryString);
			$("form").submit(); 
		}); //결제버튼
	
		//무통장입금 요소 show()  / 다른요소 hide()
		$("#bank").on("click" ,function(){
			$("#pay_cart").hide();
			$("#pay_bank").show();
		});
		//카드결제 선택시 요소 show() / 다른요소 hide()
		$("#card").on("click" ,function(){
			$("#pay_bank").hide();
			$("#pay_cart").show();
		});
		
		
		//마일리지 모두 사용!
		$("#mileageCheckbox").on("click",function(){
			if( $("#mileageCheckbox").is(":checked") ){
				
				//	productPrice -  useMileage = ordersTotalPrice
				
				var memberMileage = $("#memberMileage").text().trim();
				var productPrice = $("#productPrice").html().trim();
				 
				productPrice = parseInt(productPrice);
				memberMileage = parseInt(memberMileage);
				
				//화면 사용할 마일리지에 적용  
				$("#useMileage").text(memberMileage);
				
				//체크해제를 대비하여 temp변수들에 임시 저장 
				productPriceTemp =   productPrice;
				memberMileageTemp  = memberMileage;
				//ordersTotalPriceTemp  = ordersTotalPrice;
				
				var sum  =  productPrice - memberMileage;
				
				$("#ordersTotalPrice").html(sum);
				$("#useMileageBtn").prop("disabled","disabled");
				
				//기존마일리값을 0으로 변경 
				$("#memberMileage").text(0);
			
			}else{ 
				//체크해재되면 마일리지 지움 
				$("#useMileage").text("");
				$("#ordersTotalPrice").html(productPriceTemp);
				$("#useMileageBtn").prop("disabled",false);
				//기존마일리지값을 원복   -temp 이용
				$("#memberMileage").text(memberMileageTemp); 
			}
			
		});
		  
		
		//사용할 마일리지포인트 보이게하기!
		$("#useMileageBtn").click(function(){
			$("#spanMileage").show();
		});	
		
		
		//사용할 마일리지포인트 적용하기 !
		$("#mileageUseBtn").click(function(){
			var choiceMileage = $("#choiceMileage").val();
			if(choiceMileage.length == 0 ){
				alert("사용할 마일리지값을 입력하세요.");
				return false;
			}
			choiceMileage = parseInt(choiceMileage);
			
			//검증
			var cutline = $("#memberMileage").text().trim();
			cutline = parseInt(cutline);
			         
			if(cutline <  choiceMileage){
				alert("현재보유마일리지는 "+cutline +"점 입니다. 보유마일리지만큼 사용가능합니다.");
				$("#choiceMileage").val("");
				$("#choiceMileage").focus();
				return false;     
				                 
			}else if(choiceMileage <= 0) {
				alert("사용할마일리지는 1이상되어야 합니다.");
			}else {
				//마일리지 적용 로직 
				
				//1. 마일리지 폼에 적용 
				$("#useMileage").html(choiceMileage);
				//1-2. 실제결제금액에 적용  
				var ordersTotalPrice = $("#ordersTotalPrice").html().trim();
				ordersTotalPrice = parseInt(ordersTotalPrice);
				var ordersTotalPriceTemp  = ordersTotalPrice;
				ordersTotalPrice = ordersTotalPrice -choiceMileage;
				$("#ordersTotalPrice").html(ordersTotalPrice);
				
				
				//2. temp 에 보관
				memberMileageTemp = cutline;
				
				//3.사용가능포인트 마이너스 
				cutline = cutline - choiceMileage;
				$("#choiceMileage").val(0);
				$("#memberMileage").text(cutline);
				
				/* productPriceTemp =   productPrice;
				memberMileageTemp  = memberMileage; */
			}
			
		});
		
		//마일리지 적용취소 
	$("#mileageCancelBtn").click(function(){
		//멤버마일리지 취소 
		$("#memberMileage").text(memberMileageTemp); 
		 $("#ordersTotalPrice").html(ordersTotalPriceTemp);
		$("#useMileage").text(0);
		
	});
		
	
	//결제라디오 버튼 검증 : 반드시 선택되도록 검증!
	
			
	}); //ready
	
</script>

<!-- <h2 class="page-header store_look_around">구매페이지</h2> -->

<div class="container">
<form action="" method="POST" name="buy_form" class="form-inline"  >
<input type="hidden" value="${sessionScope.login_info.memberId }" id="hiddenMemberId"	/>
<input type="hidden" value="${requestScope.flaN }" id="hiddenFlaN"	/>
 
<table class="table">
	<tr>
		<td>  
			<h2>배송지 선택</h2>
			<div style="border: 3px solid lightgray; padding: 15px; margin: 10px;">
			<label><input type="radio" name="diliverAddress" id="diliverAddress"  checked="checked"> ${sessionScope.login_info.memberName}</label>   
			<label><input type="radio" name="diliverAddress" id="currentDeliveryAddress"> 최근배송지</label>
			<label><input type="radio" name="diliverAddress" id="newAddress"> 새로운배송지</label><br/>
			<hr/>
			<p class="text-left">
			<span id="originalAddress" >
				<span id="memberName">${sessionScope.login_info.memberName}</span> <span id="memberPhone">${sessionScope.login_info.memberPhone}</span> <br/>
				<span id="memberAddress">${sessionScope.login_info.memberAddress}</span> <span id="memberSubAddress">${sessionScope.login_info.memberSubAddress}</span><br/>
				<font size="1.5em">우편번호 : [<span id="memberZipcode">${sessionScope.login_info.memberZipcode}</span>]</font><br/>
		  		<input type="button" id="setBtn" value="수정" class="btn btn-default" /><br/>
		  	</span>
		  	
		  	<span id="hiddenAddress" hidden="true">
			받는분 <input type="text" name="name" id="name" class="form-control"/><br/>
			휴대전화 
			<select name="phone1" id="phone1" class="form-control">
				<option>010</option>
				<option>011</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			-<input type="text" name="phone2" id="phone2" class="form-control"/> -
			 <input type="text" name="phone3" id="phone3" class="form-control"/><br/>
				주소 
				<input type="button" value="주소찾기"  id="findAddress" />
				<input type="text" name="zipcode" id="zipcode" disabled="disabled" size="10" class="form-control"/><br/>
				<input type="text" name="address1" id="address1" disabled="disabled"  size="45" class="form-control"/><br/>
				<input type="text" name="address2"  size="45" class="form-control"/>
			 </span><br/>
		  	
		  	<select name="requestOption" id="requestOption" class="form-control">
				<option>배송시 요청사항을 선택해주세요.</option>
				<option>배송전, 연락바랍니다.</option>
				<option>부재시, 경비실에 맡겨주세요.</option>
				<option>부재시, 전화또는 문자 연락주세요.</option>
			</select><br/>
		  	배송요청정보 : <input type="text" name="requestInfo" id="requestInfo"class="form-control" size="40" >
		  	</p>
		  	</div>	
		  	
		  	
		  	<h2>할인 및 포인트 선택</h2>
		  	<div style="border: 3px solid lightgray; padding: 15px; margin: 10px;">
		  	사용가능 포인트 :<span id="memberMileage"></span>점<br/><hr/>
		  	모두사용하기&nbsp;&nbsp;
		  	<input type="checkbox" id="mileageCheckbox" />&nbsp;&nbsp;
		  	<input type="button" value="마일리지 금액 선택" id="useMileageBtn" class="btn btn-default" />
		  	<br/>
		  	<span hidden="true" id="spanMileage">사용할 마일리지 입력 :
		  	<input type="number" name="choiceMileage" id="choiceMileage"  class="form-control" size="10" />
		  		<input type="button" value="사용하기"  id="mileageUseBtn" class="btn btn-default"/>
		  		<input type="button" value="사용취소" id="mileageCancelBtn"class="btn btn-default" />
		  	</span><br/>
			</div>
			
			<h2>결제수단 선택</h2>
			<div style="border: 3px solid lightgray; padding: 15px; margin: 10px;">
			<input type="radio" name="payment" value="0" id="bank">무통장입금
			<input type="radio" name="payment" value="1" id="card">카드결제
			<input type="radio" name="payment" value="2">자동이체
			<input type="radio" name="payment" value="3">간편결제
			<hr>
				 <!-- 현금결제 요소들 -->
				<div align="center" hidden="true" id="pay_bank">
				<h4 class="page-header" align="center">무통장 입금</h4>
					<ul>
						<li><p align="left"><strong>은행선택</strong>
					<select id="bankSelect" name="bank" class="form-control">
						<option>===은행선택===</option>
						<option>국민은행</option>
						<option>농협</option>
						<option>신한은행</option>
						<option>하나은행</option>
						<option>외환은행</option>
						<option>씨티은행</option>
						<option>우체국</option>
						<option>부산은행</option>
						<option>대구은행</option>
						<option>SC은행</option>
					</select>
					</p>
					</li>
					<li>
						<p align="left"><strong>현금영수증발급 : </strong>
						${sessionScope.login_info.memberName } 
						( ${sessionScope.login_info.memberPhone }) - 개인소득공제 
						<input type="button" class="btn btn-default" value="수정" class="btn btn-default">
						</p> 
					</li>
					</ul>
			</div>	
				 <!-- 카드결제 요소들 -->
				<div align="center" hidden="true" id="pay_cart">
				<h4 class="page-header" align="center">카드 결제</h4>
					<ul>
						<li><p align="left"><strong>카드 선택</strong>
						<select id="cardSelect" name="card" class="form-control">
							<option>===카드사===</option>
							<option>현대카드</option>
							<option>삼성카드</option>
							<option>신한카드</option>
							<option>롯데카드</option>
							<option>비씨카드</option>
							<option>하나카드</option>
							<option>우리카드</option>
						</select>
						</p>
					</li>
						<li><p align="left"><strong>할부선택</strong>
						<select id="cardSelectOption" name="cardOption" class="form-control">
							<option>일시불</option>
							<option>3</option>
							<option>5</option>
							<option>6</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
						</p>
					</li>
					
					<li>
						<p align="left"><strong>카드번호 입력 : </strong>
						<input type="text" name="card1" class="form-control" size="7" >-
						<input type="password" name="card2" class="form-control" size="7">-
						<input type="text" name="card3" class="form-control" size="7">-
						<input type="password" name="card4" class="form-control" size="7">
						</p> 
					</li>
					</ul>
				</div>
			</div>	
		</td>
			
		
		<td>
		<h2>주문상품 정보</h2>
		<div style="border: 3px solid lightgray; padding: 15px; margin: 10px;">
		<c:forEach  items="${requestScope.orderProductList }" var="op">
			<input type="hidden" id="optionId"  class="optionId" value="${op.productOption.optionId }"/>
			<input type="hidden"  class="sellerStoreNo" value="${op.sellerStoreNo }"/>
			<input type="hidden"  class="productId" value="${op.product.productId }"/>
			
			<span id="sellerStoreName" >${op.seller.sellerStoreName }</span> - <span id="productName">${op.product.productName  } </span><br/>
			<span id="productPricePer"><fmt:formatNumber type="currency">${op.product.productPrice } </fmt:formatNumber></span>
			<span>
				<font color="lightgray">+<fmt:formatNumber type="currency">${op.productOption.optionAddPrice } </fmt:formatNumber></font>
			</span>
			<span id="amount" class="amount"> ${op.orderAmount }</span>개
			<span id="option"> ${op.productOption.optionSubName } </span><br/>
			
			배송비 : 
			<span id="deriveryCharge">
			<c:choose>
				<c:when test="${ (op.product.productPrice  + op.productOption.optionAddPrice  )  * op.orderAmount  >= 50000 }">0</c:when>
				<c:otherwise>2500</c:otherwise>
			</c:choose>
			</span>원<br/>   
			<font color="gray" class="partProductPrice" size="5px" > 
			<c:choose>
				<c:when test="${ (op.product.productPrice  + op.productOption.optionAddPrice )  * op.orderAmount  >= 50000 }">${(op.product.productPrice+op.productOption.optionAddPrice)*op.orderAmount }</c:when>
				<c:otherwise>${(op.product.productPrice+op.productOption.optionAddPrice)*op.orderAmount + 2500 } </c:otherwise>
			</c:choose>
			</font>
			<br/><hr/>	
		</c:forEach>
		<br/>
			<p class="text-center">총 <font color="blue"><span id="oneOrN">${fn:length(requestScope.orderProductList) }</font> 건
			</span></p><br/>
		</div>
		<br/>
		<h2>최종결제 정보</h2>
			<div style="border: 3px solid black; padding: 15px; margin: 10px;">
			 결제예정금액 : <strong><span id="productPrice"></span>원</strong><br/>
			사용할 마일리지 :<strong><span id="useMileage" ></span></strong><br/>
			 실제결제금액:<font size="9" color="red" ><span id="ordersTotalPrice"></span></font>원<br/>
			
			<input type="button" value="결제하기" id="submitBtn" class="btn btn-default" />
			</div>
		</td>
	</tr>
</table>		
</form>
</div>

