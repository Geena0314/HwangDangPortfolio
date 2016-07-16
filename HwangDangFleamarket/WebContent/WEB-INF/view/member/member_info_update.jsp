<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var passwordFlag = false;
		var nameFlag = false;
		var phoneFlag = false;
		var addressFlag = false;
		var oldPsswordFlag = false;
		var sellerAddress = false;
		var storeImage = false;
		var storeName = false;
		var sellerTaxId = false;
		var sellerProduct1 = false;
		var sellerProduct2 = false;
		var sellerProduct3 = false;
		//기존비밀번호 맞는지 검증
		$("#oldPassword").on("blur", function(){
			var oldPassword = $("#oldPassword").val().trim();
			//alert(oldPassword);
			$.ajax({   
				"url" : "/HwangDangFleamarket/member/oldPasswordChecked.go" , 
				"type" : "POST" , 
				"data" :  "oldPassword=" +oldPassword , 
				"dataType" : "text"  ,
				"sendBefore" : function(){
					if(oldPassword.length == 0){
						alert("비밀번호를 입력해주세요.");
						return false;
					}else if(oldPassword.length < 8){
						alert("비밀번호는 8자 이상 입니다.")
					}
				} , 
				"success" : function(flag){
					if(flag == 'true'){
						// 기존비밀번호와 입력비밀번호 일치
						$("#currentPasswordMsg").html("비밀번호가 일치합니다.");
						oldPsswordFlag = true;
					}else{
						//불일치
						$("#currentPasswordMsg").html("비밀번호를 잘못입력 하였습니다.(불일치)");
					}
				} , 
				"error" : function(a , status , httpErrorMsg){
					alert("패스워드 Ajax 실패 :" + status +httpErrorMsg);
				}
			});
		}); // 패스워드 ajax func
		
		$("#selectEmail").on("change", function(){
					var index = this.selectedIndex;
					if(index == 0){
						$("#domain").empty().hide();
						return false;
					}
					else if(index == 16){
						$("#domain").val("").removeAttr("readonly").show();
						return false;
					}
					else{
						$("#domain").empty().val($("#selectEmail option:selected").val()).hide();
						return true;
					}
				});
				
				//submit 클릭시.
				$("#submit").on("click", function(){
					var result;
					if(!oldPsswordFlag && passwordFlag) {
						//기존비밀번호불일치
						alert("기존비밀번호가 틀립니다. 확인바랍니다.");
						return false;
					}
					
					if( passwordFlag  && $("#newPassword1").val().trim().length < 8 || $("#newPassword1").val().trim().length > 20){
						alert("패스워드는 8자 이상 20자 이하로 입력해 주세요.");
						$("#newPassword1").val("").focus();
						$("#newPassword2").val("");
						return false;
					}
					if( passwordFlag  && $("#newPassword1").val().trim() != $("#newPassword2").val().trim()){
						alert("패스워드1과 패스워드2가 틀립니다.");
						$("#newPassword1").val("").focus();
						$("#newPassword2").val("");
						return false;
					}
					
					
					
					if(nameFlag && $("#memberName").val().trim().length < 2 || $("#memberName").val().trim().length > 6)
					{
						alert("이름은 2자이상 6자 이하로 입력해 주세요.");
						$("#memberName").val("").focus();
						return false;
					}
					    
					if(phoneFlag && ($("#hp2").val().trim().length < 3 || $("#hp2").val().trim().length > 4 || $("#hp3").val().trim().length != 4) ){	
						alert("전화번호를 올바르게 입력해 주세요.")
						$("#hp2").val("").focus();
						$("#hp3").val("");
						return false;
					}
					
					if(addressFlag && addressFlag && !$("#memberZipcode").val())
					{
						alert("주소를 검색해 주세요.");
						return false;
					}
					if(addressFlag && $("#memberSubAddress").val().trim().length < 4 || $("#memberSubAddress").val().trim().length > 30)
					{
						alert("세부 주소는 4자 이상 30자 이하로 입력해 주세요.");
						$("#memberSubAddress").val("").focus();
						return false;
					}
					var id = $("#memberId").val()+"@"+$("#domain").val();
					$.ajax({
						"url" : "/HwangDangFleamarket/member/registerIdCheck.go",
						"type" : "POST",
						"data" : "memberId=" + id,
						"dataType" : "text",
						"async" : false,
						"beforeSend" : function(){
							
						},
						"success" : function(text){
							if(text == "fail"){
								alert("중복된 ID입니다.");
								$("#memberId").val("").focus();
								r = false;
								return false;
							}
							else{
								r = true;
								//alert("비밀번호 중복아님다.!");
								$("form").prop("action" , "/HwangDangFleamarket/member/setMember.go");
								$("form").submit();
								
							}
						},
						"error" : function(a  , status , httpMsg){
							alert("ajax실패:"+httpMsg);
						}
					});
					
					return r;
				});
		
		//패스워드 변경 폼 view
		$("#updatePasswordBtn").on("click",function(){
			$("#hiddenPasswordSpan").show();
			passwordFlag = true;
		});
		
		//패스워드 변경 취소...
		$("#updatePasswordDelete").on("click",function(){
			$("#hiddenPasswordSpan").hide();
			$("#oldPassword").val("");
			$("#newPassword1").val("");
			$("#newPassword2").val("");
			passwordFlag = false;
		});
		
		$("#nameUpdateBtn").on("click",function(){
				$("#hiddenNameSpan").show();
				 nameFlag = true;
		});
		
		//이름변경 취소...
		$("#updateNameDelete").on("click",function(){
			$("#hiddenNameSpan").hide();
			$("#memberName").val("");
			nameFlag = false;
		});
		
		$("#phoneUpdateBtn").on("click",function(){
			$("#hiddenPhoneSpan").show();
			 phoneFlag = true;
		});
		
		//전화번호 변경 취소...
		$("#phoneDeleteBtn").on("click",function(){
			$("#hiddenPhoneSpan").hide();
			$("#hp2").val("");
			$("#hp3").val("");
			 phoneFlag = true;
		});
		
		$("#updateAddressBtn").on("click",function(){
			$("#hiddenAddressSpan").show();
			addressFlag = true;
		});
		
		//주소 변경 삭제
		$("#deleteAddressBtn").on("click",function(){
			$("#hiddenAddressSpan").hide();
			$("#memberZipcode").val("");
			$("#memberAddress").val("");
			$("#memberSubAddress").val("");
			addressFlag = false;
		});
		
		$("#updateSellerAddress").on("click", function()
		{
			$("#hiddenSellerAddress").show();
			sellerAddress = true;
		});
		
		$("#deleteSellerAddress").on("click", function()
		{
			$("#hiddenSellerAddress").hide();
			$("#sellerZipcode").val("");
			$("#sellerAddress").val("");
			$("#sellerSubAddress").val("");
			sellerAddress = false;
		});
		
		//사진수정, 취소
		$("#updateStoreImage").on("click", function()
		{
			$("#hiddenStoreImage").show();
			storeImage = true;
		});
		
		$("#deleteStoreImage").on("click", function()
		{
			$("#hiddenStoreImage").hide();
			storeImage = false;
		});
		
		//상호명 수정, 취소
		$("#updateStoreName").on("click", function()
		{
			$("#hiddenStoreName").show();
			storeName = true;
		});
		
		$("#deleteStoreName").on("click", function()
		{
			$("#hiddenStoreName").hide();
			$("#sellerStoreName").val("");
			storeName = false;
		});

		//사업자 번호 수정, 취소.
		$("#updateSellerTaxId").on("click", function()
		{
			$("#hiddenSellerTaxId").show();
			sellerTaxId = true;
		});
		
		$("#deleteSellerTaxId").on("click", function()
		{
			$("#hiddenSellerTaxId").hide();
			$("#sellerTaxId").val("");
			sellerTaxId = false;
		});
		
		//판매 물품 수정, 취소
		$("#updateSellerProduct1").on("click", function()
		{
			$("#hiddenSellerProduct1").show();
			sellerProduct1 = true;
		});
		
		$("#deleteSellerProduct1").on("click", function()
		{
			$("#hiddenSellerProduct1").hide();
			$("#sellerProduct1").val("");
			sellerProduct1 = false;
		});
		
		//판매 물품 수정, 취소
		$("#updateSellerProduct2").on("click", function()
		{
			$("#hiddenSellerProduct2").show();
			sellerProduct2 = true;
		});
		
		$("#deleteSellerProduct2").on("click", function()
		{
			$("#hiddenSellerProduct2").hide();
			$("#sellerProduct2").val("");
			sellerProduct2 = false;
		});
		
		//판매 물품 수정, 취소
		$("#updateSellerProduct3").on("click", function()
		{
			$("#hiddenSellerProduct3").show();
			sellerProduct3 = true;
		});
		
		$("#deleteSellerProduct3").on("click", function()
		{
			$("#hiddenSellerProduct3").hide();
			$("#sellerProduct3").val("");
			sellerProduct3 = false;
		});
	}); //ready
</script>
<style type="text/css">
	form
	{
		margin-bottom: 30px;
	}
</style>
<h2 class="page-header store_look_around">황당 플리마켓 회원정보 수정</h2>
<form method="post" enctype="multipart/form-data" action="/HwangDangFleamarket/member/setMember.go" name="sellerForm" id="registerForm">
<div class="table-responsive" >
	<table width='600' class="table table-striped">
		<tr class="trInput">
		
			<td width='150' class='tdName'>I&nbsp&nbsp&nbsp&nbsp&nbspD</td>
			<td>
				 ${sessionScope.login_info.memberId } 
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>password</td>
			<td>
				<input type="button"  id="updatePasswordBtn" value="수정"/><br/>
				<span hidden="true" id="hiddenPasswordSpan">
					현재비밀번호 : <input type="password" name="oldPassword" size="20" id="oldPassword"><font color="blue" id="currentPasswordMsg">현재 비밀번호를 입력해 주세요</font><br/>
					새 비밀번호 : <input type="password" name="newPassword1" size="20" id="newPassword1"> 8~15자의 영문 대/소문자, 숫자 조합<br/>
					새 비밀번호 확인 :<input type="password" name="newPassword2" size="20" id="newPassword2"><input type="button"  id="updatePasswordDelete" value="수정취소"/><br/>
				</span>
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
			<td>
				${sessionScope.login_info.memberName }<input type="button" value="수정" id="nameUpdateBtn"/><br/>
				<span hidden="hidden" id="hiddenNameSpan">
					<input type="text" name="memberName" size="20" id="memberName" onkeydown="nameCheck(this);">
					<input type="button"  id="updateNameDelete" value="수정취소"/>
				</span>
				
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>전화번호</td>
			<td>${sessionScope.login_info.memberPhone } <input type="button" value="수정"  id="phoneUpdateBtn" />
			<br/>
			<span id="hiddenPhoneSpan"  hidden="true">
				<select id="hp1" name="hp1">
	    	        <option>010</option>
	    	        <option>011</option>
	    	        <option>016</option>
	    	        <option>017</option>
	            	<option>018</option>
					<option>019</option>
				</select>
				-
				<input type="text" name="hp2" size="10" id="hp2">
				-
				<input type="text" name="hp3" size="10" id="hp3">
				<input type="button"  id="phoneDeleteBtn" value="수정취소"/>
			</span>					
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>주&nbsp;&nbsp;&nbsp;&nbsp;소</td>
			<td>
				[ ${sessionScope.login_info.memberZipcode } ] ${sessionScope.login_info.memberAddress } ${sessionScope.login_info.memberSubAddress }<input type="button" value="수정" id="updateAddressBtn"/><br/>
			
			<span id="hiddenAddressSpan" hidden="true">
				<input type="text" name="memberZipcode" size="30" readonly="readonly" id="memberZipcode" size="30">
				<input type="button" value="주소검색" id="findAddress" onclick="window.open('/HwangDangFleamarket/member/findAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');">
				<input type="text" name="memberAddress" size="60" readonly="readonly" id="memberAddress"><br>
				<input type="text" name="memberSubAddress" size="60" id="memberSubAddress">
				<input type="button"  id="deleteAddressBtn" value="수정취소"/>
			</span>
			</td>
		</tr>   
		
		<tr class="trInput">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		
		<c:if test="${not empty sessionScope.seller}">
			<tr class="trInput">
				<td class="tdName">상호명</td>
				<td>
					${ sessionScope.seller.sellerStoreName } <input type="button" value="수정" id="updateStoreName"/>
					<span id="hiddenStoreName" hidden="true">
						<input type="text" name="sellerStoreName" id="sellerStoreName" placeholder="3글자 이상 20자 이하">
						<input type="button"  id="deleteStoreName" value="수정취소"/>
					</span>
				</td>
			</tr>
			<tr class="trInput">
				<td class="tdName">사업자번호</td>
				<td>
					${ sessionScope.seller.sellerTaxId } <input type="button" value="수정" id="updateSellerTaxId"/>
					<span id="hiddenSellerTaxId" hidden="true">
						<input type="number" name="sellerTaxId" id="sellerTaxId">
						<input type="button"  id="deleteSellerTaxId" value="수정취소"/>
					</span>
				</td>
			</tr>
			<tr class="trInput">
				<td class='tdName'>주&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td>
				[ ${sessionScope.seller.sellerZipcode } ] ${sessionScope.seller.sellerAddress } ${sessionScope.seller.sellerSubAddress }<input type="button" value="수정" id="updateSellerAddress"/><br/>
			
					<span id="hiddenSellerAddress" hidden="true">
						<input type="text" name="sellerZipcode" size="30" readonly="readonly" id="sellerZipcode">
						<input type="text" name="sellerAddress" size="60" readonly="readonly" id="sellerAddress">
						<input type="button" value="주소검색" id="findAddress" onclick="window.open('/HwangDangFleamarket/member/findSellerAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');"><br>
						<input type="text" name="sellerSubAddress" size="60" id="sellerSubAddress">
						<input type="button"  id="deleteSellerAddress" value="수정취소"/>
					</span>
				</td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>대표 사진</th>
				<td colspan="2">
					<input type="button" value="수정" id="updateStoreImage"/>
					<span id="hiddenStoreImage" hidden="true">
						<input type="file" name="sellerStoreImage" id="sellerStoreImage">
						<input type="button"  id="deleteStoreImage" value="수정취소"/>
					</span>
				</td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>판매 물품 1</th>
				<td colspan="2">
					${ sessionScope.seller.sellerProduct1 }
					<input type="button" value="수정" id="updateSellerProduct1"/>
					<span id="hiddenSellerProduct1" hidden="true">
						<input type="text" name="sellerProduct1" id="sellerProduct1">
						<input type="button"  id="deleteSellerProduct1" value="수정취소"/>
					</span>
				</td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>판매 물품 2</th>
				<td colspan="2">
					${ sessionScope.seller.sellerProduct2 }
					<input type="button" value="수정" id="updateSellerProduct2"/>
					<span id="hiddenSellerProduct2" hidden="true">
						<input type="text" name="sellerProduct2" id="sellerProduct2">
						<input type="button"  id="deleteSellerProduct2" value="수정취소"/>
					</span>
				</td>
			</tr><tr class="trInput">
				<th class='tdName'>판매 물품 3</th>
				<td colspan="2">
					${ sessionScope.seller.sellerProduct3 }
					<input type="button" value="수정" id="updateSellerProduct3"/>
					<span id="hiddenSellerProduct3" hidden="true">
						<input type="text" name="sellerProduct3" id="sellerProduct3">
						<input type="button"  id="deleteSellerProduct3" value="수정취소"/>
					</span>
				</td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>스토어 소개글</th>
				<td colspan="2"><textarea id="sellerIntroduction" name="sellerIntroduction" cols="45" rows="10"></textarea></td>
			</tr>
			<tr class="trInput">
				<td colspan="2" align="left">
					<input class="btn btn-lg btn-success btn-block" type="submit" value="수정" id="submit">
					<input class="btn btn-lg btn-primary btn-block" type="reset" value="다시 작성">
				</td>
			</tr>
		</c:if>
	</table> 
</div>
</form>
