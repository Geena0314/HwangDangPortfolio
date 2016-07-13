<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<h1 align="center">환불 신청</h1>
		<div align="center">
			<form method="POST" action="/HwangDangFleamarket/seller/refundHandle.go?orderSeqNo=${param.orderSeqNo}">
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
					<tr><td colspan="2" align="center"><h3>환불 신청 내역</h3></td></tr>
					<tr>
						<th>신청 제목</th>
						<td colspan="2">${ requestScope.refund.refundTitle }</td>
					</tr>
					<tr>
						<th>신청 내용</th>
						<td colspan="2">
							<textarea rows="15" cols="35" readonly="readonly">
								${ requestScope.refund.refundContent }
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right">
							<input type="submit" value="승인하기">  
							<input type="button" value="창 닫기" onClick="window.close();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>