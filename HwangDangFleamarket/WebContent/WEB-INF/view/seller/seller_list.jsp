<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h2 class="page-header store_look_around">황당 플리마켓 Stores</h2>
<!-- <div class="seller_listing"> -->
<div class="row placeholders">
<div class="seller_listing">
	<ul>
		<c:forEach items="${requestScope.list}" var="list">
			<div class="col-sm-4 seller-list" id="list_block">
				<div class="list-margins">
					<div class="thmb">
						<div class="store_img">
							<a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${list.sellerStoreNo}&sellerStoreImage=${list.sellerStoreImage}"><img class="sellerListImage" src="../image_storage/${list.sellerStoreImage}"></a>
						</div>
					</div>
					<div class="store_info">
						<div align="center" class="store-names">
							<a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${list.sellerStoreNo}&sellerStoreImage=${list.sellerStoreImage}">${list.sellerStoreName}</a>
						</div>
						<div class="introduction">
							${list.sellerIntroduction}
						</div>
					</div>
					<div class="store_products">
						<div class="product_list">
							<c:if test="${list.sellerProduct1!=null}">
								#${list.sellerProduct1}<br>
							</c:if>
							<c:if test="${list.sellerProduct2!=null}">
								#${list.sellerProduct2}<br>
							</c:if>
							<c:if test="${list.sellerProduct3!=null}">
								#${list.sellerProduct3}<br>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</ul>
</div>

<div align="center" class="pageGroup">
	<%-- ◀이전 페이지 그룹 처리 --%>
<c:choose>
	<c:when test="${requestScope.pagingBean.previousPageGroup}">
		<a href="/HwangDangFleamarket/seller/sellerList.go?page=${requestScope.pagingBean.beginPage-1}">
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
			<a href="/HwangDangFleamarket/seller/sellerList.go?page=${page}">
				${page} 
			</a>
		</c:otherwise>
	</c:choose>
&nbsp;&nbsp;
</c:forEach>
	<%--다음 페이지 그룹 처리 ▶--%>
	<c:choose>
		<c:when test="${requestScope.pagingBean.nextPageGroup}">
			<a href="/HwangDangFleamarket/seller/sellerList.go?page=${requestScope.pagingBean.endPage+1}">
				▶
			</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
</div>
</div>