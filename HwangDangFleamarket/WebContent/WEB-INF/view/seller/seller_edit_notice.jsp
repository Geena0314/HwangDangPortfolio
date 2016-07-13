<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<style type="text/css">
/* table, td {
	border: 1px solid gray;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 650px;
}

span, td {
	padding: 5px;
	height: auto;
} */
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
}
</style>
<h2 class="page-header store_look_around">스토어 소식통</h2>
<div class="table-responsive notice">
	<form action="/HwangDangFleamarket/sellerNotice/sellerEditNotice.go" method="post">
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" name="sellerNoticeNo" value="${requestScope.sellerNotice.sellerNoticeNo}">
		<input type="hidden" name="sellerStoreNo" value="${requestScope.sellerNotice.sellerStoreNo}">
		<input type="hidden" name="sellerStoreImage" value="${param.sellerStoreImage}">
			<table class="table" id="adminTable">
				<thead>
					<tr>
						<td>
							<b><input id="title" type="text" name="sellerNoticeTitle" size="71" value="${requestScope.sellerNotice.sellerNoticeTitle}"></b>
						</td>
					</tr>
					<c:if test="${not empty requestScope.errors}">
						<tr>
							<td class="error">
								<form:errors path="sellerNotice.sellerNoticeTitle"/>
							</td>
						</tr>
					</c:if>
				</thead>
				<tbody>
					<tr>
						<td>
							<textarea rows="20" cols="70" name="sellerNoticeContent">${requestScope.sellerNotice.sellerNoticeContent}</textarea>
						</td>
					</tr>
					<c:if test="${not empty requestScope.errors}">
						<tr>
							<td class="error">
								<form:errors path="sellerNotice.sellerNoticeContent"/>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		<p align="left">
		<input class="noticeBtns" type="submit" value="수정">
		<input class="noticeBtns" type="reset" value="다시작성">
		<input class="noticeBtns" type="button" value="취소" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=${param.page}&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${param.sellerStoreImage}'">
		</p>
	</form>
</div>
