<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/admin/admin_register_notice.css">
<script type="text/javascript">
	$(document).ready(function(){
		
		//비공개시 패스워드 객체생성 
		$("#private").on("click", function(){
			var pwd = document.getElementById("password");
			$(pwd).show();
			if(pwd == null){
				$("#privateLabel").append("<input type='password' maxlength='4' name='adminQnaPassword' id='password'/>");
			} 
		});
		
		//공개라디오버튼 누를시 패스워드 박스 숨김 
		$("#public").on("click", function(){
			var pwd = document.getElementById("password");
			if(pwd != null){
				$(pwd).hide();
			}
		});
		
		$("#submitBtn").on("click", function(){
			if($(':radio:checked').val() == '0' && !$('#password').val()){
				alert("비공개 글 등록시 비밀번호를 입력해주세요.");
				return false;
			}
		});
	});
</script>
<h2 class="page-header store_look_around">황당플리마켓 Q&A</h2>
<!-- 
<form method="POST" action="" id="f1" >  
	<input type="hidden" name="adminQnaWriter" value="${sessionScope.login_info.memberId}"/>
	<input type="text" class="form-control" name="adminQnaTitle" id="title" placeholder="제목을 입력하세요."/>
	<label>
		공개 <input type="radio" checked="checked" name="adminQnaPublished" value="t" id="public"/>
	</label>
	<label id="privateLabel">
		비공개 <input type="radio" name="adminQnaPublished" value="f" id="private"/>
	</label>
	<textarea rows="10" class="form-control" name="adminQnaContent" id="content" placeholder="글내용을 입력하세요."></textarea><br/>
	<input type="button" value="문의하기" id="submitBtn">
</form>
-->

<div class="table-responsive notice">
	<form action="/HwangDangFleamarket/adminQnA/registerAdminQnA.go" method="post" id="form">
		<input type="hidden" name="adminQnaWriter" value="${sessionScope.login_info.memberId}">
		<input type="hidden" name='page' value="1">
			<table class="table" id="adminTable">
				<thead>
					<tr>
						<td>
							<b><input id="title" type="text" name="adminQnaTitle" size="71" placeholder="제목을 입력하세요."></b>
						</td>
					</tr>
					<c:if test="${not empty requestScope.errors}">
						<tr>
							<td class="error">
								<form:errors path="adminQnA.adminQnaTitle"/>
							</td>
						</tr>
					</c:if>
				</thead>
				<tbody>
					<tr>
						<td>
							<textarea rows="20" cols="70" name="adminQnaContent"></textarea>
						</td>
					</tr>
					<c:if test="${not empty requestScope.errors}">
						<tr>
							<td class="error">
								<form:errors path="adminQnA.adminQnaContent"/>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<label>
				공개 <input type="radio" checked="checked" name="adminQnaPublished" value="1" id="public">
			</label>
			<!-- 패스워드 값이 입력되었는지 확인해줘야함 -->
			<label id="privateLabel">
				비공개 <input type="radio" name="adminQnaPublished" value="0" id="private">
			</label>
		<p align="left">
		<input class="noticeBtns" id="submitBtn" type="submit" value="등록">
		<input class="noticeBtns" type="reset" value="다시작성">
		<input class="noticeBtns" type="button" value="취소" onclick="window.location='/HwangDangFleamarket/adminQnA/adminQnAList.go?page=1'">
		</p>
	</form>
</div>