<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#sellerZipcode").on("click", function()
		{
			window.open('/HwangDangFleamarket/member/findSellerAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');
		});
		$("#sellerAddress").on("click", function()
		{
			window.open('/HwangDangFleamarket/member/findSellerAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');
		});
		$("#password1").on("blur", function()
		{
			var password = '${sessionScope.login_info.memberPassword}';
			//처음 입력한 패스워드가 로그인한 회원의 패스워드와 일치하지 않는경우.
			$("#passwordError1").empty().hide();
			if(password != this.value)
			{
				$("#passwordError1").append("패스워드가 일치하지 않습니다.").show();
				$("#password1").val("");
			}
		});
		
		$("#password2").on("focus", function()
		{
			//패스워드를 입력하지않고 패스워드 확인창 클릭시.
			$("#passwordError2").empty().hide();
			if(!$("#password1").val())
			{
				$("#passwordError2").append("위의 패스워드를 먼저 입력하세요.").show();
				$("#password1").focus();
				return false;
			}
			else
			{
				$("#password2").on("blur", function()
				{
					$("#passwordError2").empty().hide();
					//패스워드는 맞고 패스워드확인창 입력 후
					if($("#password1").val() == $("#password2").val())
					{
						//패스워드가 모두 일치할 때.
						return true;
					}
					else
					{
						//패스워드 확인이 틀릴경우.
						$("#passwordError2").append("패스워드가 다릅니다.").show();
						$("#password2").val("");
					}
				});
			}
		});
		$("#sellerStoreName").on("blur", function()
		{
			$("#sellerStoreNameError").empty().hide();
			if(this.value == null || this.value.trim().length < 3 || this.value.length > 20)
			{
				//널이거나 3글자보다 작거나 20글자보다 큰경우.
				$("#sellerStoreName").val("");
				$("#sellerStoreNameError").append("3글자 이상, 20글자 이하로 입력.").show();
				return false;
			}
			else
			{
				//상호명 중복 체크.
				$.ajax(
				{
					"url" : "/HwangDangFleamarket/member/sellerStoreNameCheck.go",
					"type" : "POST",
					"data" : "sellerStoreName=" + $("#sellerStoreName").val(),
					"dataType" : "text",
					"beforeSend" : function()
					{
						
					},
					"success" : function(text)
					{
						if(text == 0)
						{
							$("#sellerStoreNameError").append("등록가능한 이름입니다.").show();
							return true;
						}
						else
						{
							$("#sellerStoreName").val("");
							$("#sellerStoreNameError").append("중복된 이름입니다.").show();
							return false;
						}
					},
					"error" : error
				});
			}
		});
		
		$("#sellerTaxId").on("blur", function()
		{
			$("#sellerTaxIdError").empty().hide();
			if(this.value.trim().length != 11)
			{
				if(this.value.trim().length == 0)
					return true;
				else
				{
					$("#sellerTaxId").val("");
					$("#sellerTaxIdError").append("11자리 숫자를 입력해주세요.").show();
				}
			}
		});
		
		$("#sellerIndustry").on("change", function()
		{
			//업종 선택했을 때. 1차 카테고리 이름으로 2차 카테고리 검색.
			var idx = this.selectedIndex;
			$.ajax(
			{
				"url" : "/HwangDangFleamarket/product/sellerSubIndustry.go",
				"type" : "POST",
				"data" : "categoryIdRef=" + $("#sellerIndustry").val(),
				"dataType" : "JSON",
				"beforeSend" : function()
				{
					if(idx == 0)
					{
						$("#sellerSubIndustry").empty().append("<option>소분류</option>");
						return false;
					}
				},
				"success" : function(json)
				{
					$("#sellerSubIndustry").empty()
					for(var i = 0; i < json.length; i++)
					{
						$("#sellerSubIndustry").append("<option>" + json[i].categoryName + "</option>");
					}
				},
				"error" : error
			});
		});
		
		$("#sameAddress").on("click", function()
		{
			//동일한 주소처리.
			if(this.checked)
			{
				//체크박스 선택했을 때.
				$("#sellerZipcode").val($("#memberZipcode").text());
				$("#sellerAddress").val($("#memberAddress").text());
				$("#sellerSubAddress").val($("#memberSubAddress").text());
			}
			else
			{
				$("#sellerZipcode").val("");
				$("#sellerAddress").val("");
				$("#sellerSubAddress").val("");
			}
		});
		
		$("#submits").on("click", function()
		{
			$("#sellerMainImageError").empty().hide();
			var fileName = document.getElementById("sellerMainImage").value
			if(!fileName)
			{
				$("#sellerMainImageError").append("사진을 등록해주세요.").show();
				return false;
			}
			var ext = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
			if(ext != "jpg" && ext != "png" && ext != "jpeg")
			{
				$("#sellerMainImageError").append("jpg, png, jpeg 파일만 등록 가능합니다.").show();
				return false;
			}
			
			//패스워드가널일경우.
			$("#passwordError1").empty().hide();
			if(!$("#password1").val())
			{
				$("#passwordError1").append("필수 입력사항입니다..").show();
				$("#password1").focus();
				return false;
			}
			
			//패스워드확인이 널일경우.
			$("#passwordError2").empty().hide();
			if(!$("#password2").val())
			{
				$("#passwordError2").append("필수 입력사항입니다..").show();
				$("#password2").focus();
				return false;
			}
			
			//상호명을 안적었을경우.
			$("#sellerStoreNameError").empty().hide();
			if(!$("#sellerStoreName").val())
			{
				$("#sellerStoreNameError").append("필수 입력사항입니다.").show();
				$("#sellerStoreName").focus();
				return false;
			}
			
			//업종 미선택시
			$("#sellerIndustryError").empty().hide();
			if($("#sellerIndustry").val() == "대분류")
			{
				$("#sellerIndustryError").append("필수 입력사항입니다.").show();
				$("#sellerIndustry").focus();
				return false;
			}
			
			//주소미입력
			$("#addressError").empty().hide();
			if(!$("#sellerZipcode").val() || !$("#sellerAddress").val() || !$("#sellerSubAddress").val())
			{
				$("#addressError").append("필수 입력사항입니다.").show();
				return false;
			}
			
			//소개 미입력.
			$("#sellerIntroductionError").empty().hide();
			if(!$("#sellerIntroduction").val())
			{
				$("#sellerIntroductionError").append("필수 입력사항입니다.").show();
				$("#sellerIntroduction").focus();
				return false;
			}
		});
		
		function error(xhr, status, err)
		{
			alert(status+", "+xhr.readyState+" "+err);
		};
	});
</script>
<style type="text/css">
	.registerError
	{
		display: none;
	}
	table
	{
		width: 
	}
</style>
<h2 class="page-header store_look_around">황당 플리마켓 판매자 신청</h2>
<div style="margin-left: 60px; position:relative; top: -50px;">
	<form method="POST" enctype="multipart/form-data" action="/HwangDangFleamarket/member/sellerRegisterRequest.go" class="form-seller" name="sellerForm">
		<table id="table" width='600' class="table table-striped">
			<tr class="trInput">
				<th class='tdName'>아이디</th>
				<td colspan="2"><input type="text" name="memberId" value="${ sessionScope.login_info.memberId }" readonly="readonly"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>패스워드</th>
				<td colspan="2"><input type="password" id="password1" name="memberPassword1"></td>
			</tr>
			<tr>
				<td colspan="2" id="passwordError1" class="registerError, error-message"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>패스워드 확인</th>
				<td colspan="2"><input type="password" id="password2" name="memberPassword2"></td>
			</tr>
			<tr>
				<td colspan="2" id="passwordError2" class="registerError error-message"></td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>이름</th>
				<td colspan="2">${ sessionScope.login_info.memberName }</td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>전화번호</th>
				<td colspan="2">${ sessionScope.login_info.memberPhone }</td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>주소</th>
				<td width="45px" id="memberZipcode">${ sessionScope.login_info.memberZipcode }</td>
				<td id="memberAddress">${ sessionScope.login_info.memberAddress }</td>
			</tr>
			<tr>
				<td colspan="2" id="memberSubAddress">${ sessionScope.login_info.memberSubAddress }</td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>상호명</th>
				<td colspan="2"><input type="text" name="sellerStoreName" id="sellerStoreName" size="20" placeholder="3글자 이상 20자 이하"></td>
			</tr>
			<tr>
				<td colspan="2" id="sellerStoreNameError" class="registerError error-message"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>사업자 번호</th>
				<td colspan="2"><input type="number" name="sellerTaxId" id="sellerTaxId" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" id="sellerTaxIdError" class="registerError error-message"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>업종</th>
				<td>
					<select name="sellerIndustry" id="sellerIndustry">
						<option>대분류</option>
						<lee:forEach items="${ requestScope.firstCategory }" var="first">
							<option>${ first.categoryName }</option>
						</lee:forEach>
					</select>
				</td>
				<td>
					<select name="sellerSubIndustry" id="sellerSubIndustry">
						<option>소분류</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="sellerIndustryError" class="registerError error-message"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="4" class='tdName'>매장 주소</th>
				<td colspan="2" align="right">위의 주소와 동일<input type="checkbox" id="sameAddress"></td>
			</tr>
			<tr>
				<td>
					<input type="text" name="sellerZipcode" id="sellerZipcode" size="8" readonly="readonly">
				</td>
				<td>
					<input type="text" name="sellerAddress" id="sellerAddress" size="13" readonly="readonly">
					<input style="width: 195px;" id="button" type="button" value="우편번호검색" onclick="window.open('/HwangDangFleamarket/member/findSellerAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="sellerSubAddress" id="sellerSubAddress" size="43"></td>
			</tr>
			<tr>
				<td colspan="2" id="addressError error-message"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>사진 등록</th>
				<td colspan="2"><input type="file" name="sellerMainImage" id="sellerMainImage"></td>
			</tr>
			<tr>
				<td colspan="2" id="sellerMainImageError" class="registerError error-message"></td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>판매 물품 1</th>
				<td colspan="2"><input type="text" name="sellerProduct1"></td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>판매 물품 2</th>
				<td colspan="2"><input type="text" name="sellerProduct2"></td>
			</tr>
			<tr class="trInput">
				<th class='tdName'>판매 물품 3</th>
				<td colspan="2"><input type="text" name="sellerProduct3"></td>
			</tr>
			<tr class="trInput">
				<th rowspan="2" class='tdName'>스토어 소개글</th>
				<td colspan="2"><textarea id="sellerIntroduction" name="sellerIntroduction" cols="45" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input class="btn btn-lg btn-success btn-block"  type="submit" value="등록하기" id="submits">
					<input class="btn btn-lg btn-primary btn-block"  type="reset" value="다시입력">
				</td>
			</tr>
			<tr>
				<td colspan="2" id="sellerIntroductionError error-message"></td>
			</tr>
		</table>
	</form>
</div>