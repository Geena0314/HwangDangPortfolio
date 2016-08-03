<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		//alert("asdf"+'${requestScope.location}');
			/* if('${requestScope.location}')
			{
				alert('${requestScope.location}');
				//opener.parent.location = '${requestScope.location}';
				opener.location.href = '${requestScope.location}';
				window.close();
				return false;
			} */
			opener.parent.location.reload();
			window.close();
		</script>
	</head>

	<body>
		
	</body>
</html>