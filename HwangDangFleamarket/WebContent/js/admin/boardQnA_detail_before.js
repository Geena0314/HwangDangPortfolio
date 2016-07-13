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