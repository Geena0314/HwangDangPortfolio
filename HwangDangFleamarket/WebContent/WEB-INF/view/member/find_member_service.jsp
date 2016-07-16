<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix='lee' uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#findMemberId").on("click", function()
		{
			var phoneNumber = $("#memberPhone1").val() + "-" + $("#memberPhone2").val() + "-" + $("#memberPhone3").val();
			if($("#memberName").val().trim().length < 2 || $("#memberName").val().trim().length > 6)
			{
				$("#memberName").val("");
				$("#memberName").focus();
				alert("이름을 정확히 입력해 주세요.");
				return false;
			}
			if($("#memberPhone2").val().trim().length < 3 || $("#memberPhone2").val().trim().length > 4 || $("#memberPhone3").val().trim().length != 4)
			{
				$("#memberPhone").val("");
				$("#memberPhone").focus();
				alert("전화번호를 정확히 입력해 주세요.");
				return false;
			}
			
			$.ajax(
			{
				"url" : "/HwangDangFleamarket/member/findMemberId.go",
				"type" : "POST",
				"data" : {"memberName" : $("#memberName").val(), "memberPhone" : phoneNumber},
				"dataType" : "text",
				"success" : function(text)
				{
					if(text)
					{
						$("#id").text(text);
					}
					else
					{
						$("#id").text("회원이 존재하지 않습니다.");
					}
				},		
				"error" : function()
				{
				}
			});
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
		
		$("#findMemberPassword").on("click", function()
		{
			var id = $("#memberId").val()+"@"+$("#domain").val();
			if($("#selectEmail option:selected").index() == 0 || !$("#domain").val())
			{
				alert("이메일을 선택 또는 입력해 주세요.");
				$("#selectEmail option:selected").removeAttr('selected');
				$("#selectEmail option:eq(0)").attr('selected', 'true');
				$("#domain").val("");
				return false;
			}
			
			if(!$("#memberId").val() || $("#memberId").val().trim().length < 6 || $("#memberId").val().trim().length > 12)
			{
				alert("id는 6글자 이상, 12글자 이하로 입력해 주세요.");
				$("#memberId").val("").focus();
				return false;
			}
			
			$.ajax(
			{
				"url" : "/HwangDangFleamarket/member/findMemberPassword.go",
				"type" : "POST",
				"data" : {"memberId" : id},
				"dataType" : "text",
				"success" : function(text)
				{
					if(text)
					{
						$("#password").text(text);
					}
					else
					{
						$("#password").text("존재하지 않는 아이디 입니다.");
					}
				},		
				"error" : function()
				{
				}
			});
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
</script>
<style type="text/css">
	#domain
	{
		display: none;
	}
</style>
<div style="float: left; width: 40%; height: 500px; border-right: 2px solid #63439d; position: relative; left: 12%; padding-top: 200px;">
	이름 : <input type="text" id="memberName"><br>
	전화번호 : 	<select id="memberPhone1">
		    	        <option>010</option>
		    	        <option>011</option>
		    	        <option>016</option>
		    	        <option>017</option>
		            	<option>018</option>
						<option>019</option>
					</select>
	-<input type="text" id="memberPhone2">-<input type="text" id="memberPhone3">
	<input type="button" id="findMemberId" value="아이디찾기">
	<br><span id="id"></span>
</div>
<div style="float: right; width: 50%; padding-left: 100px; position: relative; top: 200px;">
	id : 	<input type="text" name="memberId" size=13 id="memberId" onkeydown="idCheck(this);">
		  	@
			<input type="text" name="domain" id="domain" size=13 readonly="readonly">
			<select id="selectEmail">
				<option>이메일을 선택하세요.</option>
				<lee:forEach items="${requestScope.emailList}" var="email">
					<option>${ email.codeName }</option>
				</lee:forEach>
				<option>직접입력</option>
			</select><br>
			<input type="button" id="findMemberPassword" value="비밀번호찾기">
			<span id="password"></span>
</div>