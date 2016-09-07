<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function()
	{
		$("#password").focus();
	});
</script>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/member/passwordConfirm.css">
<h2 class="page-header store_look_around">황당 플리마켓 MyPage</h2>
<div id="pwdConfirm">
	<form action="/HwangDangFleamarket/member/mypage.go"  method="POST">
		<h2>비밀번호 확인</h2>
		<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인합니다.</p>
		<input type="password" name="memberPassword" id="password"/>
		<input type="submit" value="확인" />
		<c:if test="${not empty requestScope.errorMsg}">
			<font color="red" size="3">${requestScope.errorMsg}</font>
		</c:if>
		<br/><br/>
		<p>저희마켓은 회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이는 
		기재하신 회원정보를 공개 및 변경하지 않습니다.</p>
	</form>
</div>
