<%@ page contentType="text/html;charset=utf-8"%>
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
	    <!-- Bootstrap core CSS -->
	    <link href="/HwangDangFleamarket/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Custom styles for this template -->
	    <link href="/HwangDangFleamarket/styles/dashboard.css" rel="stylesheet">
	    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	    <script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
	    <script src="/HwangDangFleamarket/js/bootstrap.min.js"></script>
	    <script src="/HwangDangFleamarket/js/vendor/holder.js"></script>
		<title>환불 신청</title>
		<script type="text/javascript">
			$(document).ready(function()
			{
				$("#submit").on("click", function()
				{
					$("#refundTitleError").empty();
					$("#refundContentError").empty();
					if($("#refundTitle").val().trim().length < 5 || $("#refundTitle").val().trim().length > 20)
					{
						$("#refundTitleError").append("제목은 5자 ~ 20자 사이로 입력해주세요.");
						$("#refundTitle").focus();
						return false;
					}
					else if($("#refundContent").val().trim().length < 10)
					{
						$("#refundContentError").append("내용은 10글자 이상으로 입력해주세요.");
						$("#refundContent").focus();
						return false;
					}
					else
						return true;
				});
			});
		</script>	
		<style type="text/css">
			.page-header
			{
				margin-top: 0px;
			}
		</style>
	</head>

	<body>
		<form method="POST" action="/HwangDangFleamarket/order/refundSuccess.go?orderSeqNo=${ param.orderSeqNo }">
			<div align="center" class="refund-div">
				<h2 class="page-header store_look_around" style="position: relative; left: -20px;">환 불 신 청</h2>
				<table class="table table-striped refundTB">
					<tr class="trInput">
						<th class='tdName' >신청 제목</th>
						<td colspan="2"><input type="text" name="refundTitle" size="28" id="refundTitle"></td>
					</tr>
					<tr>
						<td colspan="2" align="center" id="refundTitleError">
						</td>
					</tr>
					<tr class="trInput">
						<th class='tdName'>신청 내용</th>
						<td colspan="2">
							<textarea name="refundContent" cols="30" rows="15" id="refundContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" id="refundContentError">
						</td>
					</tr>
					<tr class="trInput">
						<td colspan="2" align="right">
							<input type="submit" value="신청하기" id="submit">
							<input type="button" value="취소하기" onclick="window.close();">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>