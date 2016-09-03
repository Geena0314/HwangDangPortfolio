<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/admin/admin_register_notice.css">
<script type="text/javascript">
	$(document).ready(function(){
		
		//비공개시 패스워드 객체생성 
		$("#private").on("click", function(){
			var pwd = document.getElementById("adminQnaPassword");
			$(pwd).show();
			if(pwd == null){
				$("#privateLabel").append("<input type='password' placeholder='4글자' maxlength='4' name='adminQnaPassword' id='adminQnaPassword'/>");
			} 
		});
		
		//공개라디오버튼 누를시 패스워드 박스 숨김 
		$("#public").on("click", function(){
			var pwd = document.getElementById("adminQnaPassword");
			if(pwd != null){
				$(pwd).hide();
			}
		});
		
		$("#submitBtn").on("click", function(){
			if($(':radio:checked').val() == '0' && !$('#adminQnaPassword').val()){
				alert("비공개 글 등록시 비밀번호를 입력해주세요.");
				$('#adminQnaPassword').focus();
				return false;
			}else if($('#adminQnaPassword').val().trim().length < 4){
				alert("비밀번호는 4글자로 입력해주세요.");
				$('#adminQnaPassword').val("").focus();
				return false;
			}
		});
	});
</script>
<h2 class="page-header store_look_around">황당플리마켓 Q&A</h2>
<div class="table-responsive notice">
	<form action="/HwangDangFleamarket/adminQnA/adminQnAEdit.go" method="post">
		<input type="hidden" name='adminQnaNo' value="${requestScope.adminQnA.adminQnaNo}">
		<input type="hidden" name='page' value="${param.page}">
			<table class="table" id="adminTable">
				<thead>
					<tr>
						<td>
							<b><input id="title" type="text" name="adminQnaTitle" size="71" value="${requestScope.adminQnA.adminQnaTitle}"></b>
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
							<textarea rows="20" cols="70" name="adminQnaContent">${requestScope.adminQnA.adminQnaContent}</textarea>
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
			<label id="privateLabel">
				비공개 <input type="radio" name="adminQnaPublished" value="0" id="private">
			</label>
		<p align="left">
		<input class="noticeBtns" id="submitBtn" type="submit" value="수정">
		<input class="noticeBtns" type="reset" value="다시작성">
		<input class="noticeBtns" type="button" value="취소" onclick="window.location='/HwangDangFleamarket/adminQnA/adminQnADetail.go?page=${param.page}&adminQnaNo=${requestScope.adminQnA.adminQnaNo}'">
		</p>
	</form>
</div>