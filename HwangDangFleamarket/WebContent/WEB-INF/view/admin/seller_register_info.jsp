<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>황당마켓</title>
	<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/template.css">
    <!-- Bootstrap core CSS -->
    <link href="/HwangDangFleamarket/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/HwangDangFleamarket/styles/dashboard.css" rel="stylesheet">
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
    <script src="/HwangDangFleamarket/js/bootstrap.min.js"></script>
    <script src="/HwangDangFleamarket/js/vendor/holder.js"></script>
	<title>판매자 신청 정보</title>
	<style type="text/css">
		.seller-register-info
		{
			margin-top: 0px;
		}
		.seller-info-TB
		{
			width: 530px;
		}
	</style>

	<body>
		<h2 class="form-signin-heading seller-register-info" align="center">판매자 등록 신청</h2>
		<div align="center" class="table-responsive seller-info-TB">
			<form method="POST" action="/HwangDangFleamarket/admin/sellerRegisterRecognize.go?sellerStoreNo=${ requestScope.seller.sellerStoreNo }&memberId=${ requestScope.seller.member.memberId }">
				<table id="table" class="table table-striped">
					<tr class="trInput">
						<th class='tdName' width="150px">아이디</th>
						<td colspan="2">${ requestScope.seller.member.memberId }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>이름</th>
						<td colspan="2">${ requestScope.seller.member.memberName }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>전화번호</th>
						<td colspan="2">${ requestScope.seller.member.memberPhone }</td>
					</tr>
					<tr class="trInput">
						<th rowspan="2" class='tdName'>주소</th>
						<td width="100px" colspan="2">${ requestScope.seller.member.memberZipcode } ${ requestScope.seller.member.memberAddress }</td>
					</tr>
					<tr>
						<td colspan="2">${ requestScope.seller.member.memberSubAddress }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>상호명</th>
						<td colspan="2">${ requestScope.seller.sellerStoreName }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>사업자 번호</th>
						<td colspan="2">${ requestScope.seller.sellerTaxId }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>업종</th>
						<td>${ requestScope.seller.sellerIndustry }</td>
						<td>${ requestScope.seller.sellerSubIndustry }</td>
					</tr>
					<tr class="trInput">
						<th rowspan="2" class='tdName'>매장 주소</th>
						<td colspan="2">${ requestScope.seller.sellerZipcode } ${ requestScope.seller.sellerAddress }</td>
					</tr>
					<tr>
						<td colspan="2">${ requestScope.seller.sellerSubAddress }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>계좌 정보</th>
						<td>${ requestScope.seller.sellerBank }</td>
						<td>${ requestScope.seller.sellerAccount }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>판매 물품</th>
						<td colspan="2">${ requestScope.seller.sellerProduct1 }&nbsp;&nbsp;${ requestScope.seller.sellerProduct2 }&nbsp;&nbsp;${ requestScope.seller.sellerProduct3 }</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>스토어 소개글</th>
						<td colspan="2">${ requestScope.seller.sellerIntroduction }</td>
					</tr>
					<tr class="trInput">
						<td colspan="3" align="right">
							<input type="submit" value="승인하기">  
							<input type="button" value="거절하기" onClick="window.open('/HwangDangFleamarket/admin/sellerRegisterReject.go?sellerStoreNo=${requestScope.seller.sellerStoreNo}', '거부', 'width=600 height=600 left=450 top=100');">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>