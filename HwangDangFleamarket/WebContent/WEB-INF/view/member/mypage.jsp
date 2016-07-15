<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#withdtawalBtn').on("click", function(){
		if(confirm("정말 탈퇴하실건가요ㅠㅠ?")){
			if(confirm("진짜로ㅠㅠ?")){
				alert("회원탈퇴가 처리되었습니다.");
				location.href='/HwangDangFleamarket/member/memberWithdrawal.go?memberId=${sessionScope.login_info.memberId}';
			}			
		}
		return false;
	});
});
</script>
<h2 class="page-header store_look_around">황당 플리마켓 MyPage</h2>
<div class="row placeholders"  id="all">
	<lee:choose>
		<lee:when test="${ sessionScope.login_info.memberId == 'kinghwang@gmail.com' }">
			<div class="col-md-6" id="sellerRegister" >
				<a href="/HwangDangFleamarket/admin/sellerRegisterStatus.go?page=1">
					<!-- 판매자 신청 현황.(관리자) -->
					<img class="mypage-images adminImages" src="../image_storage/sellerRegisterStatus.jpg">
				</a>
			</div>
		</lee:when>
		<lee:otherwise>
			<lee:choose>
				<lee:when test="${ sessionScope.login_info.memberAssign == 0 }">
					<lee:choose>
						<lee:when test="${ sessionScope.sellerRegister == 1}">
							<div class="col-sm-4" id="sellerRegister">
								<!-- 등록신청을 했는데 결과가 없는경우. -->
								<img class="mypage-images sellerImages" src="../image_storage/sellerRegisterResult.jpg">
							</div>
						</lee:when>
						<lee:otherwise>
							<div class="col-sm-4" id="sellerRegister">
								<a href="/HwangDangFleamarket/member/sellerRegister.go">
									<img class="mypage-images sellerImages" src="../image_storage/sellerRegister.jpg"><!-- 등록폼으로이동. 판매자등록신청.-->
								</a>
							</div>
						</lee:otherwise>
					</lee:choose>
				</lee:when>
				<lee:otherwise>
					<div class="col-sm-4" id="sellerRegister">
						<a href="/HwangDangFleamarket/seller/salesStatus.go?page=1&sellerStoreNo=${ sessionScope.seller.sellerStoreNo }">
							<img class="mypage-images sellerImages" src="../image_storage/salesStatus.jpg"><!-- 판매현황조회. -->
						</a>
					</div>
				</lee:otherwise>
			</lee:choose>
		</lee:otherwise>
	</lee:choose>
	
	<lee:choose>
		<lee:when test="${ sessionScope.login_info.memberId == 'kinghwang@gmail.com' }">
			<div class="col-md-6" id="memberEdit">
			</div>
		</lee:when>
		<lee:otherwise>
		<!-- 회원,판매자 정보 수정. -->
			<div class="col-sm-4" id="memberEdit">
				<a href="/HwangDangFleamarket/member/member_info_update.go"><img class="mypage-images" src="../image_storage/memberEdit.jpg"></a>  
			</div>
		</lee:otherwise>
	</lee:choose>
		
	<div id="memberWithdrawal">
		<lee:if test="${ sessionScope.login_info.memberId != 'kinghwang@gmail.com' }">
			<div class="col-sm-4" id="memberWithdrawal">
				<a id="withdtawalBtn" href="#">
					<img class="mypage-images" src="../image_storage/withdrawal.jpg">
				</a>
			</div>
		</lee:if>
	</div>
</div>