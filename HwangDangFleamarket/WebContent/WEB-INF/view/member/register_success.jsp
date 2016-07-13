<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(document).keydown(function(e){   
	    if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){       
	        if(e.keyCode === 8){   
	       		return false;
	        }
	    }
	});
</script>

<h1 align="center">회원가입이 정상적으로 처리되었습니다.</h1>