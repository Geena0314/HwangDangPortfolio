<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <title>황당마켓</title>
		<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/template.css">
		<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/myorder/myorder_exchange_form.css">
	    <!-- Bootstrap core CSS -->
	    <link href="/HwangDangFleamarket/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Custom styles for this template -->
	    <link href="/HwangDangFleamarket/styles/dashboard.css" rel="stylesheet">
	    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	    <script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
	    <script src="/HwangDangFleamarket/js/bootstrap.min.js"></script>
	    <script src="/HwangDangFleamarket/js/vendor/holder.js"></script>
		<title>교환 신청</title>
		<script type="text/javascript">
			function exchangePriceAll()
			{
				//기존 상품 가격
				var priceAll = '${requestScope.priceAll}';
				//상품 1개 가격
				var productPrice = '${requestScope.price.product.productPrice}';
				//상품 1개 추가가격
				var addPriceText = $("#optionAddPrice").text();
				var startIdx = addPriceText.indexOf(":")+2;
				var endIdx = addPriceText.indexOf("원");
				
				var addPrice = addPriceText.substring(startIdx, endIdx);
				if(!addPrice)
					addPrice = 0;
				//교환할 상품 총 가격
				var exchangePrice = (parseInt(productPrice) + parseInt(addPrice))*$("#optionStock").val();
				if(exchangePrice == 0)
				{
					$("#mileage").val("");
					return true;
				}
				if(priceAll != exchangePrice)
				{
					//차액발생
					if(priceAll > exchangePrice)
					{
						//기존 가격이 더 큰경우(마일리지로 차액 지급.)
						var mileage = priceAll - exchangePrice;
						if(mileage != priceAll)
						{
							//교환할 상품을 선택한 경우
							if(priceAll > mileage)
							{
								$("#mileage").val("-" +  mileage + "원");
								return true;	
							}
							else if(mileage == 0)
							{
								$("#mileage").val("");
								return true;
							}
						}
					}
					else
					{
						var mileage = exchangePrice - priceAll;
						//기존 가격이 더 작은 경우(차액을 택배에 동봉해서 받음.)
						$("#mileage").val("+" + mileage + "원");
						return true;
					}
				}
				else
				{
					//차액 미발생
					$("#mileage").val("");
				}
			}
		
		
			$(document).ready(function()
			{
				$("#minus").on("click", function()
				{
					if($("#optionStock").val() == 0)
					{
						alert("주문 수량은 1개 이상으로 입력하세요.");
						return false;
					}
					var amount = $("#optionStock").val();
					amount--;
					$("#optionStock").empty().val(amount);
					exchangePriceAll();
				});
						
				$("#plus").on("click", function()
				{
					if($("#optionError").text() == "재고량이 부족합니다.")
						return false;
					if($("#optionError").text() == "선택할 수 없는 옵션입니다." || !$("#optionError").text())
					{
						alert("옵션을 선택해 주세요.");
						return false;
					}
					if($("#optionStock").val() == $("#optionError").text())
					{
						alert("재고량이 부족합니다.");
						return false;
					}
					var amount = $("#optionStock").val()
					amount++;
					$("#optionStock").empty().val(amount);
					exchangePriceAll();
				});
						
				$("#optionName").on("change", function()
				{
					var index = this.selectedIndex;
					$.ajax
					({
						"url" : "/HwangDangFleamarket/product/optionStock.go",
						"type" : "POST",
						"data" : {"optionName" : $("#optionName").val(), "productId" : '${requestScope.orderProduct.productId}'},
						"dataType" : "JSON",
						"beforeSend" : function()
						{
							$("#mileage").val("");
							$("#optionStock").empty().val(0);
							$("#optionAddPriceTr").empty().hide();
							$("#optionError").empty().hide();
							$("#optionId").val("");
							if(index == 0)
							{
								$("#optionError").html("<td align='center' colspan='2'>선택할 수 없는 옵션입니다.</td>").show();
								return false;
							}
						},
						"success" : function(json)
						{
							$("#optionId").val(json.optionId);
							if(json.optionStock == 0)
							{
								$("#optionError").html("<td align='center' colspan='2'>재고량이 부족합니다.</td>").show();
								$("#optionName option:eq(0)").removeAttr('selected');
								$("#optionName option:eq(0)").attr('selected', 'true');
								return false;
							}
							if(json.optionAddPrice == 0)
							{
								$("#optionError").empty().append(json.optionStock).hide();
								return false;
							}
							else
							{
								$("#optionAddPriceTr").html("<td colspan='2' id='optionAddPrice' name='optionAddPrice' align='center'>" 
															+ "추가가격 : "+ json.optionAddPrice + "원</td>").show();
								$("#optionError").empty().append(json.optionStock).hide();
							}
						},		
						"error" : function()
						{
							alert("선택할 수 없는 옵션입니다.");
						}
					});
				});
				
				$("#submit").on("click", function()
				{
					var index = $("#optionName option").index($("#optionName option:selected"));
					$("#exchangeTitleError").empty();
					$("#exchangeContentError").empty();
					if($("#exchangeTitle").val().trim().length < 5 || $("#exchangeTitle").val().trim().length > 20)
					{
						$("#exchangeTitleError").append("제목은 5자 ~ 20자 사이로 입력해주세요.");
						$("#exchangeTitle").focus();
						return false;
					}
					else if($("#exchangeContent").val().trim().length < 10)
					{
						$("#exchangeContentError").append("내용은 10글자 이상으로 입력해주세요.");
						$("#exchangeContent").focus();
						return false;
					}
					else if(index == 0)
					{
						alert("옵션을 선택해주세요.");
						return false;
					}
					else if($("#optionStock").val() == 0)
					{
						alert("수량은 1개 이상으로 선택해 주세요.");
						return false;
					}
					else
					{
						var mileage = $("#mileage").val();
						if(mileage == "")
							return true;
						else
						{
							if(mileage.indexOf("-") == 0)
							{
								alert("차액은 마일리지로 적립해 드립니다.\n마일리지 적립 금액 : " + mileage.substring(1));
								return true;
							}
							else
							{
								alert("차액은 물품 교환시 상자에 동봉해서 보내주십시오.\n보내실 금액 : " + mileage.substring(1));
								return true;
							}
						}
					}
				});
			});
		</script>	
	</head>
	<body>
		<form method="POST" action="/HwangDangFleamarket/myorder/exchangeSuccess.go?orderSeqNo=${ param.orderSeqNo }">
			<div align="center" class="refund-div">
				<h2 class="page-header store_look_around" style="position: relative; left: -20px;">교 환 신 청</h2>
				<table class="table table-striped refundTB">
					<tr class="trInput">
						<th class='tdName' >신청 제목</th>
						<td colspan="2"><input type="text" name="exchangeTitle" size="28" id="exchangeTitle"></td>
					</tr>
					<tr>
						<td colspan="2" align="center" id="exchangeTitleError">
						</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>신청 내용</th>
						<td colspan="2">
							<textarea name="exchangeContent" cols="30" rows="15" id="exchangeContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" id="exchangeContentError">
						</td>
					</tr>
					<tr class="trInput">
						<th class='tdName' style="vertical-align: middle;">구매한 옵션</th>
						<td colspan="2">
							옵션 : ${ requestScope.orderProduct.productOption.optionSubName }<br>
							수량 : ${ requestScope.orderProduct.orderAmount }개<br>
							<lee:if test="${ not empty requestScope.orderProduct.productOption.optionAddPrice }">
								추가가격 : ${ requestScope.orderProduct.productOption.optionAddPrice }원<br>
							</lee:if>
							총 주문가격 : ${ requestScope.priceAll }원
						</td>
					</tr>
					<tr class="trInput">
						<th class='tdName' rowspan="2" style="vertical-align: middle;">교환요청 옵션</th>
						<td colspan="2">
							<select id="optionName">
							<option>${ requestScope.optionList[0].optionName }</option>
							<lee:forEach items="${ requestScope.optionList }" var="option">
								<option value=${ option.optionSubName }>${ option.optionSubName }</option>
							</lee:forEach>
						</select>
						수량 : 
						<img src="../image_storage/minus.png" style="width:15px; height:15px; cursor: pointer;" class="amount" id="minus">
						<input type="text" size="3" readonly="readonly" value="0" id="optionStock" name="exchangeStock">
						<img src="../image_storage/plus.png" style="width:15px; height:15px; cursor: pointer;" class="amount" id="plus">
						</td>
					</tr>
					<tr><td colspan="2" class="optionIdTd"><input type="text" id="optionId" name="optionId"></td></tr>
					<tr id="optionError"></tr>
					<tr id="optionAddPriceTr"></tr>
					<tr id="exchangePriceAll">
						<th class='tdName'>추가 금액(차액)</th>
						<td colspan="2">
							<input type="text" readonly="readonly" name="exchangeCharge" id="mileage">
						</td>
					</tr>
					<tr class="trInput">
						<td colspan="2" align="right">
							<input type="submit" value="교환신청" id="submit">
							<input type="button" value="취소하기" onclick="window.close();">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>