<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/seller_register_status.css">
<h2 class="page-header store_look_around">황당 플리마켓 판매자 신청 현황</h2>
<div class="seller_listing">
	<c:forEach items="${requestScope.registerList}" var="list" varStatus="no">
		<li id="list_block">
			<div class="thmb">
				<div class="store_imgs">
					<a href="#" onClick="window.open('/HwangDangFleamarket/admin/sellerRegisterInfo.go?sellerStoreNo=${list.sellerStoreNo}&page=${ requestScope.bean.page }', '판매자 등록 신청 내용', 'scrollbars=yes width=545 height=800 left=450 top=100');"><img src="../image_storage/${list.sellerStoreImage}"></a>
				</div>
			</div>
			<ul class="store_info">
				<li class="store-names">
					${list.sellerStoreName}
				</li>
				<li class="introduction">
					${list.sellerIntroduction}
				</li>
			</ul>
			<div class="store_products">
				<ul class="product_lists">
					<c:if test="${list.sellerProduct1!=null}">
						<li>${list.sellerProduct1}</li>
					</c:if>
					<c:if test="${list.sellerProduct2!=null}">
						<li>${list.sellerProduct2}</li>
					</c:if>
					<c:if test="${list.sellerProduct3!=null}">
						<li>${list.sellerProduct3}</li>
					</c:if>
				</ul>
			</div>
		</li>
	</c:forEach>

	<p align="center" class="pageGroup seller-register-page">
		<%-- ◀이전 페이지 그룹 처리 --%>
	<c:choose>
		<c:when test="${requestScope.bean.previousPageGroup}">
			<a href="/HwangDangFleamarket/admin/sellerRegisterStatus.go?page=${requestScope.bean.beginPage-1}">
				◀ 
			</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
	<%--페이지 처리 --%>
	<c:forEach begin="${requestScope.bean.beginPage}"
		end="${requestScope.bean.endPage}" var="page">
		<c:choose>
			<c:when test="${page == requestScope.bean.page}">
	  				<b>${page}</b>
	 			</c:when>
			<c:otherwise>
				<a href="/HwangDangFleamarket/admin/sellerRegisterStatus.go?page=${page}">
					${page} 
				</a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
	</c:forEach>
		<%--다음 페이지 그룹 처리 ▶--%>
		<c:choose>
			<c:when test="${requestScope.bean.nextPageGroup}">
				<a href="/HwangDangFleamarket/admin/sellerRegisterStatus.go?page=${requestScope.bean.endPage+1}">
					▶
				</a>
			</c:when>
			<c:otherwise>▶</c:otherwise>
		</c:choose>
	</p>
</div>