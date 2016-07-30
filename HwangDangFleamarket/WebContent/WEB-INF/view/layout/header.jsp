<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function(){
		$("#searchBtn").on("click" , function(){
			 alert("test@@@@@@@@"); 
			 /* alert($("input[name='keyword']").val());
	  			var keyword = $("input[name='keyword']").val();
	  			if(keyword.length == 0){
	  				alert("검색어를 입력하세요.");
	  			} */
	  	});
		
	}); //ready
</script>
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
						<input type="text"  size="25" name="keyword" placeholder=" search for product..." >
						<input class="btn btn-default" type="submit" value="go"  id="searchBtn">
					</form>   
				</li>
				<c:choose>
					<c:when test="${not empty sessionScope.login_info }">
						<li><a href="/HwangDangFleamarket/member/logout.go" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a></li>
						<li><a href="/HwangDangFleamarket/member/passwordConfirm.go">my page</a></li>
						<li><a href="/HwangDangFleamarket/myorder/myorderMain.go?loginId=${sessionScope.login_info.memberId }">나의주문</a></li>
						<li><a href="/HwangDangFleamarket/cart/cartList.go?memberId=${sessionScope.login_info.memberId}">장바구니</a></li>
					</c:when>
					<c:otherwise> 
						<li><a href="#" onClick="window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=no width=700 height=450 left=500 top=200');">로그인</a></li>
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
		<div align="center" class="main-buttons col-sm-6">
			<ul class="nav navbar-nav navbar-right links">
				<!-- 삭제 예정 <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li> -->
				<li><a href="#" class="navbar-collapse collapse navbars main-buttons">
					<img src="/HwangDangFleamarket/image_storage/tutorial.JPG">
				</a></li>
		        <li><a href="/HwangDangFleamarket/seller/sellerList.go?page=1" class="navbar-collapse collapse navbars main-buttons" style="margin-right: 30px;">
		        	<img src="/HwangDangFleamarket/image_storage/stores.JPG">
	        	</a></li>
		        <li><a href="/HwangDangFleamarket/admin/adminNotice.go?page=1" class="navbar-collapse collapse navbars main-buttons" style="margin-right: 0px;">
		    		<img src="/HwangDangFleamarket/image_storage/notice.JPG">
	    		</a></li>
		        <li><a href="/HwangDangFleamarket/admin/boardQnAList.go?page=1" class="navbar-collapse collapse navbars main-buttons">
		        	<img src="/HwangDangFleamarket/image_storage/Q&A.JPG">
	        	</a></li>
	        </ul>
		</div>
	</div>
</nav>