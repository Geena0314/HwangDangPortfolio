<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#submintBtn").on("click" ,function(){
			
			var inputPass = $("#password").val().trim();
			var originPass = $("#originalPassword").val().trim();
			console.log("인풋패스워드 : " +inputPass +",originPass : " + originPass );
			
			
			//검증 
			if(inputPass.length == 0 || inputPass.length <= 3 || inputPass.length > 5  ){
				alert("패스워드는 4자리 숫자입니다.");
				return false;
			}
			if(inputPass != originPass){
				//게시판 설정한 비밀번호 틀림 
				alert("비밀번호가 틀립니다. 다시 입력해주세요");
				return false;
			}else{
				//비밀번호맞음 세부페이지로 이동 
				$("form").prop("action" , 
				"/HwangDangFleamarket/admin/boardQnADetail.go?no=${param.no}&page=${param.page}");
				$("#form1").submit();
			}
			
		});
	});
	
</script>
<%-- 패스워드 : ${requestScope.password}   파람 : ${param.password} --%>
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