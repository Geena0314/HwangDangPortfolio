<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#title {
	border: none;
	background-color: whitesmoke;
}
textarea {
	border: none;
	background-color: whitesmoke;
}
span{
	font-size: 11pt;
	color: red;
}
#adminTable{
	width: 500px;
	min-height: 300px;
	font-size: 13pt;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-collapse: separate;
}
.noticeRnE{
	width: 800px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//비공개시 패스워드 객체생성 
		$("#private").click(function(){
			var pass = document.getElementById("password");
			$(pass).show();
			if(pass == null){
				$("#privateLabel").append("   <input type='password' name='password' id='password' /> ");		
			}
		});
		
		$("#publiced").click(function(){
			var pass = document.getElementById("password");
			if(pass != null){
				$(pass).hide();
			}
		});
		
		
		$("#publiced").click(function(){
			var pass = document.getElementById("password");
			if(pass != null){
				$(pass).hide();
			}
		});
		
	});//ready
</script>
<%-- 수정폼이동! no :${param.no}page :${param.page}--%>

<h2 class="page-header store_look_around">황당 플리마켓 QnA게시판</h2>
<form action="/HwangDangFleamarket/admin/boardQnASet.go?no=${param.no}&page=${param.page}" method="POST" id="setForm">
	<div class="table-responsive">
		<table class="table" id="adminTable">
			<thead>
				<tr>
					<td> 
						<b><input id="title" type="text" name="title" size="71" value="${requestScope.adminQnA.adminQnaTitle}"></b>
					</td>
				</tr>
				<c:if test="${not empty requestScope.errors}">
					<tr>
						<td class="error">
							<form:errors path="notice.noticeTitle" delimiter=" & "/>
						</td>
					</tr>
				</c:if>
				<tr>
					<td>
						<c:choose>
							<c:when test="${requestScope.adminQnA.adminQnaPublished eq 't' }">
								<label>공개 <input type="radio" name="privated" checked="checked"  id="publiced" value="publiced" ></label>
						<label id="privateLabel">비공개 <input type="radio" name="privated"  id="private"  value="not" ></label>
							</c:when>
							<c:otherwise>
								<label>공개 <input type="radio" name="privated"   id="publiced" value="publiced" ></label>
								<label id="privateLabel">비공개 <input type="radio" name="privated" checked="checked" id="private"  value="not" ></label>
								<input type='password' name='password' id='password' />
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<textarea class="form-control"  rows="15"  name="content">${requestScope.adminQnA.adminQnaContent}</textarea>
					</td>
				</tr>
				<c:if test="${not empty requestScope.errors}">
					<tr>
						<td class="error">
							<form:errors path="notice.noticeContent"/>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<input type="submit" value="수정" class="btn btn-default" role="button"  >
	<input type="button" value="목록보기"class="btn btn-default" role="button" onclick="window.location='/HwangDangFleamarket/admin/boardQnAList.go?page=${param.page}'">

</form>

<p class="text-center"></p>

