<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

		<!-- id -->
		<table width='600' class="table table-striped">
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
		
		</table>