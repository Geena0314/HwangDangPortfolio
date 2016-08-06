<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			if('${requestScope.location}')
			{
				opener.parent.location.href = "${requestScope.location}";
				window.close();
			}
			else
			{
				opener.parent.location.reload();
				window.close();
			}
		</script>
	</head>

	<body>
		
	</body>
</html>