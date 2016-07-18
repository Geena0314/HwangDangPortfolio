<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='lee' uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#memberZipcode").on("click", function()
		{
			window.open('/HwangDangFleamarket/member/findAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');
		});
		$("#selectEmail").on("change", function()
		{
			var index = this.selectedIndex;
			if(index == 0)
			{
				$("#domain").empty().hide();
				return false;
			}
			else if(index == 16)
			{
				$("#domain").val("").removeAttr("readonly").show();
				return false;
			}
			else
			{
				$("#domain").empty().val($("#selectEmail option:selected").val()).hide();
				return true;
			}
		});
		
		$("#password2").on("blur", function()
		{
			//패스워드를 입력하지않고 패스워드 확인창 클릭시.
			if(!$("#memberPassword").val())
			{
				alert("위의 패스워드를 먼저 입력하세요.");
				$("#memberPassword").focus();
				return false;
			}
			else
			{
				//패스워드는 맞고 패스워드확인창 입력 후
				if($("#memberPassword").val() == $("#password2").val())
				{
					//패스워드가 모두 일치할 때.
					return true;
				}
				else
				{
					//패스워드 확인이 틀릴경우.
					alert("패스워드가 일치하지 않습니다.")
					$("#password2").val("");
				}
			}
		});
		
		//submit 클릭시.
		$("#submit").on("click", function()
		{
			var result;
			if(!$("#memberId").val() || $("#memberId").val().trim().length < 6 || $("#memberId").val().trim().length > 12)
			{
				alert("id는 6글자 이상, 12글자 이하로 입력해 주세요.");
				$("#memberId").val("").focus();
				return false;
			}

			if($("#selectEmail option:selected").index() == 0 || !$("#domain").val())
			{
				alert("이메일을 선택 또는 입력해 주세요.");
				$("#selectEmail option:selected").removeAttr('selected');
				$("#selectEmail option:eq(0)").attr('selected', 'true');
				$("#domain").val("");
				return false;
			}
				
			if($("#memberPassword").val().trim().length < 8 || $("#memberPassword").val().trim().length > 20)
			{
				alert("패스워드는 8자 이상 20자 이하로 입력해 주세요.");
				$("#memberPassword").val("").focus();
				return false;
			}
			
			if($("#memberName").val().trim().length < 2 || $("#memberName").val().trim().length > 6)
			{
				alert("이름은 2자이상 6자 이하로 입력해 주세요.");
				$("#memberName").val("").focus();
				return false;
			}
			
			if($("#hp2").val().trim().length < 3 || $("#hp2").val().trim().length > 4 || $("#hp3").val().trim().length != 4)
			{
				alert("전화번호를 올바르게 입력해 주세요.")
				$("#hp2").val("").focus();
				$("#hp3").val("");
				return false;
			}
			
			if(!$("#memberZipcode").val())
			{
				alert("주소를 검색해 주세요.");
				return false;
			}
			if($("#memberSubAddress").val().trim().length < 4 || $("#memberSubAddress").val().trim().length > 30)
			{
				alert("세부 주소는 4자 이상 30자 이하로 입력해 주세요.");
				$("#memberSubAddress").val("").focus();
				return false;
			}
			var id = $("#memberId").val()+"@"+$("#domain").val();
			$.ajax(
			{
				"url" : "/HwangDangFleamarket/member/registerIdCheck.go",
				"type" : "POST",
				"data" : "memberId=" + id,
				"dataType" : "text",
				"async" : false,
				"beforeSend" : function()
				{
					
				},
				"success" : function(text)
				{
					if(text == "fail")
					{
						alert("중복된 ID입니다.");
						$("#memberId").val("").focus();
						r = false;
						return false;
					}
					else
					{
						r = true;
					}
				},
				"error" : function()
				{
					
				}
			});
			return r;
		});
	});
	function idCheck(obj)
	{
		 //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
        || event.keyCode == 46 ) return;
        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        obj.value = obj.value.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]/gi, '');
	}
	
	function nameCheck(obj)
	{
		 //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
        || event.keyCode == 46 ) return;
        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        obj.value = obj.value.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]/gi, '');
	}
</script>
<style type="text/css">
	#domain
	{
		display: none;
	}
</style>
<form method="post" action="/HwangDangFleamarket/member/registerresult.go" name="register" id="registerForm">
<h2 class="page-header">황당 플리마켓 회원가입</h2>
<div class="table-responsive" >
	<table width='600' class="table table-striped">
		<tr class="trInput">
			<td width='150' class='tdName'>I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D</td>
			<td>
				<input type="text" name="memberId" size=13 id="memberId" onkeydown="idCheck(this);">
				@
				<input type="text" name="domain" id="domain" size=13 readonly="readonly">
				<select id="selectEmail">
					<option>이메일을 선택하세요.</option>
					<lee:forEach items="${requestScope.emailList}" var="email">
						<option>${ email.codeName }</option>
					</lee:forEach>
					<option>직접입력</option>
				</select>
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>Password</td>
			<td>
				<input type="password" name="memberPassword" size="20" id="memberPassword">
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>Password1</td>
			<td>
				<input type="password" name="password2" size="20" id="password2">
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
			<td>
				<input type="text" name="memberName" size="20" id="memberName" onkeydown="nameCheck(this);">
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>전화번호</td>
			<td>
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
			</td>
		</tr>
		<tr class="trInput">
			<td class='tdName'>우편번호</td>
			<td>
				<input type="text" name="memberZipcode" size="30" readonly="readonly" id="memberZipcode">
				<input class="btn btn-default" type="button" value="주소검색" id="findAddress" onclick="window.open('/HwangDangFleamarket/member/findAddress.go', '주소검색', 'resizable=no scrollbars=yes width=700 height=500 left=500 top=200');">
			</td>
		</tr>
		<tr class="trInput">
			<td align='center'> 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 </td>
			<td>
				<input type="text" name="memberAddress" size="60" readonly="readonly" id="memberAddress">
				<br>
				<input type="text" name="memberSubAddress" size="60" id="memberSubAddress">
			</td>
		</tr>
		<tr class="trInput">
			<td colspan="2" align="left">
				<input class="btn btn-lg btn-success btn-block" type="submit" value="가입" id="submit">
				<input class="btn btn-lg btn-primary btn-block" type="reset" value="다시 작성">
			</td>
		</tr>
	</table> 
</div>
</form>