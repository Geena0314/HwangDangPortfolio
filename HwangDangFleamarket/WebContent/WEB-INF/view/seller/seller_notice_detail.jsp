<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/notice.css">
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/seller/seller_notice_detail.css">
<h2 class="page-header store_look_around">스토어 소식통</h2>
<div class="table-responsive notice">
	<table class="table" id="adminTable">
		<thead>
			<tr style="background-color: whitesmoke;">
				<td width="550px" style="word-break: break-word;"><b> ${requestScope.sellerNotice.sellerNoticeTitle}</b></td>
				<td width="150px" style="font-size: 10pt; vertical-align: middle;">등록일 │ <fmt:formatDate value="${requestScope.sellerNotice.sellerNoticeDate}" pattern="yyyy-MM-dd" /></td>
				<td width="100px" style="font-size: 10pt; vertical-align: middle;">조회수 │ ${requestScope.sellerNotice.sellerNoticeHit}</td>
			</tr>
		</thead>
		<tbody>
			<tr id="tbodyTR">
				<td colspan="3" style="border-bottom: 1px solid lightgray;">
					${requestScope.sellerNotice.sellerNoticeContent}		
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" style="border-top: none;">
					<input class="noticeBtns" type="button" value="목록으로" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=${page}&sellerStoreNo=${requestScope.sellerNotice.sellerStoreNo}'">
					<c:if test="${sessionScope.seller.sellerStoreNo == param.sellerStoreNo}">
						<input class="noticeBtns" type="button" value="공지수정" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerEditNoticeForm.go?page=${page}&sellerNoticeNo=${requestScope.sellerNotice.sellerNoticeNo}&sellerStoreNo=${requestScope.sellerNotice.sellerStoreNo}'">
						<input class="noticeBtns" type="button" value="공지삭제" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerRemoveNotice.go?page=${page}&sellerNoticeNo=${requestScope.sellerNotice.sellerNoticeNo}&sellerStoreNo=${requestScope.sellerNotice.sellerStoreNo}'">
					</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
