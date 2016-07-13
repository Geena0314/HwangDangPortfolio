<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/admin/admin_notice_list.css">
<h2 class="page-header store_look_around">황당 플리마켓 소식통</h2>
<div class="table-responsive notice">
	<table class="table table-striped" id="adminTable">
		<thead>
			<tr>
				<td colspan="4">
					<c:if test="${sessionScope.login_info.memberId == 'kinghwang@gmail.com'}">
						<input class="noticeBtns" type="button" value="소식글등록" onclick="window.location='/HwangDangFleamarket/admin/adminRegisterForm.go'">
					</c:if>
				</td>
			</tr>
			<tr class="trInput">
				<td width="100px" class="tdName">번호</td>
				<td width="325px" class="tdName">제목</td>
				<td width="175px" class="tdName">등록일</td>
				<td width="100px" class="tdName">조회수</td>
			</tr>
		</thead>
		<tbody style="border-bottom: 1px solid lightgray;">
			<c:forEach var="list" items="${requestScope.list}">
				<tr class="trInput">
					<td class="tdName">${list.noticeNo}</td>
					<td class="tdName">
						<a href="/HwangDangFleamarket/admin/adminNoticeDetail.go?page=${requestScope.pagingBean.page}&noticeNo=${list.noticeNo}">
							${list.noticeTitle}
						</a>
					</td>
					<td class="tdName"><fmt:formatDate value="${list.noticeDate}" pattern="yyyy-MM-dd" /></td>
					<td class="tdName">${list.noticeHit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		<%-- 페이징 처리 --%>
	<div class="pageGroup adminNoticePaging" align="center">
		<%-- ◀이전 페이지 그룹 처리 --%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.previousPageGroup}">
				<a href="/HwangDangFleamarket/admin/adminNotice.go?page=${requestScope.pagingBean.beginPage-1}">
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
					<a href="/HwangDangFleamarket/admin/adminNotice.go?page=${page}">
						${page} 
					</a>
				</c:otherwise>
			</c:choose>
		&nbsp;&nbsp;
		</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/admin/adminNotice.go?page=${requestScope.pagingBean.endPage+1}">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
</div>