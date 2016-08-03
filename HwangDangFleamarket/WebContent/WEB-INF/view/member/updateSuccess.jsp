<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	.table.table-striped.editInfoTB
	{
		width: 60%;
		position: relative;
		left: 20%;
	}
</style>

<h2 class="page-header store_look_around">회원정보수정완료</h2>
<c:if test="${not empty sessionScope.login_info}">
	<table width='600' class="table table-striped editInfoTB">
		<!-- id -->
		<tr class="trInput">
			<td width='150' class='tdName'>I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D</td>
			<td>
				${sessionScope.login_info.memberId }
			</td>
		</tr>
		
		<!-- password  -->
		<tr class="trInput">
			<td width='150' class='tdName'>비밀전호</td>
			<td>
				 ${sessionScope.login_info.memberPassword } 
			</td>
		</tr>
		
		<!-- name  -->
		<tr class="trInput">
			<td width='150' class='tdName'>이름</td>
			<td>
				 ${sessionScope.login_info.memberName } 
			</td>
		</tr>
		
		<!-- 전화번호  -->
		<tr class="trInput">
			<td width='150' class='tdName'>전화번호</td>
			<td>
				${sessionScope.login_info.memberPhone}
			</td>
		</tr>
		
		<!-- 주소  -->
		<tr class="trInput">
			<td width='150' class='tdName'>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
			<td>
				 ${sessionScope.login_info.memberZipcode} ${sessionScope.login_info.memberAddress  } ${sessionScope.login_info.memberSubAddress }
			</td>
		</tr>
		
		<!-- 전화번호  -->
		<tr class="trInput">
			<td width='150' class='tdName'>전화&nbsp;번호</td>
			<td>
				${sessionScope.login_info.memberPhone}
			</td>
		</tr>
		
		<!-- 마일리지  -->
		<tr class="trInput">
			<td width='150' class='tdName'>마일리지</td>
			<td>
				 ${sessionScope.login_info.memberMileage}
			</td>
		</tr>
		
		<c:if test="${ not empty sessionScope.seller }">
		
			<tr class="trInput">
				<td width='150' class='tdName'>상호명</td>
				<td>
					 ${sessionScope.seller.sellerStoreName}
				</td>
			</tr>
			
			<tr class="trInput">
				<td width='150' class='tdName'>사업자 번호</td>
				<td>
					 ${sessionScope.seller.sellerTaxId}
				</td>
			</tr>
			
			<!-- 주소  -->
			<tr class="trInput">
				<td width='150' class='tdName'>스토어 주소</td>
				<td>
					 ${sessionScope.seller.sellerZipcode} ${sessionScope.seller.sellerAddress  } ${sessionScope.seller.sellerSubAddress }
				</td>
			</tr>
			
			<tr class="trInput">
				<td width='150' class='tdName'>계좌 정보</td>
				<td>
					 ${sessionScope.seller.sellerBank}&nbsp;&nbsp;&nbsp;${sessionScope.seller.sellerAccount }
				</td>
			</tr>
			
			<tr class="trInput">
				<td width='150' class='tdName'>판매물품 1</td>
				<td>
					 ${sessionScope.seller.sellerProduct1}
				</td>
			</tr>
			
			<tr class="trInput">
				<td width='150' class='tdName'>판매물품 2</td>
				<td>
					 ${sessionScope.seller.sellerProduct2}
				</td>
			</tr>
			
			<tr class="trInput">
				<td width='150' class='tdName'>판매물품 3</td>
				<td>
					 ${sessionScope.seller.sellerProduct3}
				</td>
			</tr>
			
			<tr class="trInput">
				<td width='150' class='tdName'>스토어 소개글</td>
				<td>
					 ${sessionScope.seller.sellerProduct3}
				</td>
			</tr>
		</c:if>
	</table>
</c:if>
<p>요청하신 회원정보가 수정 되었습니다. <br/>