<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="lee" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).keydown(function(e){   
	    if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){       
	        if(e.keyCode == 8){   
	       		return false;
	        }
	    }
	});
</script>
<h1 align="center">${ requestScope.result }</h1>