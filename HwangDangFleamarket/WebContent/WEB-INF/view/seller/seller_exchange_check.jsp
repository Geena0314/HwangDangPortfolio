<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<h1 align="center">교환 신청</h1>
		<div align="center">
			<form method="POST" action="/HwangDangFleamarket/seller/exchangeHandle.go?orderSeqNo=${requestScope.exchange.orderSeqNo}">
				<table id="table">
					<tr>
						<th>주문번호</th>
						<td colspan="2">${ requestScope.orders.ordersNo }</td>
					</tr>
					<lee:if test="${not empty requestScope.orders.ordersRequest }">
						<tr>
							<th>요청사항</th>
							<td colspan="2">${ requestScope.orders.ordersRequest }</td>
						</tr>
					</lee:if>
					<tr>
						<th>받는사람</th>
						<td colspan="2">${ requestScope.orders.ordersReceiver }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2">${ requestScope.orders.ordersPhone }</td>
					</tr>
					<tr >
						<th rowspan="2">주소</th>
						<td width="100px" colspan="2">${ requestScope.orders.ordersZipcode } ${ requestScope.orders.ordersAddress }</td>
					</tr>
					<tr>
						<td colspan="2">${ requestScope.orders.ordersSubAddress }</td>
					</tr>
					<tr>
						<th>결제방식</th>
						<td colspan="2">${ requestScope.orders.ordersPayment }</td>
					</tr>
					<tr>
						<th>멤버 id</th>
						<td colspan="2">${ requestScope.orders.memberId }</td>
					</tr>
					<tr><td colspan="2" align="center"><h3>교환 신청 내역</h3></td></tr>
					<tr>
						<th>신청 제목</th>
						<td colspan="2">${ requestScope.exchange.exchangeTitle }</td>
					</tr>
					<tr>
						<th>신청 내용</th>
						<td colspan="2">
							<textarea rows="15" cols="35" readonly="readonly">
								${ requestScope.exchange.exchangeContent }
							</textarea>
						</td>
					</tr>
					<tr>
						<th>구매 옵션</th>
						<td colspan="2">
							&nbsp;&nbsp;옵션 : ${ requestScope.originalOption.productOption.optionSubName }<br>
							&nbsp;&nbsp;수량 : ${ requestScope.originalOption.orderAmount }개<br>
							<lee:if test="${ not empty requestScope.originalOption.productOption.optionAddPrice }">
								&nbsp;&nbsp;추가가격 : ${ requestScope.originalOption.productOption.optionAddPrice }원
							</lee:if>
						</td>
					</tr>
					<tr>
						<th>교환 옵션</th>
						<td colspan="2">
							&nbsp;&nbsp;옵션 : ${ requestScope.exchangeOption.optionSubName }<br>
							&nbsp;&nbsp;수량 : ${ requestScope.exchange.exchangeStock }개<br>
							<lee:if test="${ not empty requestScope.exchangeOption.optionAddPrice }">
								&nbsp;&nbsp;추가가격 : ${ requestScope.exchangeOption.optionAddPrice }원
							</lee:if>
						</td>
					</tr>
					<lee:choose>
						<lee:when test="${ not empty requestScope.exchange.exchangeCharge }">
							<tr>
								<th>추가 금액(차액)</th>
								<td colspan="2">
									<input type="text" readonly="readonly" name="exchangeCharge" value="${ requestScope.exchange.exchangeCharge }">
								</td>
							</tr>
						</lee:when>
					</lee:choose>
					<tr>
						<td colspan="3" align="right">
							<input type="submit" value="승인하기">
							<input type="button" value="거절하기" onClick="if(confirm('정말 거절하시겠습니까?')){window.open('/HwangDangFleamarket/seller/exchangeReject.go?orderSeqNo=${requestScope.exchange.orderSeqNo}', '교환거부', 'width=600 height=600 left=450 top=100');};">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>