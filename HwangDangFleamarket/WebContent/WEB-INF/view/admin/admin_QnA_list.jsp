<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/admin/admin_notice_list.css">
<script type="text/javascript">
	$(document).ready(function(){
		$(".title").on("click", function(){
			alert($(this).text());
			return false;
		});
	});
</script>
<h2 class="page-header store_look_around">황당 플리마켓 Q&A</h2>
<div class="table-responsive notice">
	<table class="table table-striped" id="adminTable" style="max-width: 950px;">
		<colgroup>
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 30%">
			<col style="width: 20%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 10%">
		</colgroup>
		<thead>
			<tr>
				<td colspan="7">
					<c:if test="${sessionScope.login_info.memberId != null}">
						<input class="addBtns" type="button" value="문의하기" onclick="window.location='/HwangDangFleamarket/adminQnA/registerAdminQnAForm.go'">
					</c:if>
				</td>
			</tr>
			<tr class="trInput">
				<td class="tdName" width="50px">번호</td>
				<td class="tdName" width="80px">답변여부</td>
				<td class="tdName"  width="150px">글제목</td>
				<td class="tdName" width="70px">작성자</td>
				<td class="tdName" width="90px">작성일</td>
				<td class="tdName" width="60px">조회수</td>
				<td class="tdName" width="77px">공개여부</td>
			</tr>
		</thead>
		<tbody>		
			<c:forEach var="list" items="${requestScope.list}" >
				<tr class="trInput">
					<td>${list.adminQnaNo }</td>
					<td class="tdName">
						<c:choose>
							<c:when test="${list.adminQnaReplyExist eq 't' }"><font color="blue">완료</font> </c:when>
							<c:otherwise><font color="red">미완료</font></c:otherwise>
						</c:choose>
					</td>  
					<td><a class="title" href="/HwangDangFleamarket/adminQnA/beforeAdminQnADetail.go?page=${requestScope.pasingBean.page}&no=${list.adminQnaNo}">${list.adminQnaTitle}</a></td>
					<td>${list.adminQnaWriter }</td>
					<td><fmt:formatDate value="${list.adminQnaDate }" pattern="yyyy-MM-dd"/></td>
					<td>${list.adminQnaHit }</td>
					 <c:choose>
						<c:when test="${list.adminQnaPublished == '1'}">
							<td>공개</td>
						</c:when>
						<c:otherwise>
							<td>비공개</td>
						</c:otherwise>   
					</c:choose>
				</tr>
				</c:forEach>
		</tbody>
	</table>

	<%-- 페이징 처리 --%>
	<div class="pageGroup adminNoticePaging" align="center">
		<%-- ◀이전 페이지 그룹 처리 --%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.previousPageGroup}">
				<a href="/HwangDangFleamarket/admin/boardQnAList.go?page=${requestScope.pagingBean.beginPage-1}">
					◀ 
				</a>
			</c:when>
			<c:otherwise>◀</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<%--페이지 처리 --%>
		<c:forEach begin="${requestScope.pagingBean.beginPage}"
			end="${requestScope.pagingBean.endPage}" var="page">
			<c:choose>
				<c:when test="${page == requestScope.pagingBean.page}">
		  				<b>${page}</b>
		 			</c:when>
				<c:otherwise>
					<a href="/HwangDangFleamarket/admin/boardQnAList.go?page=${page}">
						${page} 
					</a>
				</c:otherwise>
			</c:choose>
		&nbsp;&nbsp;
		</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/admin/boardQnAList.go?page=${requestScope.pagingBean.endPage+1}">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
</div>	