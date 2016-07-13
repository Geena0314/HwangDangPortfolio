<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function()
			{
				if(!$("#storeQnAWriter").val())
				{
					alert("로그인이 필요합니다.");
					opener.parent.location.reload();
					window.close();
				}
				$("#submit").on("click", function()
				{
					$("#titleError").empty();
					$("#contentError").empty();
					if($("#storeQnATitle").val() == null || $("#storeQnATitle").val().trim().length < 3 || $("#storeQnATitle").val().trim().length>10)
					{
						if($("#storeQnAContent").val() == null || $("#storeQnAContent").val().trim().length < 10)
						{
							$("#titleError").append("3글자 이상, 10글자 이하로 간단하게 입력해 주세요.");
							$("#contentError").append("10글자 이상으로 자세하게 입력해 주세요.");
							alert("등록에 실패했습니다.")
							return false;
						}
						else
						{
							$("#titleError").append("3글자 이상, 10글자 이하로 간단하게 입력해 주세요.");
							return false;
						}
					}
					else
					{
						if($("#storeQnAContent").val() == null || $("#storeQnAContent").val().trim().length < 10)
						{
							$("#contentError").append("10글자 이상으로 자세하게 입력해 주세요.");
							alert("등록에 실패했습니다.")
							return false;
						}
						else
						{
							alert("등록에 성공했습니다.");
							return true;
						}
					}
				});
			});
		</script>

	</head>
	<body>
		<form method="POST" action="/HwangDangFleamarket/storeQnA/storeQnARegister.go?productId=${param.productId}">
			<h2 align="center">상품 문의 하기</h2>
			<div align="center" style="border: 3px solid lightgray; width: 500px; left: 40px; position: relative;">
				<table>
					<tr>
						<td>제목</td><td><input type="text" name="storeQnATitle" id="storeQnATitle" size="43" placeholder="3글자 이상, 10글자 이하로 간단하게 적어주세요."></td>
					</tr>
					<tr><td id="titleError" colspan="2" align="center"></td></tr>
					<tr>
						<td>내용</td><td><textarea rows="20" cols="45" id="storeQnAContent" name="storeQnAContent" placeholder="10글자 이상 입력해 주세요."></textarea>
					</tr>
					<tr><td id="contentError" align="center" colspan="2"></td></tr>
					<tr>
						<td>작성자</td><td><input type="text" size="15" name="storeQnAWriter" id="storeQnAWriter" value="${param.memberId}" readonly></td>
					</tr>
					<tr>
						<td>공개여부</td>
						<td align="right">
							공개<input type="radio" name="storeQnAPublished" value="1" checked="checked">
							비공개<input type="radio" name="storeQnAPublished" value="0">
						</td>
					</tr>
					<tr><td colspan='2' align="right"><input type="submit" value="문의하기" id="submit"></td></tr>
				</table>
			</div>
		</form>
	</body>
</html>