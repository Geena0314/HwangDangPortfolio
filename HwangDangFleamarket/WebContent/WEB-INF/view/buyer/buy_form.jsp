<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="lee"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#ordersZipcode").on("click", function()
		{
			window.open('/HwangDangFleamarket/member/findBuyAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');
		});
		$("#ordersAddress").on("click", function()
		{
			window.open('/HwangDangFleamarket/member/findBuyAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');
		});
		
		//마일리지 사용
		$("#memberMileage").on("blur", function()
		{
			if(parseInt($("#memberMileage").val()) > '${sessionScope.login_info.memberMileage}')
			{
				alert("보유하신 마일리지를 초과했습니다.");
				$("#ordersTotalPrices").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }원');
				$("#ordersTotalPrice").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }');
				$("#memberMileage").val("");
			}
			else if($("#memberMileage").val() < 1000)
			{
				alert("마일리지는 1000원부터 사용 가능합니다.");
				$("#ordersTotalPrices").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }원');
				$("#ordersTotalPrice").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }');
				$("#memberMileage").val("");
			}
			else if(parseInt('${ requestScope.totalPrice + requestScope.deliveryPrice }') < parseInt($("#memberMileage").val()))
			{
				alert("마일리지 사용 금액은 총 결제 금액을 넘을 수 없습니다.");
				$("#ordersTotalPrices").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }원');
				$("#ordersTotalPrice").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }');
				$("#memberMileage").val("");
			}
			else
			{
				//마일리지 사용가능액수 입력시
				$("#ordersTotalPrices").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }'
												-$("#memberMileage").val() + "원");
				$("#ordersTotalPrice").val('${ requestScope.totalPrice +  requestScope.deliveryPrice }'
						-$("#memberMileage").val());
			}
		});
		
		//결제방법 선택
		$(":radio").on("change", function()
		{
			//#card #noBankBook, #accountTransfer
			var idx = $(this).index();
			if(idx == 0)
			{
				//카드결제
				$("#card").show();
				$("#noBankBook").hide();
				$("#accountTransfer").hide();
				
				//무통장입금 셀렉트박스 초기화
				$("#bank option:eq(0)").removeAttr('selected');
				$("#bank option:eq(0)").attr('selected', 'true');
				
				//실시간 계좌이체 셀렉트박스 초기화
				$("#accountBank option:eq(0)").removeAttr('selected');
				$("#accountBank option:eq(0)").attr('selected', 'true');
				return false;
			}
			else if(idx == 1)
			{
				//무통장입금
				$("#card").hide();
				$("#noBankBook").show();
				$("#accountTransfer").hide();
				
				//카드사 셀렉트박스 초기화
				$("#cardCompany option:eq(0)").removeAttr('selected');
				$("#cardCompany option:eq(0)").attr('selected', 'true');
				$("#month option:eq(0)").removeAttr('selected');
				$("#month option:eq(0)").attr('selected', 'true');
				
				//실시간 계좌이체 셀렉트박스 초기화
				$("#accountBank option:eq(0)").removeAttr('selected');
				$("#accountBank option:eq(0)").attr('selected', 'true');
				return false;
			}
			else
			{
				//실시간계좌이체
				$("#card").hide();
				$("#noBankBook").hide();
				$("#accountTransfer").show();
				
				//카드사 셀렉트박스 초기화
				$("#cardCompany option:eq(0)").removeAttr('selected');
				$("#cardCompany option:eq(0)").attr('selected', 'true');
				$("#month option:eq(0)").removeAttr('selected');
				$("#month option:eq(0)").attr('selected', 'true');
				
				//무통장입금 셀렉트박스 초기화
				$("#bank option:eq(0)").removeAttr('selected');
				$("#bank option:eq(0)").attr('selected', 'true');
				return false;
			}
		});
		
		//카드결제 카드사 변경에 따른 할부기간 초기화
		$("#cardCompany").on("change", function()
		{
			$("#month option:eq(0)").removeAttr('selected');
			$("#month option:eq(0)").attr('selected', 'true');
		});
		
		$("#submit").on("click", function()
		{
			if($("#ordersReceiver").val().trim().length < 2 || $("#ordersReceiver").val().trim().length > 6)
			{
				//받는 사람 체크
				alert("이름은 2자이상 6자 이하로 입력해 주세요.");
				$("#ordersReceiver").val("").focus();
				return false;
			}	
			if($("#hp2").val().trim().length < 3 || $("#hp2").val().trim().length > 4 || $("#hp3").val().trim().length != 4)
			{
				//전화번호 체크
				alert("전화번호를 올바르게 입력해 주세요.")
				$("#hp2").val("").focus();
				$("#hp3").val("");
				return false;
			}
			
			//주소 체크
			if(!$("#ordersZipcode").val())
			{
				alert("주소를 검색해 주세요.");
				return false;
			}
			if($("#ordersSubAddress").val().trim().length < 4 || $("#ordersSubAddress").val().trim().length > 30)
			{
				alert("세부 주소는 4자 이상 30자 이하로 입력해 주세요.");
				$("#ordersSubAddress").val("").focus();
				return false;
			}
			
			if(!$("input:checkbox[id='agreement']").is(":checked"))
			{
				alert("개인정보 제3자 제공에 동의 해야 합니다.");
				$("#agreement").focus();
				return false;
			}
		});
	});
	
	function nameCheck(obj)
	{
		 //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
        || event.keyCode == 46 ) return;
        obj.value = obj.value.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]/gi, '');
	}
	
	//정규식(숫자만 입력)
	function sellerAccountCheck(obj)
	{
		 //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
        || event.keyCode == 46 ) return;
        if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
	        return true;
	    } else {
	        event.returnValue = false;
	    }
	}
</script>
<style type="text/css">
	#memberId, #noBankBook, #accountTransfer, .orderProducts
	{
		display: none;
	}
	
	#buyForm
	{
		margin-bottom: 50px;
	}
	
	.buy-form-div
	{
		margin-left: 20%;
		margin-bottom: 30px;
	}
	
	fieldset, .personal-infomation-block
	{
		width: 70%;
	}
	
	legend
	{
		border-bottom: 0px;
		font-size: 25px;
	}
	
	table
	{
		border-top: 3px solid #cecece;
		width: 100%;
	}
	
	table th
	{
		text-align: center;
	}
	
	.table>tbody>tr>td
	{
		padding-left: 25px;
	}
	
	.table>tbody>tr>td.address-td
	{
		padding-left: 15px;
		padding-right: 0px;
	}
	
	.table>tbody>tr>td input, .table>tbody>tr>td select, select
	{
	    margin: 5px;
	    border-radius: 4px;
	    font-size: 12px;
	    line-height: 1.42857143;
	    padding: 5px 8px;
	    color: #444;
	    background-color: #fff;
	}
	
	.btn-success
	{
		background-color: white;
		color: black;
	}
	
	.payment
	{
		width: 70%;
	    margin-bottom: 20px;
	    padding: 10px;
	    border: 2px solid #c5c7cd;
		background-color: #f4f6fa;
	}
	
	.personal-infomation-block textarea
	{
		width: 100%;
	}
</style>
<form action="/HwangDangFleamarket/buy/buyProducts.go" method="POST" name="buyForm" id="buyForm">
	<h2 class="page-header store_look_around" align="left">주문/결제</h2>
	<div class="buy-form-div">
		<fieldset>
			<legend>구매자 정보</legend>
				<table class="table">
					<tr>
						<th class="active col-sm-3">이름</th>
						<td colspan="2">
							${ sessionScope.login_info.memberName }
						</td>
					</tr>
					<tr>
						<th class="active">ID</th>
						<td colspan="2">
							${ sessionScope.login_info.memberId }
							<input type="text" name="memberId" id="memberId" value="${ sessionScope.login_info.memberId }">
						</td>
					</tr>
					<tr>
						<th class="active">전화번호</th>
						<td colspan="2">
							${ sessionScope.login_info.memberPhone }
						</td>
					</tr>
				</table>
		</fieldset>
	</div>
	
	<div class="buy-form-div">
		<fieldset>
			<legend>받는사람 정보</legend>
			<table class="table">
				<tr>
					<th class="active col-sm-3">받는 사람</th>
					<td colspan="2">
						<input type="text" name="ordersReceiver" id="ordersReceiver" 
								value="${ sessionScope.login_info.memberName }"
							 	onkeydown="nameCheck(this);">
					</td>
				</tr>
				<tr>
					<th class="active">전화번호</th>
					<td colspan="2">
						<select id="hp1" name="hp1">
			    	        <option>010</option>
			    	        <option>011</option>
			    	        <option>016</option>
			    	        <option>017</option>
			            	<option>018</option>
							<option>019</option>
						</select>
						-
						<input type="text" name="hp2" size="10" id="hp2" value="${ requestScope.hp1 }">
						-
						<input type="text" name="hp3" size="10" id="hp3" value="${ requestScope.hp2 }">
					</td>
				</tr>
				<tr>
					<th class="active" rowspan="3">배송지 주소</th>
				</tr>
				<tr>
					<td align="center" class="address-td">
						<input type="text" name="ordersZipcode" id="ordersZipcode" size="10" readonly="readonly" value="${ sessionScope.login_info.memberZipcode }">
					</td>
					<td class="address-td">
						<input type="text" name="ordersAddress" id="ordersAddress" size="30" readonly="readonly" value="${ sessionScope.login_info.memberAddress }">
						<input class="btn-default" id="button" type="button" value="우편번호검색" onclick="window.open('/HwangDangFleamarket/member/findBuyAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="ordersSubAddress" id="ordersSubAddress" size="43" value="${ sessionScope.login_info.memberSubAddress }"></td>
				</tr>
				<tr>
					<th class="active">배송시 요청사항</th>
					<td colspan="2">
						<select id="hp1" name="ordersRequest">
			    	        <option value="없음">배송시 요청사항을 선택해 주세요.</option>
			    	        <option>배송 전 연락 바랍니다.</option>
			    	        <option>집 앞에 놔주세요.</option>
			    	        <option>부재시 집 앞에 놔주세요.</option>
			            	<option>경비실에 맡겨주세요.</option>
							<option>부재시 경비실에 맡겨주세요.</option>
							<option>택배함에 놔주세요.</option>
						</select>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	
	<div class="buy-form-div">
		<fieldset>
			<legend>상품/결제 정보</legend>
			<table class="table">
				<lee:choose>
					<lee:when test="${ not empty requestScope.cartList }">
						<!-- 상품 1~N개구매 -->
						<lee:forEach items="${ requestScope.cartList }" var="list">
							<tr>
								<th class="active col-sm-3">스토어명</th>
								<td colspan="2">
									<input type="text" value="${ list.productList[0].seller.sellerStoreNo }"
											name="sellerStoreNo" class="orderProducts">
									<input type="text" value="${ list.cartNo }"
											name="cartNo" class="orderProducts">
									${ list.productList[0].seller.sellerStoreName }
								</td>
							</tr>
							<tr>
								<th class="active">상품명</th>
								<td colspan="2">
									<input type="text" value="${ list.productList[0].productId }"
											name="productId" class="orderProducts">
									${ list.productList[0].productName }
								</td>
							</tr>
							<tr>
								<th class="active">옵션정보</th>
								<td colspan="2">
									<input type="text" value="${ list.productList[0].productOption.optionId }"
											name="optionId" class="orderProducts">
									${ list.productList[0].productOption.optionName } - ${ list.productList[0].productOption.optionSubName }
								</td>
							</tr>
							<tr>
								<th class="active">선택수량</th>
								<td colspan="2">
									<input type="text" value="${ list.cartProductAmount }"
											name="orderAmount" class="orderProducts">
									${ list.cartProductAmount }개
								</td>
							</tr>
						</lee:forEach>
						<tr>
							<th class="active">총 상품 가격</th>
							<td colspan="2">
								${ requestScope.totalPrice }원
							</td>
						</tr>
						<tr>
							<th class="active">총 배송비</th>
							<td colspan="2">
								${ requestScope.deliveryPrice }원
							</td>
						</tr>
						<tr>
							<th class="active">총 결제 금액</th>
							<td colspan="2">
								<input type="text" name="ordersTotalPrice" id="ordersTotalPrice" class="orderProducts"
									value="${ requestScope.totalPrice +  requestScope.deliveryPrice }">
								<input type="text" name="ordersTotalPrices" id="ordersTotalPrices"
									value="${ requestScope.totalPrice +  requestScope.deliveryPrice }원">
							</td>
						</tr>
					</lee:when>
					<lee:otherwise>
						<!-- 상품1개구매 -->
						<tr>
							<th class="active col-sm-3">스토어명</th>
							<td colspan="2">
								<input type="text" value="${ requestScope.detail.seller.sellerStoreNo }"
										name="sellerStoreNo" class="orderProducts">
								<input type="text" value="99999"
										name="cartNo" class="orderProducts">
								${ requestScope.detail.seller.sellerStoreName }
							</td>
						</tr>
						<tr>
							<th class="active">상품명</th>
							<td colspan="2">
								<input type="text" value="${ requestScope.detail.product.productId }"
										name="productId" class="orderProducts">
								${ requestScope.detail.product.productName }
							</td>
						</tr>
						<tr>
							<th class="active">옵션정보</th>
							<td colspan="2">
								<input type="text" value="${  requestScope.detail.productOption.optionId }"
										name="optionId" class="orderProducts">
								${ requestScope.detail.productOption.optionName } - ${ requestScope.detail.productOption.optionSubName }
							</td>
						</tr>
						<tr>
							<th class="active">선택수량</th>
							<td colspan="2">
								<input type="text" value="${ requestScope.orderProduct.orderAmount }"
										name="orderAmount" class="orderProducts">
								${ requestScope.orderProduct.orderAmount }개
							</td>
						</tr>
						<tr>
							<th class="active">총 상품 가격</th>
							<td colspan="2">
								${ requestScope.totalPrice }원
							</td>
						</tr>
						<tr>
							<th class="active">배송비</th>
							<td colspan="2">
								${ requestScope.deliveryPrice }원
							</td>
						</tr>
						<tr>
							<th class="active">총 결제 금액</th>
							<td colspan="2">
								<input type="text" name="ordersTotalPrice" id="ordersTotalPrice" class="orderProducts"
									value="${ requestScope.totalPrice +  requestScope.deliveryPrice }">
								<input type="text" name="ordersTotalPrices" id="ordersTotalPrices"
									value="${ requestScope.totalPrice +  requestScope.deliveryPrice }원">
							</td>
						</tr>
					</lee:otherwise>
				</lee:choose>
				<tr>
					<th class="active">마일리지 사용</th>
					<td colspan="2">
						<input type="text" id="memberMileage" name="memberMileage" onkeydown="sellerAccountCheck(this);"> ※사용 가능 최대 마일리지 : ${ sessionScope.login_info.memberMileage }마일리지
					</td>
				</tr>
				<tr>
					<th class="active">결제 방법</th>
					<td colspan="2">
						신용/체크카드<input type="radio" name="ordersPayment" value="card" checked="checked">
						실시간 계좌이체<input type="radio" name="ordersPayment" value="noBankBook">
						무통장 입금<input type="radio" name="ordersPayment" value="accountTransfer">
					</td>
				</tr>
			</table>
		</fieldset>
		<div id="card" class="payment">
			<ul>
				<li>
					카드 종류 : 
					<select id="cardCompany">
						<option>신한카드</option>
						<option>BC(비씨)카드</option>
						<option>KB국민카드</option>
						<option>현대카드</option>
						<option>삼성카드</option>
						<option>외한카드</option>
						<option>롯데카드</option>
						<option>NH농협(채움)카드</option>
						<option>하나SK카드</option>
						<option>SK카드</option>
						<option>씨티카드</option>
						<option>우리카드</option>
						<option>제주은행카드</option>
						<option>전북은행카드</option>
						<option>광주은행카드</option>
						<option>수협카드</option>
						<option>우체국카드</option>
						<option>KDH산업은행카드</option>
						<option>MG새마을금고카드</option>
						<option>저축은행카드</option>
					</select>
				</li>
				<lee:choose>
					<lee:when test="${ requestScope.totalPrice >= 30000 }">
						<li>
							할부 기간 : 
							<select id="month">
								<option>일시불</option>
								<option>2개월</option>
								<option>3개월</option>
								<option>6개월</option>
							</select>
						</li>
					</lee:when>
					<lee:otherwise>
						<li>
							할부 기간 : 
							<select disabled="disabled" id="month">
								<option>일시불</option>
							</select>
							※3만원 이상 할부 가능합니다.
						</li>
					</lee:otherwise>
				</lee:choose>
			</ul>
		</div>
		<div id="noBankBook" class="payment">
			<ul>
				<li>
					은행 선택 : 
					<select id="bank">
						<option>농협</option>
						<option>국민은행</option>
						<option>하나은행</option>
						<option>우리은행</option>
						<option>신한은행</option>
						<option>씨티은행</option>
						<option>외환은행</option>
						<option>기업은행</option>
						<option>우체국</option>
						<option>부산은행</option>
						<option>SC은행</option>
					</select>
					<br>※현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.
					<ul>
						<li>무통장입금 시 유의사항</li>
						<li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
						<li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
						<li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="accountTransfer" class="payment">
			<ul>
				<li>
					은행 선택 : 
					<select id="accountBank">
						<option>농협</option>
						<option>국민은행</option>
						<option>하나은행</option>
						<option>우리은행</option>
						<option>신한은행</option>
						<option>씨티은행</option>
						<option>외환은행</option>
						<option>기업은행</option>
						<option>우체국</option>
						<option>부산은행</option>
						<option>SC은행</option>
					</select>
					<br>※현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.
				</li>
			</ul>
		</div>
		<div class="personal-infomation-block">
			<textarea rows="5" cols="100%" readonly="readonly">개인정보 제 3자 제공 동의
		
1. 회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다. “회사”는 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 
회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.
		
※ 동의 거부권 등에 대한 고지 
개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 서비스 이용이 제한될 수 있습니다.
		</textarea><br>
		<input type="checkbox" id="agreement">본인은 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.(필수)<br><br>
		개별 판매자가 등록한 스토어(오픈마켓) 상품에 대한 광고, 상품주문, 배송 및 환불의 의무와 책임은 <br>
		각 판매자가 부담하고, 이에 대하여 황당플리마켓은 통신판매중개자로서 통신판매의 당사자가 아니므로 
		일체 책임을 지지 않습니다.<br><br>
			<div align="center" class="submit-button-block">
				<input class="btn btn-lg btn-success" type="submit" value="바로 결제하기" id="submit">
			</div>
		</div>
	</div>
</form>