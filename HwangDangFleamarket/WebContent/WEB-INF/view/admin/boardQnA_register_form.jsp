<%@page contentType="text/html;charset=UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		//비공개시 패스워드 객체생성 
		$("#publishedLabel").click(function(){
			var pass = document.getElementById("password");
			$(pass).show();
			if(pass == null){
				$("#publishedLabel").append("<input type='password' name='password' id='password' /> ");		
			}
		});
		//공개라디오버튼 누를시 패스워드 박스 숨김 
		$("#public").click(function(){
			var pass = document.getElementById("password");
			if(pass != null){
				$(pass).hide();
			}
		});
		
		// 글등록 
		$("#submitBtn").click(function(){
			var title = $("#title").val().trim();
			var content = $("textarea").val().trim();         
			var radio = $("input:radio:checked").val();
			//alert(radio);
			//검증
			if(title.length == 0){
				alert("제목은 필수입력사항 입니다.");
				return false;
			}if(content.length == 0){
				alert("문의사항은 필수입력사항 입니다.");
				return false;
			}
			
			$("#f1").prop("action","/HwangDangFleamarket/admin/register.go");
			$("#f1").submit();
		});
	});
</script>
<%-- 세션아이디 : ${sessionScope.login_info.memberId } --%>
<h2 class="page-header store_look_around">황당플리마켓 Q&A</h2>
<form method="POST" action="" id="f1" >  
	<input type="hidden"  name="loginId" value="${sessionScope.login_info.memberId }" />
	<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요."/>
	<label>공개 <input type="radio"  checked="checked" name="published"  value="t" id="public"   /></label>
	<label id="publishedLabel" >비공개 <input type="radio"  name="published" value="f" id="private" /></label>
	<textarea rows="10"  class="form-control"  name="content" id="content" placeholder="글내용을 입력하세요."></textarea><br/>
	<input type="button" value="문의하기" id="submitBtn">
</form>