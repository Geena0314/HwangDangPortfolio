<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee"  uri="http://java.sun.com/jsp/jstl/core"%>
<h2 class="page-header store_look_around">스토어 상품 목록</h2>
<div class="row placeholders product-content">
	<lee:forEach items="${ requestScope.productList }" var="list" varStatus="no">
		<div id="product${ no.count }" class="col-sm-4 products">
			<div class="product-lists-img">
				<div>
					<a href="/HwangDangFleamarket/product/detail.go?page=${ param.page }&productId=${ list.productId }&sellerStoreNo=${ list.sellerStoreNo }&sellerStoreImage=${ list.seller.sellerStoreImage }">
						<img class="mainImage" src="../image_storage/${ list.productMainImage }"  style="width:200px;height:170px;">
					</a>
				</div>
				<div><br>${ list.productName }<br>&#8361;${ list.productPrice }</div>
			</div>
		</div>
	</lee:forEach>
</div>
<div id="page" class="pageGroup product-lists-page">
	<!-- 
		이전 페이지 그룹 처리.
		만약, 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리. 
	-->
		<lee:choose>
			<lee:when test="${ requestScope.bean.previousPageGroup }">
				<a href = "/HwangDangFleamarket/product/list.go?page=${ requestScope.bean.beginPage-1 }&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }">◀</a>
			</lee:when>
			<lee:otherwise>
				◀
			</lee:otherwise>
		</lee:choose>
		
		<!-- 
			현재 페이지가 속한 페이지 그룹내의 페이지들 링크.
			현재 페이지그룹의 시작페이지~ 끝페이지
		 -->
		 <!-- 만약 page가 현재페이지라면 링크 처리를 하지않고, 현재 페이지가 아니라면 링크처리. -->
		<lee:forEach begin="${ requestScope.bean.beginPage }" end="${ requestScope.bean.endPage }" var="page">
			<lee:choose>
				<lee:when test="${ page != requestScope.bean.page }">
					<a href = "/HwangDangFleamarket/product/list.go?page=${ page }&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }"><b>${ page }</b></a>
				</lee:when>
				<lee:otherwise>
					${ page }
				</lee:otherwise>
			</lee:choose>
		</lee:forEach>
		
		<!-- 
			다음 페이지 그룹 처리.
			만약, 다음페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리. 
		-->
		<lee:choose>
			<lee:when test="${ requestScope.bean.nextPageGroup }">
				<a href = "/HwangDangFleamarket/product/list.go?page=${ requestScope.bean.endPage+1 }&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }">▶</a>
			</lee:when>
			<lee:otherwise>
				▶
			</lee:otherwise>
		</lee:choose>
</div>
<div class="registerProductBtn">
	<lee:if test="${sessionScope.seller.sellerStoreNo == param.sellerStoreNo}">
		<span class="registerProductBtn">
			<input class="registerProductInput" type="button" value="상품 등록" onclick="window.location='/HwangDangFleamarket/product/registerProductForm.go?page=${param.page}&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }'">&nbsp;&nbsp;
		</span>
	</lee:if>
</div>