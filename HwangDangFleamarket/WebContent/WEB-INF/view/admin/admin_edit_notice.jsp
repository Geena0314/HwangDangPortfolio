<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<style type="text/css">
#title {
	border: none;
	background-color: whitesmoke;
}
textarea {
	border: none;
	background-color: whitesmoke;
}
span{
	font-size: 11pt;
	color: red;
}
#adminTable{
	width: 500px;
	min-height: 300px;
	font-size: 13pt;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	border-collapse: separate;
}
.noticeRnE{
	width: 800px;
	min-height: 500px;
	margin-bottom: 30px;
}
</style>
<h2 class="page-header store_look_around">황당 플리마켓 소식통</h2>
<div class="table-responsive notice">
	<form action="/HwangDangFleamarket/admin/adminEditNotice.go" method="post">
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
		<table class="table" id="adminTable">
			<thead>
				<tr>
					<td>
						<b><input id="title" type="text" name="noticeTitle" size="71" value="${requestScope.notice.noticeTitle}"></b>
					</td>
				</tr>
				<c:if test="${not empty requestScope.errors}">
					<tr>
						<td class="error">
							<form:errors path="notice.noticeTitle" delimiter=" & "/>
						</td>
					</tr>
				</c:if>
			</thead>
			<tbody>
				<tr>
					<td>
						<textarea rows="20" cols="70" name="noticeContent">${requestScope.notice.noticeContent}</textarea>
					</td>
				</tr>
				<c:if test="${not empty requestScope.errors}">
					<tr>
						<td class="error">
							<form:errors path="notice.noticeContent"/>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	<p align="left">
	<input class="noticeBtns" type="submit" value="수정">
	<input class="noticeBtns" type="reset" value="다시작성">
	<input class="noticeBtns" type="button" value="취소" onclick="window.location='/HwangDangFleamarket/admin/adminNotice.go?page=${param.page}'">
	</p>
	</form>
</div>
