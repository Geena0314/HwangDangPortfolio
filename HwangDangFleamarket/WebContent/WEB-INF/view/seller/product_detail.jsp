<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/product_detail.css">
<link rel="stylesheet" href="/HwangDangFleamarket/uiscripts/jquery-ui.min.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/HwangDangFleamarket/js/seller/product_detail.js"></script>

<h2 class="page-header store_look_around" align="left">상품 상세 정보 보기</h2>
<div id="main" align="center">
	<div class="row placeholders product-row">
		<div id="mainImage" align="center" class="col-sm-6 margins">
			<img class="main-image"src="../image_storage/${ requestScope.product.productMainImage }" >
		</div>
		<div id="table" align="center" class="col-sm-6 margins">
			<form method="POST" action="#" class="form-product">
				<table class="table-striped productTB">
					<tr><td>상품ID</td><td id="productId">${ requestScope.product.productId }</td></tr>
				<tr>
					<td>상품명</td>
					<td id="prductName">${ requestScope.product.productName }</td>
				</tr>
				<tr>
					<td>가격</td>
					<td id="productPrice">${ requestScope.product.productPrice }원</td>
				</tr>
				<tr>
					<td>옵션</td>
					<td>
						<!-- <option value=${ option.optionId } hidden="true"></option> -->
						<select id="optionName">
							<option>${ requestScope.optionList[0].optionName }</option>
							<lee:forEach items="${ requestScope.optionList }" var="option">
								<option value=${ option.optionSubName }>${ option.optionSubName }</option>
							</lee:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="optionId">
					</td>
				</tr>
				<tr><td colspan="2" id="optionNameError"></td></tr>
				<tr>
					<!-- <td>수량</td>
					<td>
						<select id="optionStock">
							<option>수량선택</option>
						</select>
					</td> -->
					<td>수량</td>
					<td>
						<img src="../image_storage/minus.png" style="width:15px; height:15px; cursor: pointer;" class="amount" id="minus">
						<input type="text" size="3" readonly="readonly" value="0" id="optionStock">
						<img src="../image_storage/plus.png" style="width:15px; height:15px; cursor: pointer;" class="amount" id="plus">
					</td>
				</tr>
				<tr><td colspan="2" id="optionStockError"></td></tr>
				<tr id="optionAddPriceTr">
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="장바구니" id="cartBtn"><input type="submit" value="바로구매" id="buyBtn" ><input type="button" id="listBtn" value="목록으로" onclick="window.location='/HwangDangFleamarket/product/list.go?page=${param.page}&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }'"></td>
				</tr>
				<lee:if test="${sessionScope.seller.sellerStoreNo == param.sellerStoreNo}">
					<tr>
						<td colspan="2"><input type="button"  id="editBtn" value="상품 수정" onclick="window.location='/HwangDangFleamarket/product/editProductForm.go?page=${param.page}&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }&productId=${ requestScope.product.productId }'"><input type="button" value="상품 삭제" id="deleteBtn"></td>
					</tr>
				</lee:if>
				</table>
			</form>
		</div>
		<div id="like" class="margins" style="margin-right:50px; font-size: 15pt;" align="right">
			추천 : ${ requestScope.product.productLike }&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div id="info" align="center">
		<div class="detailInfo">
			<h3 class="page-header2">상세 보기</h3>
			<lee:forEach items="${ requestScope.detailimage }" var="image">
				<img class="detail-image" src="../image_storage/${ image }"><br>
			</lee:forEach>
			${ requestScope.product.productInfo }
		</div>
	<table id="reviewTable" class="table-striped reviewTable">
		<tr>
			<td style="min-width:400px;">Review</td>
			<td style="min-width:200px;" align="right">
				추천<input type="radio" name="productLike" value="1" checked="checked">
				비추천<input type="radio" name="productLike" value="-1">
			</td>
		</tr>
		<tr>
			<td>리뷰 내용</td>
			<td>작성자</td>
		</tr>
		<tr>
			<td id="reviewContent">
				<lee:forEach items="${ requestScope.reviewList }" var="review">
				${ review.reviewNo }. ${ review.reviewContent }<br>
			</lee:forEach>
		</td>
			<td id="reviewWriter">
				<lee:forEach items="${ requestScope.reviewList }" var="review">
					${ review.reviewWriter }<br>
				</lee:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="paging" class="reviewPageGroup">
				<!-- 
					이전 페이지 그룹 처리.
					만약, 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리. 
				-->
				<lee:choose>
					<lee:when test="${ requestScope.bean.previousPageGroup }">
						<a class="previousPage">◀</a>
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
						<lee:forEach begin="${ requestScope.bean.beginPage }" end="${ requestScope.bean.endPage }" var="page" varStatus="no">
							<lee:choose>
								<lee:when test="${ page != requestScope.bean.page }">
									<a class="movePage"><b>${ page }</b></a>
								</lee:when>
								<lee:otherwise>
									<a id="currentPage" >${ page }</a>
								</lee:otherwise>
							</lee:choose>
						</lee:forEach>
						
						<!-- 
							다음 페이지 그룹 처리.
							만약, 다음페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리. 
						-->
						<lee:choose>
							<lee:when test="${ requestScope.bean.nextPageGroup }">
								<a class="nextPage">▶</a>
							</lee:when>
							<lee:otherwise>
								▶
							</lee:otherwise>
						</lee:choose>
					</td>
				</tr>
				<tr><td colspan="2" id="reviewError"></td></tr>
				<tr>
					<td>
						<input id="reviewWrite" type="text" placeholder="본 상품을 구매한 구매자만 입력 가능합니다.(20글자 제한)" size="65">
					</td>
					<td>
						<input type="button" id="reviewRegister" value="등록" ><input type="button" id="reviewDelete" value="내리뷰삭제" ><!-- style="width:120px;" -->
					</td>
				</tr>
			</table>
			<hr width="65%"><hr width="65%">
	<table id="qnaTable" class="table-striped reviewTable">
		<tr><td colspan="3" align="center">QnA</td></tr>
		<tr>
			<td width="50"></td><td width="450" align="center">Q.문의제목</td>
			<td align="center" width="100">작성자</td>
		</tr>
		
		<lee:forEach items="${ requestScope.qnaMap.qna }" var="qna">
		<tr align="center" class="qnaTrs" id="${ qna.storeQnANo }"><td width="30">${ qna.storeQnANo }</td><td align="center"> ${ qna.storeQnATitle }</td><td align="center">${qna.storeQnAWriter}</td>
		</lee:forEach>
	
		<tr id="qnaTr">
			<td></td><td align="center" id="qnaPaging" class="reviewPageGroup">
			<!-- 
				이전 페이지 그룹 처리.
				만약, 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리. 
			-->
			<lee:choose>
				<lee:when test="${ requestScope.qnaMap.qnaBean.previousPageGroup }">
					<a class="qnaPreviousPage">◀</a>
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
			<lee:forEach begin="${ requestScope.qnaMap.qnaBean.beginPage }" end="${ requestScope.qnaMap.qnaBean.endPage }" var="page" varStatus="no">
				<lee:choose>
					<lee:when test="${ page != requestScope.qnaMap.qnaBean.page }">
						<a class="qnaMovePage"><b> ${ page } </b></a>
					</lee:when>
					<lee:otherwise>
						<a id="qnaCurrentPage" > ${ page } </a>
					</lee:otherwise>
				</lee:choose>
			</lee:forEach>
			
			<!-- 
				다음 페이지 그룹 처리.
				만약, 다음페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리. 
			-->
			<lee:choose>
				<lee:when test="${ requestScope.qnaMap.qnaBean.nextPageGroup }">
					<a class="qnaNextPage">▶</a>
				</lee:when>
				<lee:otherwise>
					▶
				</lee:otherwise>
			</lee:choose>
		</td><td></td>
		</tr>
		<tr><td colspan="2" id="qnaError"></td></tr>
		<tr>
			<td colspan = "3" align="right" id="qnaRegisterTD"><input type="button" id="qnaRegister" value="문의 하기" onClick="if(${empty sessionScope.login_info.memberId }){if(confirm('로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?')){window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=yes width=700 height=450 left=500 top=200');}}else{window.open('/HwangDangFleamarket/storeQnA/storeQnARegisterForm.go?productId=${param.productId}&memberId=${ sessionScope.login_info.memberId }','문의하기','resizable=no width=600 height=600 left=500 top=200');};"></td>
		</tr>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div id="cartLayer" title="장바구니 담기">
		<b>장바구니</b>에 담겼습니다.
	</div>
</div>