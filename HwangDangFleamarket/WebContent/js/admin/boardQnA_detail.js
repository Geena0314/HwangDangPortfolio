$(document).ready(function(){
	
	//정말삭제할것인지 확인 
	$("#removeBtn").on("click",function(){
		var yesNo = confirm("정말 삭제하시겠습니까?");
		if(yesNo == false){
			return false;
		}
	});
	
	//수정폼변경할수있도록 이동
	$("#setFormMoveBtn").on("click",function(){ 
		var content = $("#content").text();
		$("#content").hide();
		$("#insertContent").text(content).show();
		$("#setFormMoveBtn").prop("hidden","true");
		$("#setContentBtn").show();
		$("#setFormMoveBtn").hide();
		
	}); 
	
	
	//요일변환을 위한 로직 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	 
	
	
	//수정Ajax처리 
	$("#setContentBtn").on("click" , function(){ 
		
		var sendContent = $("#insertContent").val().trim();
		var contentNo = $("#contentNo").val();
		var contentPage = $("#contentPage").val();
		
		console.log("결과:" + sendContent + ", " + contentNo + ", " + contentPage);
		
		$.ajax({
			
			"beforeSend" : function(){
			
				if(sendContent.length == 0) {
					alert("글자를 반드시입력해주세요.");
					return false;
				}
			} ,
			   
			"url" : "/HwangDangFleamarket/admin/boardQnASet.go" ,
			"type" : "POST" , 
			//요청파라미터
			"data" : { "no":contentNo , "page" : contentPage , "content" :sendContent } ,
			"dataType" : "json" ,   
			"success": function(obj){
				
				$("#insertContent").hide();
				$("#content").text(obj.adminQuaContent);
				$("#content").show();
				$("#writeDate").text(new Date(obj.adminQnaDate).format("yyyy년MM월dd일"));
				$("#setContentBtn").hide();
				$("#setFormMoveBtn").show();
				
				
			} ,
			"error" :function(xhr ,status, httpErrorMsg){
				alert("요청실패 : " + httpErrorMsg );
			}
							
		}); //ajax
		
		
	});
	
	$("#submit").on("click",function(){
		var adminTx =$("#replyTa").val().trim();
		
		if(adminTx.length == 0){
			alert("댓글을 입력하세요.");
			return false;
		}
		
		
	});
	
	
	// 댓글 등록 
	$("#addReplyBtn").on("click",function(){  
		
		
		//댓글등록 로직 
		$("#myform").prop("action" , "/HwangDangFleamarket/admin/addBoardQnAReply.go?contentNo=${param.no}&contentPage=${param.page}");
		$("#myform").submit();
	});
	
	//댓글 수정 
	$("#setReplyBtn").on("click",function(){
		
		var ta = $("#replyTa").val().trim();
		//답글을 작성했을경우에만 로직실행
		if(ta.length == 0 || ta == "" || ta == null ) {
			alert("수정할 글내용을 textbox에 입력하세요!");
		}else{
			$("#myform").prop("action" , "/HwangDangFleamarket/admin/setBoardQnAReply.go?contentNo=${param.no}&contentPage=${param.page}");
			$("#myform").submit();
		}
		
	});
	
	//댓글삭제
	$("#removeReplyBtn").on("click",function(){
		$("#myform").prop("action" , "/HwangDangFleamarket/admin/removeBoardQnAReply.go?contentNo=${param.no}&replyNo=${requestScope.findQnA.reply.adminReplyNo }&contentPage=${param.page}");
		$("#myform").submit();
		          
	});
	
	
}); //document