<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    	<meta name="description" content="">
    	<meta name="author" content="">
    	<link rel="icon" href="../../favicon.ico">
    	<title>주소 찾기</title>
		<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/template.css">
    	<!-- Bootstrap core CSS -->
    	<link href="/HwangDangFleamarket/css/bootstrap.min.css" rel="stylesheet">
    	<!-- Custom styles for this template -->
    	<link href="/HwangDangFleamarket/styles/dashboard.css" rel="stylesheet">
    	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    	<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
    	<script src="/HwangDangFleamarket/js/bootstrap.min.js"></script>
    	<script src="/HwangDangFleamarket/js/vendor/holder.js"></script>
		<script type="text/javascript">
			$(document).ready(function()
			{
				$("#write").on("click", function()
				{
					var idx = $("select option:selected").val();
					if($("select option:selected").val() == 'nope')
					{
						alert("주소를 입력해 주세요.");
						return false;
					}
					else
					{
						var address = $("select option:selected").val().split(",");
						opener.document.buyForm.ordersZipcode.value = address[0];
						opener.document.buyForm.ordersAddress.value = address[1];
						opener.document.buyForm.ordersSubAddress.value = "";
						opener.document.buyForm.ordersSubAddress.focus();
						window.close();
					}
				});
				$("#findDong").on("click", function()
				{
					if(!$("#dong").val())
					{
						alert("지역을 입력해주세요.");
						$("#dong").focus();
						$("select").empty().append("<option value='nope'>지역을 검색해주세요.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>");
						return false;
					}
					$.ajax(
					{
						"url" : "/HwangDangFleamarket/member/findZipcode.go",
						"type" : "POST",
						"data" : "dong=" + $("#dong").val(),
						"dataType" : "JSON",
						"beforeSend" : function()
						{
							$("select").empty().append("<option value='nope'>지역을 검색해주세요.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>");
						},
						"success" : function(json)
						{
							if(json.length != 0)
							{
								$("select").empty();
								for(var i = 0; i < json.length; i++)
								{
									if(json[i].bunji)
									{
										$("select").append("<option>" + json[i].zipcode + "," + json[i].sido + " " + json[i].gugun + " " + json[i].dong 
										+ " " + json[i].bunji + "</option>");
									}
									else
									{
										$("select").append("<option>" + json[i].zipcode + "," + json[i].sido + " " + json[i].gugun + " " + json[i].dong 
												+ " " +"</option>");
									}
								}
							}
							else
							{
								$("select").empty().append("<option value='nope'>검색된 지역이 없습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>");
								return false;
							}
						},		
						"error" : function()
						{
						}
					});
				});
				
				
			});
		</script>
	</head>

	<body leftmargin="0" topmargin="0">
		<form class="form-post" name="form" id="form" method="POST" action="#">
			<div align="center">
				<h2 class="page-header" align="center">우편번호 검색</h2>
				<p align="center">
					찾으시는 지역의 동/읍/면을 입력해주세요.<br>
					예) 강남구 청담동일 경우 "청담"만 입력하시면 됩니다.
				</p>
				<div style="margin:20px 20px 0px 20px;">
				지&nbsp;역&nbsp;&nbsp;<input type="text" id="dong"><input type="button" value="검색" id="findDong">
				</div>
				<div style="margin:30px 20px 30px 20px;">
					<select name="address">
						<option value='nope'>
							지역을 검색해주세요.
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</option>
					</select>
				</div>
				<div align="right" style="margin-right: 50px; margin-top: 50px;">
					<input class="btn btn-lg btn-success btn-block" type="button" value="입력하기" id="write">
				</div>
			</div>	
			<input type="text" id="zipcode" class="addresses"><input type="text" id="address" class="addresses">
		</form>
	</body>
</html>