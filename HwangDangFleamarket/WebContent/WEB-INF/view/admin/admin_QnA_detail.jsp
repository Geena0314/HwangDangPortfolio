<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/HwangDangFleamarket/js/admin/boardQnA_detail.js"></script>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/admin/boardQnA_detail.css">

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


	