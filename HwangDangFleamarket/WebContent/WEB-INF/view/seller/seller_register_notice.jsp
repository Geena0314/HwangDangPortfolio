<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/seller/seller_register_notice.css">
<h2 class="page-header store_look_around">스토어 소식통</h2>
<div class="table-responsive notice">
	<form action="/HwangDangFleamarket/sellerNotice/sellerRegisterNotice.go" method="post">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="sellerStoreNo" value="${param.sellerStoreNo}">
			<table class="table" id="adminTable">
				<thead>
					<tr>
						<td>
							<b><input id="title" type="text" name="sellerNoticeTitle" size="71" placeholder="제목을 입력하세요."></b>
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
						<td >
							<textarea rows="20" cols="70" name="sellerNoticeContent"></textarea>
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
		<input class="noticeBtns" type="submit" value="등록">
		<input class="noticeBtns" type="reset" value="다시작성">
		<input class="noticeBtns" type="button" value="취소" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=1&sellerStoreNo=${param.sellerStoreNo}'">
		</p>
	</form>
</div>
