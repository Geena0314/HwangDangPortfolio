<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<style type="text/css">
table, td, th {
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
	border-left: none;
	border-right: none;
	text-align: center;
}
table {
	width: 100%;
}
.thead{
	background-color: whitesmoke;
}
.tfoot{
	background-color: whitesmoke;
}
td {
	border: none;
}
a {
	text-decoration: none;
	color: gray;
}

a:HOVER {
	text-decoration: underline;
}

b {
	font-size: 15pt;
}
img{
	width: 100px;
	height: 100px; 
	float: left;
}
ul li{
	list-style: none;
}
.estimatedPrice{
	display: block;
	border: 2px solid lightgray;
	text-align: right;
}
.bottomBtn{
	float: right;
}
.cartListSection{
	width: 70%;
	margin-bottom: 70px;
	position: relative;
	left: 14%;
	color: gray;
}
.bottomBtn input{
	width: 110px;
}
</style>
<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
<script type="text/javascript">
$( document ).ready( function(){
	//셀러 스토어 넘버.
	var sellerStoreNo = $(".delivery");
	//상품가격.
	var realPrice = $(".realPrice");
	//$('.deliveryPrice:eq("7")').text()
	for(var i = 0; i < realPrice.length; i++){
		if(realPrice[i].value >= 30000){
			continue;
		}
		else{
			var totalPrice = 0;
			for(var j = 0 ; j < realPrice.length; j++){
				//같은스토어 가격합침.
				if(i==j){
					continue;
				}
				else{	
					if(sellerStoreNo[i].value == sellerStoreNo[j].value){
						totalPrice = totalPrice + parseInt(realPrice[i].value) 
												+ parseInt(realPrice[j].value);
						if(totalPrice >= 30000){
							$('.deliveryPrice:eq('+ i +')').text("무료배송");
							$('.deliveryPrice:eq('+ j +')').text("무료배송");
							totalPrice = 0;
							break;
						}
					}
				}
			}
		} 
	}
	
    $('#basketAll').on("click", function() {
    	var sum = 0;
    	if($("#basketAll").prop("checked")){
            $("input[name=checkBasket]").prop("checked",true);
            $('tbody td:nth-child(4)').each(function(){
            	sum = sum + parseInt($(this).text().split("+")[0]) 
            			  + parseInt($(this).text().split("+")[1]);
            });
            $('#sum').text(sum);
            //전체 선택시 같은스토어 상품 가격이 30000원을 넘으면 무료배송 처리.
            //셀러 스토어 넘버.
			var sellerStoreNo = $(".delivery");
			//상품가격.
			var realPrice = $(".realPrice");
			//$('.deliveryPrice:eq("7")').text()
			for(var i = 0; i < realPrice.length; i++){
				if(realPrice[i].value >= 30000){
					continue;
				}
				else{
					var totalPrice = 0;
					for(var j = 0 ; j < realPrice.length; j++){
						//같은스토어 가격합침.
						if(i==j){
							continue;
						}
						else{	
							if(sellerStoreNo[i].value == sellerStoreNo[j].value){
								totalPrice = totalPrice + parseInt(realPrice[i].value) 
														+ parseInt(realPrice[j].value);
								if(totalPrice >= 30000){
									$('.deliveryPrice:eq('+ i +')').text("무료배송");
									$('.deliveryPrice:eq('+ j +')').text("무료배송");
									totalPrice = 0;
									break;
								}
							}
						}
					}
				} 
			}
        }else{
            $("input[name=checkBasket]").prop("checked",false);
            $('#sum').text(sum);
            //전체 해제시 3만원 이하 상품 배송비 2500원 적용.
            var realPrice = $(".realPrice");
            for(var i = 0; i < realPrice.length; i++){
            	if(realPrice[i].value < 30000){
            		$('.deliveryPrice:eq('+ i +')').text("2500원");
            	}
        	}
        }
    });
    /******************************************/
    $("input[name=checkBasket]").on("click", function(){
    	var totalPrice = parseInt($('#checkedEstimatedPrice').text());
    	var addPrice = $(this).parents().children("#price").text();
 		var price = addPrice.split("+");
    	if(this.checked){
    		totalPrice = totalPrice + parseInt(price[0]) + parseInt(price[1]);
    		$('#sum').text(totalPrice);
    	}else{
    		totalPrice = totalPrice - parseInt(price[0]) - parseInt(price[1]);
    		$('#sum').text(totalPrice);
    	}
    	//배송비
    	var allCheckBox = $("input:checkbox[name=checkBasket]").length;
    	//체크된 체크박스들
    	var checkedBox = $("input:checkbox[name=checkBasket]:checked");
    	//셀러 스토어 넘버
    	var sellerStoreNo = $(".delivery");
    	//상품가격
    	var realPrice = $(".realPrice");
    	
    	for(var i = 0; i < allCheckBox; i++){
    		if($("input:checkbox[name=checkBasket]")[i].checked){
    			//선택된 상품들
    			if(realPrice[i].value >= 30000){
    				//개별가격이 3만원보다 높을 경우
    				$('.deliveryPrice:eq('+ i +')').text("무료배송");
					continue;
				}
    			else{
    				//개별가격이 3만원보다 낮은경우
    				//선택된 상품들 중에서 같은 스토어의 상품들 가격 합산해서 배송비 입력
    				var totalPrice = 0;
					for(var j = 0 ; j < allCheckBox; j++){
						//같은스토어 가격합침
						if(i==j){
							continue;
						}
						else{	
							if(sellerStoreNo[i].value == sellerStoreNo[j].value){
								if($("input:checkbox[name=checkBasket]")[j].checked){
									totalPrice = totalPrice + parseInt(realPrice[i].value) 
															+ parseInt(realPrice[j].value);
									if(totalPrice >= 30000){
										$('.deliveryPrice:eq('+ i +')').text("무료배송");
										$('.deliveryPrice:eq('+ j +')').text("무료배송");
										totalPrice = 0;
										break;
									}
								}
								else{
									$('.deliveryPrice:eq('+ i +')').text("2500원");
									$('.deliveryPrice:eq('+ j +')').text("2500원");
								}
							}
						}
					}
    			}
   			}
    		else{
    			//선택되지않은 상품들
    			if(realPrice[i].value >= 30000){
    				$('.deliveryPrice:eq('+ i +')').text("무료배송");
					continue;
				}
    			else{
    				$('.deliveryPrice:eq('+ i +')').text("2500원");
					continue;
    			}
    		}
    	}
    });
    /****************************************************/
    $('#removeBtn').on("click", function(){
    	$.ajax({
    		"url":"/HwangDangFleamarket/cart/removeCart.go",
    		"type":"POST",
    		"data":{"memberId":"${sessionScope.login_info.memberId}",
    				"checkBasket":getRemoveCartList},
    		"dataType":"json",
    		"beforeSend":function(){
    			if($("input:checkbox[name=checkBasket]:checked").length == 0){
    				alert("삭제할 상품을 선택해주세요.");
    				return false;
    			}else{
    				var answer = confirm("정말 삭제하시겠습니까?");
    				if(answer == false){
    					return false;
    				}
    			}
			},
			"success":function(){
				location.href="/HwangDangFleamarket/cart/cartList.go?"
							+"memberId=${sessionScope.login_info.memberId}";
			},
			"error":error
    	}); 
    });
    
    
    /*********************************************************/
    $("#buyBtn").on("click",function()
    {
    	var checkBox = $(".checkBox");
    	var orderAmount = $(".amountTxt"); //주문수량
    	for(var i = 0; i < checkBox.length; i++)
    	{
    		if(checkBox[i].checked)
    		{
    			//alert(orderAmount[i].value)
    			//alert('${requestScope.cartList[0].productList[0].productId}')
    			
    		}
    	}
    	
    	
    	/* alert("orderTotalPrice" + )
    	alert("orderAmount" + )
    	alert("productId" + )
    	alert("optionId" + )
    	alert("sellerStoreNo" + ) */
    	
    	
    	
    	/* console.log(getRemoveCartList());
    	var url = "/HwangDangFleamarket/buy/buyCarts.go?cartNoList="+getRemoveCartList();
		$("form").prop("action" , url);    	
		$("form").submit(); */
		
    });
    
    
    
    
    /*********************************************************/
    
    
    $(".minus").on("click", function()
	{
    	var checkedFlag = $(this).parent().prev().prev().children("input:checkbox[name=checkBasket]");
    	var amount = $(this).siblings(".amountTxt").val();
    	if(amount == 1){
    		alert("주문 수량은 1개 이상으로 입력하세요.");
    		return false;
    	}
    	if(checkedFlag.prop("checked"))
    	{
    		alert("체크 해제 후 수량을 조절해 주세요.");
    		return false;
    	}
    	var price = $(this).parent().next().text().split("+");
    	var priceOne = price[0]/amount; 
    	var addPriceOne = price[1]/amount;
    	amount--;
    	if(price[1] == 0)
    	{
    		$(this).parent().next().children(".realPrice").next().html(priceOne*amount + '<p style="display: none;">+0</p>');
    	}
    	else
   		{
    		$(this).parent().next().children(".realPrice").next().text((priceOne*amount) + "\n + " + (addPriceOne*amount));
   		}
    	$(this).siblings(".amountTxt").val(amount);
    	/* var sum = parseInt($("#sum").text());
    	sum = sum - (priceOne) - (addPriceOne);
    	$("#sum").text(sum); */
    	
    	//배송가격이 3만원보다 작아진 배송비 2500원 처리.
    	var realPrice = (priceOne*amount) + (addPriceOne*amount);
    	if(realPrice < 30000)
    	{
    		$(this).parent().next().next().text("2500원");
    	}
    	
    	//realPrice 에 가격 넣어두기.
    	$(this).parent().next().children(".realPrice").val(realPrice);
	});
    $(".plus").on("click", function()
	{
    	var checkedFlag = $(this).parent().prev().prev().children("input:checkbox[name=checkBasket]");
    	var amount = $(this).siblings(".amountTxt").val();
    	if(amount == $(".stock").val()){
    		alert("재고량이 부족합니다.");
    		return false;
    	}
    	if(checkedFlag.prop("checked"))
    	{
    		alert("체크 해제 후 수량을 조절해 주세요.");
    		return false;
    	}
    	var price = $(this).parent().next().text().split("+");
    	var priceOne = price[0]/amount; 
    	var addPriceOne = price[1]/amount;
    	amount++;
    	if(price[1] == 0)
    	{
    		$(this).parent().next().children(".realPrice").next().html(priceOne*amount + '<p style="display: none;">+0</p>');
    	}
    	else
   		{
    		$(this).parent().next().children(".realPrice").next().text((priceOne*amount) + "\n + " + (addPriceOne*amount));
   		}
    	$(this).siblings(".amountTxt").val(amount);
    	/* var sum = parseInt($("#sum").text());
    	sum = sum + (priceOne) + (addPriceOne);
    	$("#sum").text(sum); */
    	
    	//배송가격이 3만원보다 커진경우 무료배송 처리.
    	var realPrice = (priceOne*amount) + (addPriceOne*amount);
   		if(realPrice >= 30000)
       	{
       		$(this).parent().next().next().text("무료배송");
       	}
    	
    	//realPrice 에 가격 넣어두기.
    	$(this).parent().next().children(".realPrice").val(realPrice);
	});
});
function error(xhr, status, err)
{
	alert(status+", "+xhr.readyState+" "+err);
}
</script>
<h2 class="page-header store_look_around">황당 플리마켓 장바구니</h2>
<div class="cartListSection">
	<div class="cartTable">
		<table>
			<colgroup>
				<col style="width: 5%">
				<col style="width: 50%">
				<col style="width: 10%">
				<col style="width: 15%">
			</colgroup>
			<thead class="thead">
				<tr>
					<th scope="col">
						<label for="basketAll">
							<div class="checker" id="markBasketAll">
								<span class="checked"> 
									<input type="checkbox" id="basketAll" checked="checked" title="장바구니 상품 전체선택">
								</span>
							</div>
						</label>
					</th>
					<th scope="col"><span>상품정보</span></th>
					<th scope="col"><span>수량</span></th>
					<th scope="col" class="col2"><span>가격</span></th>
					<th scope="col"><span>배송정보</span></th>
				</tr>
			</thead>
			<form action="" method="POST" id="cart_form">
				<tbody>
					<c:forEach items="${requestScope.cartList}" var="list">
						<c:forEach items="${list.productList}" var="product">
							<tr class="cartList">
								<td class="first">
									<input type="checkbox" name="checkBasket" class="checkBox" checked="checked" title="장바구니 상품 선택" value="${list.cartNo}">
								</td>
								<td>
									<%-- 스토어 이름, 상품명, 선택한 옵션 --%>
									<ul>
										<li id="listBlock">
											<div class="thmb">
												<div class="storeImg">
													<a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${product.productId}&sellerStoreNo=${product.seller.sellerStoreNo}&sellerStoreImage=${product.seller.sellerStoreImage}">
													<img src="../image_storage/${product.productMainImage}"></a>
												</div>
											</div>
											<ul class="storeInfo">
												<li><a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${product.seller.sellerStoreNo}&sellerStoreImage=${product.seller.sellerStoreImage}">${product.seller.sellerStoreName}</a>
												</li><br>
												<li>
													${product.productName}/${product.productOption.optionSubName}
												</li>
											</ul>
										</li>
									</ul>
								</td>
								<td>
									<%-- 수량 --%>
									<%-- ${list.cartProductAmount} --%>
									<img src="../image_storage/minus.png" style="width:15px; height:15px; cursor: pointer;" class="minus" id="minus">
										<input size="3" readonly="readonly" type="text" class="amountTxt" value="${list.cartProductAmount}">
										<input type="text" value="${product.productOption.optionStock}" class="stock" style="display: none;">
									<img src="../image_storage/plus.png" style="width:15px; height:15px; cursor: pointer; float: right;" class="plus" id="plus">
								</td>
								<td id="price">
									<input class="delivery" type="text" value="${product.sellerStoreNo}" style="display: none;">
									<input class="realPrice" type="text" value="${product.productPrice*list.cartProductAmount}" style="display: none;">
									<span>${product.productPrice*list.cartProductAmount}
										<c:choose>
											<c:when test="${product.productOption.optionAddPrice != 0}">
												+${list.cartProductAmount*product.productOption.optionAddPrice}
											</c:when>
											<c:otherwise>
												<p style="display: none;">+0</p>
											</c:otherwise>
										</c:choose>
									</span>
								</td>
								<td id="delivery" class="deliveryPrice">
									<c:choose>
										<c:when test="${((product.productPrice*list.cartProductAmount)+(list.cartProductAmount*product.productOption.optionAddPrice))>= 30000}">
											무료배송
										</c:when>
										<c:otherwise>
											2500원
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</form>
		</table>
			<p>
		<div class="estimatedPrice" style="border: 2px solid lightgray;">
			결제 예상 금액 - 배송비&nbsp;&nbsp;
			<hr style="border: 1px solid lightgray;">
			<span id="checkedEstimatedPrice"><b id="sum">${requestScope.sum}</b><b>원</b>&nbsp;&nbsp;</span> 
		</div>
		<br>
		<span class="bottomBtn"> 
			<input class="noticeBtns" type="button" value="선택상품삭제" id="removeBtn">&nbsp;&nbsp; 
			<input class="noticeBtns" type="button" value="구매하기" id="buyBtn">
		</span>
	</div>
</div>

