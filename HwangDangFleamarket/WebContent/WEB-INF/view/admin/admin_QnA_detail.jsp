<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/admin/admin_QnA_detail.css">
<script type="text/javascript">
	$(document).ready(function(){
		$('#registerReply').on("click", function(){
			if($('#adminReplyContent').val()){
				location.href="/HwangDangFleamarket/adminQnA/registerAdminQnAReply.go?adminReplyContent="
							  +$('#adminReplyContent').val()+"&adminQnaNo=${requestScope.adminQnA.adminQnaNo}"
							  +"&page=${page}";
				return true;
			}
			$('#reply').html("<textarea name='adminReplyContent' rows='4' cols='70' id='adminReplyContent'></textarea>");
			$('#adminReplyContent').focus();
		});
		
		$('#deleteQnABtn').on("click", function(){
			if(confirm("글을 삭제하시겠습니까?")){
				location.href='/HwangDangFleamarket/adminQnA/adminQnADelete.go?page=${page}&adminQnaNo=${requestScope.adminQnA.adminQnaNo}';
			}else{
				return false;
			}
		});
		
		$('#editReply').on("click", function(){
			$('.afterReply').show();
			$('.beforeReply').hide();
			$('#replyBox').removeProp("readonly").focus();
		});
		
		$('#cancelBtn').on("click", function(){
			$('.afterReply').hide();
			$('.beforeReply').show();
			$('#replyBox').prop("readonly", "readonly");
		});
		
		$('#completeBtn').on("click", function(){
			var adminReplyContent = $('#replyBox').val();
			location.href="/HwangDangFleamarket/adminQnA/editAdminQnAReply.go?page=${page}"
			+"&adminReplyNo=${requestScope.adminQnA.reply.adminReplyNo}"
			+"&adminReplyContent="+adminReplyContent
			+"&adminQnaNo=${requestScope.adminQnA.adminQnaNo}"
		});
		
		$('#deleteReply').on("click", function(){
			if(confirm("답글을 삭제하시겠습니까?")){
				location.href="/HwangDangFleamarket/adminQnA/deleteAdminQnAReply.go?page=${page}"
						+"&adminQnaNo=${requestScope.adminQnA.adminQnaNo}"
						+"&adminReplyNo=${requestScope.adminQnA.reply.adminReplyNo}";
			}else{
				return false;
			}
		});
	});
</script>
<h2 class="page-header store_look_around">황당플리마켓 Q&A</h2>
<div class="table-responsive notice">
	<table class="table" id="adminTable">
		<thead>
			<tr style="background-color: whitesmoke;">
				<td width="550px" style="word-break: break-word;"><b> ${requestScope.adminQnA.adminQnaTitle}</b></td>
				<td width="150px" style="font-size: 10pt; vertical-align: middle;">등록일 │ <fmt:formatDate value="${requestScope.adminQnA.adminQnaDate}" pattern="yyyy-MM-dd"/></td>
				<td width="100px" style="font-size: 10pt; vertical-align: middle;">조회수 │ ${requestScope.adminQnA.adminQnaHit}</td>
			</tr>
		</thead>
		<tbody>
			<tr id="tbodyTR">
				<td colspan="3">
					${requestScope.adminQnA.adminQnaContent}
				</td>
			</tr>
			<tr>
				<td colspan="3" style="border-bottom: 1px solid lightgray;">
					<c:choose>
						<c:when test="${empty requestScope.adminQnA.reply}">
							<span id="reply">등록된 답글이 없습니다.</span>
							<c:if test="${sessionScope.login_info.memberId == 'kinghwang@gmail.com'}">
								<input type="button" value="답글등록" id="registerReply">
							</c:if>
						</c:when>
						<c:otherwise>
							<textarea id="replyBox" class="reply-box" rows='4' cols='70' name="adminReplyContent" readonly="readonly">${requestScope.adminQnA.reply.adminReplyContent}</textarea><br>
							<input type="button" value="답글수정" id="editReply" class="noticeBtns beforeReply">
							<input type="button" value="답글삭제" id="deleteReply" class="noticeBtns beforeReply">
							<input type='button' value='수정완료' id='completeBtn' class="noticeBtns afterReply">
							<input type='button' value='수정취소' id='cancelBtn' class="noticeBtns afterReply">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" style="border-top: none;">
					<input class="noticeBtns" type="button" value="목록으로" onclick="window.location='/HwangDangFleamarket/adminQnA/adminQnAList.go?page=${page}'">
					<c:if test="${sessionScope.login_info.memberId == 'kinghwang@gmail.com'}">
						<input id="deleteQnABtn" class="noticeBtns" type="button" value="문의삭제">	
					</c:if>
					<c:if test="${sessionScope.login_info.memberId == requestScope.adminQnA.adminQnaWriter}">
						<input class="noticeBtns" type="button" value="문의수정" onclick="window.location='/HwangDangFleamarket/adminQnA/adminQnAEditForm.go?page=${page}&adminQnaNo=${requestScope.adminQnA.adminQnaNo}'">
						<input id="deleteQnABtn" class="noticeBtns" type="button" value="문의삭제">
					</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
</div>