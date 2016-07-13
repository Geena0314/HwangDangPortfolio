<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>


function showAddress(zipcode ,address){
	
	//alert(zipcode + " , " +address);
	opener.document.buy_form.zipcode.value = zipcode;
    opener.document.buy_form.address1.value = address;
    
    // if(confirm("창을 닫겠습니까?")){
    	window.close(); 
    //} */
}

	$(document).ready(function(){
		
 		$("#btn").click(function(){
 			 
 			$("#result").show();
 			
 		});
	});
</script>
</head>

<body>
	<h4>주소 찾기(zip code finder)</h4>
	도로명 주소 <input type="radio" name="method" id="method1" checked="checked" />
	지번 주소 <input type="radio" name="method" id="method2" /><br/>
	<font color="gray" size="0.6em">	
		검색방법 : 시/도 및 시/군/구 선택 후 도로명과 건물번호 입력
		예) 테헤란로(도로명) + 152 (건물번호)
		* 도로명 주소가 검색되지 않는 경우는 행정안전부 새주소안내시스템
		(http://www.juso.go.kr) 에서 확인하시기 바랍니다.</font><br/><br/>
	
	시도<select name="sido" id="sido">
			<option>---지역---</option>
			<option>서울특별시</option>
			<option>성남시</option>
			<option>수원시</option>
		</select>
	시군구<select name="sigungu" id="sigungu">
			<option>---시/군/구선택---</option>
			<option>분당구</option>
			<option>팔달구</option>
			<option>강남구</option>
		</select><br/>
			
	도로명 주소 입력 : <input type="text" name="doroName" id="doroName" /><br/>
	건물번호 입력 :  <input type="text" name="buildingNumber" id="buildingNumber" /><br/>
	<input type="button" id="btn" value="주소입력"/>
	
	<div id="result" hidden="true">
		<a href="javascript:showAddress('111-222','경기도 성남시 분당구 삼평동');">111-222 경기도 성남시 분당구 삼평동</a><br>
		<a href="javascript:showAddress('111-333','경상남도 진주시 삼평동');">111-333 경상남도 진주시 삼평동</a><br>
		<a href="javascript:showAddress('222-333','전라북도 전주시 삼평동');">222-333 전라북도 전주시 삼평동</a><p>
	</div>
	
</body>
</html>