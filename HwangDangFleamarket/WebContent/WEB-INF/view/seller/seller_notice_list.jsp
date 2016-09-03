<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<style type="text/css">
a {
	text-decoration: none;
	color: gray;
}
a:HOVER {
	text-decoration: underline;
}
b {
	font-size: 15pt;
}
.main{
	min-height: 600px;
}
#adminTable{
	width: 700px;
	font-size: 13pt;
	table-layout: fixed;
}
.table-responsive{
	overflow-x: hidden; 
}
.tdName.title{
	overflow: hidden;
	white-space: nowrap;
	text-overflow : ellipsis;
}
</style>
<h2 class="page-header store_look_around">스토어 소식통</h2>
<div class="table-responsive notice">
	<table class="table table-striped" id="adminTable">
		<colgroup>
			<col style="width: 55%">
			<col style="width: 15%">
			<col style="width: 10%">
		</colgroup>
		<thead>
			<tr>
				<td>
					<c:if test="${sessionScope.seller.sellerStoreNo == param.sellerStoreNo}">
						<input class="noticeBtns" type="button" id="rgstBtn" value="소식글등록" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerRegisterNoticeForm.go?sellerStoreNo=${requestScope.sellerStoreNo}'">
					</c:if>
				</td>
			</tr>
			<tr class="trInput">
				<td width="375px" class="tdName">제목</td>
				<td width="200px" class="tdName">등록일</td>
				<td width="125px" class="tdName">조회수</td>
			</tr>
		</thead>
		<tbody style="border-bottom: 1px solid lightgray;">
			<c:forEach var="list" items="${requestScope.list}">
				<tr class="trInput">
					<td class="tdName title">
						<a href="/HwangDangFleamarket/sellerNotice/sellerNoticeDetail.go?page=${requestScope.pagingBean.page}&sellerNoticeNo=${list.sellerNoticeNo}&sellerStoreNo=${requestScope.sellerStoreNo}">
							${list.sellerNoticeTitle}
						</a>
					</td>
					<td class="tdName"><fmt:formatDate value="${list.sellerNoticeDate}" pattern="yyyy-MM-dd" /></td>
					<td class="tdName">${list.sellerNoticeHit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	
	<%-- 페이징 처리 --%>
	<div class="pageGroup adminNoticePaging" align="center">
		<%-- ◀이전 페이지 그룹 처리 --%>
	<c:choose>
		<c:when test="${requestScope.pagingBean.previousPageGroup}">
			<a href="/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=${requestScope.pagingBean.beginPage-1}&sellerStoreNo=${param.sellerStoreNo}">
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
				<a href="/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=${page}&sellerStoreNo=${param.sellerStoreNo}">
					${page} 
				</a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
	</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.pagingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=${requestScope.pagingBean.endPage+1}&sellerStoreNo=${param.sellerStoreNo}">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</div>
</div>