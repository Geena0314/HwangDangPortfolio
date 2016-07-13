<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
a {
	text-decoration: none !important;
}

b {
	font-size: 15pt;
}
.main{
	min-height: 600px;
}
#adminTable{
	width: 800px;
	font-size: 13pt;
	margin:  auto;
	text-align: center;
}
.table-responsive{
	overflow-x: hidden; 
}
</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#addBtn").on("click",function(){
			//글등록 페이지로 이동 
			location.href="/HwangDangFleamarket/boardQnA_register_form.go";		
		});	
		
	/* 	$("#moveDetail").on("click",function(){
			alert("gg");
			return false;
		});	 */
		
	});//ready
</script>

<br/><br/>  
   
<h2 class="page-header store_look_around">황당 플리마켓 Q&A</h2>
	<div class="table-responsive adminNotice">
	<table class="table table-hover" id="adminTable">
		<thead>
			<tr class="trInput">
				<td class="tdName" width="50px">no</td>
				<td class="tdName" width="80px">답변여부</td>
				<td class="tdName"  width="150px">글제목</td>
				<td class="tdName" width="70px">작성자</td>
				<td class="tdName" width="90px">작성일</td>
				<td class="tdName" width="60px">조회수</td>
				<td class="tdName" width="77px">공개여부</td>
			</tr>
		</thead>
		<tbody>		
				
				<c:forEach var="list" items="${requestScope.list }" >
				
				<tr class="trInput">
					<td>${list.adminQnaNo }</td>
					<td class="tdName">
						<c:choose>
							<c:when test="${list.adminQnaReplyExist eq 't' }"><font color="blue">완료</font> </c:when>
							<c:otherwise><font color="red">미완료</font></c:otherwise>
						</c:choose>
						
					</td>  
					<td><a  id="moveDetail" href="/HwangDangFleamarket/admin/boardQnADetailBefore.go?page=${requestScope.pasingBean.page }&no=${list.adminQnaNo }">${list.adminQnaTitle }</a></td>
					<td>${list.adminQnaWriter }</td>
					<td><fmt:formatDate value="${list.adminQnaDate }" pattern="yyyy-MM-dd"/></td>
					<td>${list.adminQnaHit }</td>
					 <c:choose>
						<c:when test="${list.adminQnaPublished == 't'}">
							<td>공개</td>
						</c:when>
						<c:otherwise>
							<td><mark>비공개</mark></td>
						</c:otherwise>   
					</c:choose>
				</tr>
				</c:forEach>
		</tbody>
	</table>
	<p class="text-center">
		<c:if test="${sessionScope.login_info.memberId != null }">
		<input type="button" id="addBtn" value="문의하기" class="btn btn-default" />
	</c:if>
	</p>
	
	
	<!-- *************************************************************** -->
	<p class="text-center">
	<!-- ◀버튼처리 -->  
	<c:choose>
		<c:when test="${requestScope.pasingBean.previousPageGroup }">
			<a href="/HwangDangFleamarket/admin/boardQnAList.go?page=${requestScope.pasingBean.beginPage-1}">
			◀
			</a>
		</c:when>
		<c:otherwise>
		 	◁	  
		</c:otherwise>
	</c:choose>
	
		<!-- 페이징처리 -->
		<c:forEach begin="${requestScope.pasingBean.beginPage }" end="${requestScope.pasingBean.endPage }" var="page">
			<c:choose>
				<c:when test="${requestScope.pasingBean.page == page }">
					<strong>${page}</strong>
				</c:when>
				<c:otherwise>
					<a href="/HwangDangFleamarket/admin/boardQnAList.go?page=${page }">${page}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- ▶버튼 처리  -->
	<c:choose>
		<c:when test="${requestScope.pasingBean.nextPageGroup}">
				<a href="/HwangDangFleamarket/admin/boardQnAList.go?page=${requestScope.pasingBean.endPage +1 }">▶ </a>
		</c:when>
		<c:otherwise>
			▷	  
		</c:otherwise>
	</c:choose>
	<br/> 
	 
	</p>
	
</div>	
