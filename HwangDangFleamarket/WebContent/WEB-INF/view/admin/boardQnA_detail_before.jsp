<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/HwangDangFleamarket/js/admin/boardQnA_detail_before.js"></script>
<h2 class="page-header store_look_around">황당플리마켓 Q&A</h2>
<div class="center-block">
	<input type="hidden" value="${requestScope.password}" id="originalPassword" />
	<h2 class="page-header store_look_around">QnA게시판 비밀번호 입력</h2>
	<form method="POST" action="" id="form1" class="form-inline">
		<label for="password"">게시판 비밀번호 입력(4자리)  : </label>
		<input  class="form-control" type="password" name="password" id="password"  placeholder="4자리숫자입력!" />
		<c:if test="${requestScope.errorMsg != null }">
			<p class="text-center">message : ${requestScope.errorMsg }</p>
		</c:if>
		<input type="button" value="go"  id="submintBtn" class="btn btn-default" />
	</form>
</div>