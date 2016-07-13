<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
	img {
		width : 160px;
		height : 160px;
	}
	
	#layer {
		min-height:  300px;
		min-width: 300px;
	}   
	
	.media{
		margin:  40px;
		padding : 30px;
	}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
	});
</script>

<div id="layer">
	<c:choose>
	<c:when test="${!empty requestScope.productList }">
		<c:forEach items="${requestScope.productList }" var="p">
			<div class="media">    
  				<div class="media-left">    
  				<a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${p.productId }&sellerStoreNo=${p.seller.sellerStoreNo }&sellerStoreImage=${p.seller.sellerStoreImage}">
					<img src="/HwangDangFleamarket/image_storage/${p.productMainImage }"/>
				</a>
				</div>  
				<div class="media-body">
   					 <h2 class="media-heading"><a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${p.productId }&sellerStoreNo=${p.seller.sellerStoreNo }&sellerStoreImage=${p.seller.sellerStoreImage}">${p.productName }  ${p.productInfo }</a></h2>
					 <a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${p.productId }&sellerStoreNo=${p.seller.sellerStoreNo }&sellerStoreImage=${p.seller.sellerStoreImage}"><fmt:formatNumber pattern="#,###원">${p.productPrice }</fmt:formatNumber> <font size="0.5em" color="lightgray">3만원이상 주문시 무료배송</font></a>
					 <a href="/HwangDangFleamarket/product/detail.go?page=1&productId=${p.productId }&sellerStoreNo=${p.seller.sellerStoreNo }&sellerStoreImage=${p.seller.sellerStoreImage}">좋아요 : ${p.productLike }</a>
					 <a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${p.seller.sellerStoreNo }&sellerImage=${p.seller.sellerStoreImage }">${p.seller.sellerStoreName }</a>
					<c:if test="${p.productStock <= 0}">
							<font color="red">품절상품</font>
					</c:if>
				</div>
			</div>                                            
			<hr/>  
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p class="text-center"><strong>"${requestScope.keyword }"에 대한 조회 상품이 없습니다.</strong></p>
	</c:otherwise>
</c:choose> 

</div>




<!-- *********************************************************************************** -->

<!-- 버튼 -->
<c:choose>
	<c:when test="${requestScope.pagingBean.previousPageGroup }">
		<a href="/HwangDangFleamarket/buy/findProductByKeyword.go?page=${requestScope.pagingBean.beginPage -1 }&keyword=${requestScope.keyword}">◀</a>
	</c:when>
	<c:otherwise>
		◁
	</c:otherwise>
</c:choose>

<!-- 페이징 -->
	<c:forEach begin="${requestScope.pagingBean.beginPage }" 
								end="${requestScope.pagingBean.endPage}" var="page" >
		<c:choose>
			<c:when test="${requestScope.pagingBean.page == page }">
		 	[${page }]
			</c:when>
			<c:otherwise>
				 <a href="/HwangDangFleamarket/buy/findProductByKeyword.go?page=${page }&keyword=${requestScope.keyword}">${page }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
<!-- 버튼 -->
<c:choose>   
	<c:when test="${requestScope.pagingBean.nextPageGroup}">
		<a href="/HwangDangFleamarket/buy/findProductByKeyword.go?page=${requestScope.pagingBean.endPage+1 }&keyword=${requestScope.keyword}">▶</a>
	</c:when>
	<c:otherwise>
		▷
	</c:otherwise>
</c:choose>



