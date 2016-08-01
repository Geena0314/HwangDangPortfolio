<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid main-header">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbars" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="brand" href="/HwangDangFleamarket/main.go">
				<img class="homeMainImage" src="/HwangDangFleamarket/image_storage/home_logo.png">
			</a>
		</div>
		
			
		<div class="navbar-collapse collapse navbars">
			<ul class="nav navbar-nav navbar-right links fixed-menus">
				<li>
					<!-- 검색바 -->
					<form action="/HwangDangFleamarket/buy/findProductByKeyword.go" method="POST" id="searchForm" >
						<select id="searchCode">
							<option>해쉬태그</option>
							<option>상품 명</option>
							<option>상품 ID</option>
						</select>
						<input type="text"  size="25" name="keyword" placeholder=" search for product..." >
						<input class="btn btn-default" type="submit" value="go"  id="searchBtn">
					</form>  
				</li>
				<c:choose>
					<c:when test="${not empty sessionScope.login_info }">
						<li><a href="/HwangDangFleamarket/member/logout.go" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a></li>
						<li><a href="/HwangDangFleamarket/member/passwordConfirm.go">my page</a></li>
						<li><a href="/HwangDangFleamarket/order/diliveryStatus.go">나의주문</a></li>
						<li><a href="/HwangDangFleamarket/cart/cartList.go?memberId=${sessionScope.login_info.memberId}">장바구니</a></li>
					</c:when>
					<c:otherwise> 
						<li><a href="#" onClick="window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=yes width=700 height=450 left=500 top=200');">로그인</a></li>
						<li><a href="/HwangDangFleamarket/member/register.go">회원가입</a></li>
						<li><a href="#" onClick="if(confirm('로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?')){window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=yes width=700 height=450 left=500 top=200');};">my page</a></li>
						<li><a href="#" onClick="if(confirm('로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?')){window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=yes width=700 height=450 left=500 top=200');};">나의주문</a></li>
						<li><a href="#" onClick="if(confirm('로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?')){window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=yes width=700 height=450 left=500 top=200');};">장바구니</a></li>
					</c:otherwise> 
				</c:choose>
				<c:if test="${ sessionScope.login_info.memberAssign == 1 && sessionScope.seller.sellerAssign == 1}">
					<li><a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${sessionScope.seller.sellerStoreNo}&sellerStoreImage=${sessionScope.seller.sellerStoreImage}">내 스토어</a></li>
				</c:if>
			</ul>
		</div>
			<div>
				<a href="/HwangDangFleamarket/seller/sellerStore.go?sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${param.sellerStoreImage}">
					<img style="width: 130px; height: 130px; position: relative; left: 280px; top: -139px; border-radius: 20px;" class="store-main-img" id="storeMainImage" src="../image_storage/${param.sellerStoreImage}">
				</a>
				
				<div align="center" class="store-buttons col-sm-6">
					<ul class="nav navbar-nav navbar-right links">
						<!-- 삭제 예정 <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li> -->
						<li>
							<button class="navbar-collapse collapse navbars store-buttons">
								<img src="/HwangDangFleamarket/image_storage/intro.JPG">
							</button>
						</li>
						<li>
							<button class="navbar-collapse collapse navbars store-buttons" onclick="window.location='/HwangDangFleamarket/product/list.go?page=1&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${param.sellerStoreImage}'">
								<img src="/HwangDangFleamarket/image_storage/products.JPG">
							</button>
						</li>
		        		<li>
		        			<button class="navbar-collapse collapse navbars store-buttons" onclick="window.location='/HwangDangFleamarket/sellerNotice/sellerNotice.go?page=1&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${param.sellerStoreImage}'">
		        				<img src="/HwangDangFleamarket/image_storage/notice.JPG">
		        			</button>
		        		</li>
			        </ul>
				</div>
			</div>
	</div>
</nav>