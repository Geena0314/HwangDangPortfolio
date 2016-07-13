<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
		<script type="text/javascript">
		if('${requestScope.result}' == 1)
			alert("환불신청이 완료되었습니다.");
		else
			alert("환불신청에 실패했습니다.");
		
			opener.parent.location.reload();
			window.close();
		</script>
	</head>

	<body>
		
	</body>
</html>