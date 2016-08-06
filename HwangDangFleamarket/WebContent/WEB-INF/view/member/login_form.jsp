<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link type="text/css" rel="stylesheet"
	href="/HwangDangFleamarket/styles/template.css">
<!-- Bootstrap core CSS -->
<link href="/HwangDangFleamarket/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/HwangDangFleamarket/styles/dashboard.css" rel="stylesheet">
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script type="text/javascript"
	src="/HwangDangFleamarket/scripts/jquery.js"></script>
<script src="/HwangDangFleamarket/js/bootstrap.min.js"></script>
<script src="/HwangDangFleamarket/js/vendor/holder.js"></script>
<title>황당마켓</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#selectEmail").on("change",function() {
		var index = this.selectedIndex;
		if (index == 0) {
			$("#domain").empty().hide();
			return false;
		} else if (index == 16) {
			$("#domain").val("").removeAttr("readonly").show();
			return false;
			} else {
				$("#domain").empty().val($("#selectEmail option:selected").val()).hide();
				return true;
			}
		});


		$("#login").on("click",function() {
			
			if ($("#id").val() == null|| ($("#id").val() + $("#email").val()).length > 29|| $("#id").val().trim().length == 0) {
				//id가 비었거나, 30글자보다 크거나, id값에 공백만 있는경우.
				if ($("#password").val() == null || $("#password").val().trim().length < 8 || $("#password").val().length > 20) {
					//패스워드가 널이거나, 8글자보다 작거나, 20글자보다 큰경우.
				$("#idError").empty().append("아이디 오류");
				$("#passwordError").empty().append("패스워드 오류");
					return false;
			} else {
				$("#idError").empty().append("아이디 오류");
				$("#passwordError").empty();
				return false;
			}
			} else {
				if ($("#password").val() == null|| $("#password").val().trim().length < 8|| $("#password").val().length > 20) {
						$("#idError").empty();
						$("#passwordError").empty().append("패스워드 오류");
						return false;
					}
			}
			//구매중 로그인페이지로 온경우 이동 
			if ($("#flag").val() == 'true') {
				// 로그인후 상품디테일페이지로 이동 
				var url = "/HwangDangFleamarket/member/loginAfterProductDetailPage.go?page=${param.page}&productId=${param.productId}&sellerStoreNo=${param.sellerStoreNo}&amount=${param.amount}&option=${param.option}";
				$("form").prop("action", url);
				$("form").submit();
			} else {
				//일반로그인페이지로이동
				$("form").prop("action","/HwangDangFleamarket/member/loginResult.go?location="+'${param.location}');
				$("form").submit(); 
			}
		}); //btn
		
		$(".findform").on("click", function()
		{
			window.opener.location="/HwangDangFleamarket/member/findMemberForm.go";
			window.close();
		});
		
	});//ready

	function idCheck(obj) {
		//좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
		if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37
				|| event.keyCode == 39 || event.keyCode == 46)
			return;
		obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
		obj.value = obj.value.replace(
				/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]/gi, '');
		obj.value = obj.value.replace(/\s/gi, '');
	}
	
</script>
<style type="text/css">
#domain {
	display: none;
}

#selectEmail {
	width: 140px;
}
.form-signin-heading
{
	margin-top: -35px;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="form-signin-heading" align="center">Please sign in</h2>
		<form class="form-signin" action="#" method="post" name="login_form">
			<table>
				<tr class="trInput">
					<td class='tdName'>I&nbsp&nbsp&nbsp&nbsp&nbspD</td>
					<td><lee:choose>
							<lee:when test="${ not empty requestScope.loginId }">
								<input type="text" name="memberId" id="id" size="10"
									autofocus="autofocus" onkeydown="idCheck(this)"
									value="${ requestScope.loginId }">
							</lee:when>
							<lee:otherwise>
								<input type="text" name="memberId" id="id" size="10"
									autofocus="autofocus" onkeydown="idCheck(this)">
							</lee:otherwise>
						</lee:choose> @<input type="text" name="domain" id="domain" size=13
						readonly="readonly"> <select id="selectEmail">
							<option>이메일을 선택</option>
							<lee:forEach items="${requestScope.emailList}" var="email">
								<lee:choose>
									<lee:when test="${ requestScope.domain == email.codeName }">
										<option selected="selected">${ email.codeName }</option>
									</lee:when>
									<lee:otherwise>
										<option>${ email.codeName }</option>
									</lee:otherwise>
								</lee:choose>
							</lee:forEach>
							<option>직접입력</option>
					</select></td>
				</tr>
				<tr class="trInput">
					<td colspan="2" id="idError" class="error-message"><lee:if
							test="${not empty requestScope.idError }">
									${ requestScope.idError }
								</lee:if></td>
				</tr>
				<tr class="trInput">
					<td class='tdName'>PASSWORD</td>
					<td colspan="1"><input type="password" name="memberPassword"
						id="password" placeholder="Password" size="20"></td>
				</tr>
				<tr class="trInput">
					<td colspan="2" id="passwordError" class="error-message"><lee:if
							test="${not empty requestScope.passwordError }">
									${ requestScope.passwordError }
								</lee:if></td>
				</tr>
				<tr class="trInput">
					<td colspan="2" align="center">
					<input class="btn btn-lg btn-success btn-block" type="submit" value="로그인"id="login" /> 
					<input class="btn btn-lg btn-primary btn-block" type="reset" value="초기화" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input class="btn btn-lg btn-warning btn-block findform" type="button" value="ID/Password찾기"/>
					</td>
				</tr>
			</table>
		</form>
		<br/>
		<font size="2" color="red" id="errorMsg">
			<p class="text-center">${requestScope.errorMsg}</p>
			<input type="hidden" value="${requestScope.flag }"  id="flag">
		</font>
	</div>
</body>
</html>