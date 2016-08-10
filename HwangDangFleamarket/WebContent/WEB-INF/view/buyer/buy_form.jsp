<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="lee"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
	$(document).ready(function()
	{
		
	});
</script>
<style>
	#memberId, #noBankBook, #accountTransfer
	{
		display: none;
	}
	#buyForm
	{
		margin-bottom: 50px;
	}
</style>
<form action="/HwangDangFleamarket/buy/buyOne.go" method="POST" name="buyForm" id="buyForm">
	<h2 class="page-header store_look_around" align="left">주문/결제</h2>
	<div>
		<fieldset>
			<legend>구매자 정보</legend>
				<table>
					<tr>
						<th>이름</th>
						<td colspan="2">
							${ sessionScope.login_info.memberName }
						</td>
					</tr>
					<tr>
						<th>ID</th>
						<td colspan="2">
							${ sessionScope.login_info.memberId }
							<input type="text" name="memberId" id="memberId" value="${ sessionScope.login_info.memberId }">
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2">
							${ sessionScope.login_info.memberPhone }
						</td>
					</tr>
				</table>
		</fieldset>
	</div>
	
	<div>
		<fieldset>
			<legend>받는사람 정보</legend>
			<table>
				<tr>
					<th>받는 사람</th>
					<td colspan="2">
						<input type="text" name="ordersReceiver" value="${ sessionScope.login_info.memberName }">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
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
					<th rowspan="3">배송지 주소</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="ordersZipcode" id="ordersZipcode" size="8" readonly="readonly" value="${ sessionScope.login_info.memberZipcode }">
					</td>
					<td>
						<input type="text" name="ordersAddress" id="ordersAddress" size="13" readonly="readonly" value="${ sessionScope.login_info.memberAddress }">
						<input id="button" type="button" value="우편번호검색" onclick="window.open('/HwangDangFleamarket/member/findBuyAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="ordersSubAddress" id="ordersSubAddress" size="43" value="${ sessionScope.login_info.memberSubAddress }"></td>
				</tr>
				<tr>
					<th>배송시 요청사항</th>
					<td colspan="2">
						<select id="hp1" name="ordersRequest">
			    	        <option>배송시 요청사항을 선택해 주세요.</option>
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
	
	<div>
		<fieldset>
			<legend>상품/결제 정보</legend>
			<table>
				<tr>
					<th>스토어명</th>
					<td colspan="2">
						${ requestScope.detail.seller.sellerStoreName }
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="2">
						${ requestScope.detail.product.productName }
					</td>
				</tr>
				<tr>
					<th>옵션정보</th>
					<td colspan="2">
						${ requestScope.detail.productOption.optionName } - ${ requestScope.detail.productOption.optionSubName }
					</td>
				</tr>
				<tr>
					<th>선택수량</th>
					<td colspan="2">
						${ requestScope.orderProduct.orderAmount }개
					</td>
				</tr>
				<tr>
					<th>총 상품 가격</th>
					<td colspan="2">
						${ requestScope.totalPrice }원
					</td>
				</tr>
				<lee:choose>
					<lee:when test="${ requestScope.totalPrice >= 30000 }">
						<tr>
							<th>배송비</th>
							<td colspan="2">
								0원
							</td>
						</tr>
						<tr>
							<th>총 결제 금액</th>
							<td colspan="2">
								${ requestScope.totalPrice }원
							</td>
						</tr>
					</lee:when>
					<lee:otherwise>
						<tr>
							<th>배송비</th>
							<td colspan="2">
								2500원
							</td>
						</tr>
						<tr>
							<th>총 결제 금액</th>
							<td colspan="2">
								${ requestScope.totalPrice + 2500 }원
							</td>
						</tr>
					</lee:otherwise>
				</lee:choose>
				<tr>
					<th>마일리지 사용</th>
					<td colspan="2">
						<input type="text" id="memberMileage"> ※사용 가능 최대 마일리지 : ${ sessionScope.login_info.memberMileage }마일리지
					</td>
				</tr>
				<tr>
					<th>결제 방법</th>
					<td colspan="2">
						신용/체크카드<input type="radio" name="ordersPayment" value="1" checked="checked">
						실시간 계좌이체<input type="radio" name="ordersPayment" value="2">
						무통장 입금<input type="radio" name="ordersPayment" value="3">
					</td>
				</tr>
			</table>
		</fieldset>
		<div id="card" class="payment">
			<ul>
				<li>
					카드 종류 : 
					<select>
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
							<select>
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
							<select disabled="disabled">
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
					<select>
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
					<select>
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
		<textarea rows="5" cols="100%" readonly="readonly">개인정보 제 3자 제공 동의
		
1. 회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다. “회사”는 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 
회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.
		
※ 동의 거부권 등에 대한 고지 
개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 서비스 이용이 제한될 수 있습니다.
		</textarea><br>
		<input type="checkbox">본인은 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.<br><br>
		개별 판매자가 등록한 스토어(오픈마켓) 상품에 대한 광고, 상품주문, 배송 및 환불의 의무와 책임은 <br>
		각 판매자가 부담하고, 이에 대하여 황당플리마켓은 통신판매중개자로서 통신판매의 당사자가 아니므로 
		일체 책임을 지지 않습니다.<br><br>
		
		<input type="submit" value="바로 결제하기">
	</div>
</form>