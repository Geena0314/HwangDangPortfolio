<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>황당마켓</title>
	<link type="text/css" rel="stylesheet" href="/HwangDangFleamarket/styles/template.css">
    <!-- Bootstrap core CSS -->
    <link href="/HwangDangFleamarket/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/HwangDangFleamarket/styles/dashboard.css" rel="stylesheet">
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script type="text/javascript" src="/HwangDangFleamarket/scripts/jquery.js"></script>
    <script src="/HwangDangFleamarket/js/bootstrap.min.js"></script>
    <script src="/HwangDangFleamarket/js/vendor/holder.js"></script>
</head>
<body>
	<div class="body-block">
		<div class="container-fluid home-header">
			<header>
				<tiles:insertAttribute name="header"/> <!-- name 속성에 put-attribute 태그의 name 속성값을 호출 -->
			</header>
			
		    <%-- <div class="row">
				<tiles:insertAttribute name="nav"/>
			</div>  --%>
			
			<div id='content' class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">	
				<tiles:insertAttribute name="body"/>
			</div>
		</div>
	
		<header>
			<tiles:insertAttribute name="header"/> <!-- name 속성에 put-attribute 태그의 name 속성값을 호출 -->
		</header>
		
		<div>
			<footer class="blog-footer">
		 		<div class="container main-footer">
					<tiles:insertAttribute name="footer"/>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>


