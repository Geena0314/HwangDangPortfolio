<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
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
	
</script>
<style type="text/css">
section{
	width:700px;
	border:1px solid gray;
	min-height: 300px;
	max-height: 500px;
}
#title{
font-weight: bold;
border-bottom: 1px solid gray;
padding: 10px;
}
#info{
	font-size: 13px;
	border-bottom: 1px dotted gray;
	padding-top: 15px;
	padding-right: 5px;
	padding-bottom: 10px;
	text-align: right;
}
#content{
	min-height:150px; /*최소 높이 300px*/
	height:auto;/*자동으로 늘어나기*/
	padding: 10px;
}
</style>
<h2 class="page-header store_look_around">황당플리마켓 Q&A</h2>
<div class="table-responsive adminNotice">
	<form method="POST" action="#" id="myform">
		<%-- <input type="hidden" id="contentPage" name="contentPage" value="${requestScope.page }" />
		<input type="hidden" id= "contentNo" name ="contentNo" value="${param.no }" /> --%>
	<section>
		<header>
			<div id="title">${requestScope.findQnA.adminQnaTitle }</div>
			<div id="info"><span id="writeDate">
			<fmt:formatDate value="${requestScope.findQnA.adminQnaDate }" pattern="yyyy-MM-dd"/></span> 
			| 조회수 : ${requestScope.findQnA.adminQnaHit } 
			| ${requestScope.findQnA.adminQnaWriter } 
			| <c:choose>  
				<c:when test="${requestScope.findQnA.adminQnaPublished eq 't' }">공개</c:when>
				<c:otherwise>비공개</c:otherwise>
			 </c:choose> 
			</div>
		</header>
		
		
		<textarea id="insertContent" rows="30" cols="75" hidden="true" ></textarea>
		 	<article id="content">
		 	 <p class="text-center">${requestScope.findQnA.adminQuaContent }</p>
		 	 </article>
		<br/>
	
		<!-- 작성자만 수정 삭제가능!  -->
		<c:if test="${sessionScope.login_info.memberId == requestScope.findQnA.adminQnaWriter   }">
			<p class="text-center">       
				<a id="setFormMoveBtn" href="/HwangDangFleamarket/admin/boardQnASetMove.go?no=${requestScope.findQnA.adminQnaNo}&page=${param.page}" class="btn btn-default" role="button" >수정하기</a>
				<a id="removeBtn" href="/HwangDangFleamarket/admin/boardQnARemove.go?no=${requestScope.findQnA.adminQnaNo}&page=${param.page}" class="btn btn-default"role="button">삭제하기</a>
				<a class="btn btn-default"role="button" href="/HwangDangFleamarket/admin/boardQnAList.go?page=${param.page }">목록</a>
			</p>
		</c:if>
		<hr>
	
		<c:choose>
			<c:when test="${requestScope.findQnA.adminQnaReplyExist == 't' }">
					<p class="text-center">
				 <input type="hidden" name="replyNo" value="${requestScope.findQnA.reply.adminReplyNo }">
				<fmt:formatDate value="${requestScope.findQnA.reply.adminReplyDate }" pattern="yyyy-MM-dd"/>
				<mark>관리자</mark><br/>
					<p id="response" class="text-center">
						<strong>${requestScope.findQnA.reply.adminReplyContent }</strong>
					</p>
				</p>
			</c:when>
			<c:otherwise>
				<p id="response" class="text-center">관리자가 답변전 입니다.</p>
			</c:otherwise>
		</c:choose>
		
		<br/><br/><br/><br/>
				  
				  
		<p class="text-center">  
		<!-- 관리자일경우만 댓글달기 가능 버튼및 TA 보이기 -->
		<%--<c:if test="${sessionScope.login_info.memberId == 'admin@admin.com' }"> 	 --%>
 		 <c:if test="${sessionScope.login_info.memberId == 'kinghwang@gmail.com' }">	
 				<textarea class="form-control" rows="3" name="replyTa" id="replyTa"></textarea><br/>
			
				<!-- 댓글달려있는지 유무 -->
			<c:choose>			
				<c:when test="${requestScope.findQnA.adminQnaReplyExist  eq 't'}">
					<input type="button" class="btn btn-default" value="답변수정" id="setReplyBtn"  />
					<input type="button" class="btn btn-default" value="답변삭제" id="removeReplyBtn"  />
					<a class="btn btn-default"role="button" href="/HwangDangFleamarket/admin/boardQnAList.go?page=${param.page }">목록</a>
				</c:when>
				<c:otherwise>
					<input type="button" class="btn btn-default" value="답변등록" id="addReplyBtn" />
					<a class="btn btn-default"role="button" href="/HwangDangFleamarket/admin/boardQnAList.go?page=${param.page }">목록</a>
				</c:otherwise>
			</c:choose>			
		</c:if>  
		
		<!-- 비로그인상태에 글목록 버튼보이기 -->
		<c:if test="${sessionScope.login_info == null }">
			<a class="btn btn-default"role="button" href="/HwangDangFleamarket/admin/boardQnAList.go?page=${param.page }">목록</a>
		</c:if>
		
	 </p>
	</section>
	</form>  
	</div>
	<p>  


	