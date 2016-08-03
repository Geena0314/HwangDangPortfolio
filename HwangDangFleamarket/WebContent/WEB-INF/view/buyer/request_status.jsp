<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"  %>
<style type="text/css">
div.myorder-tabs{
   float: left;
   position: relative;
   left: 16%;
   top: -20px;
   margin: 0px 20px 20px 20px;
   padding: 20px 20px 20px 20px;
   max-width: 850px;
}
ul{
   display: block;
   list-style: none;
   margin: 10px;
}
div.myorder-tabs li#list_block{
   float: left;
   overflow: hidden;
   position: relative;
   height: 180px;
   min-width: 800px;
   padding: 15px 15px 15px 15px;
}
li{
   display: list-item;
   margin: 10px;
}

div{
   display: block;
}
.thmb{
   float: left;
   width: 150px;
   height: 150px;
}
.product_info{
   float: left;
   width: 400px;
   height: 150px;
   border-right: 2px solid lightgray;
}
.status{
   float: left;
   width: 150px;
   height: 150px;
}
p{
   clear: both;
}
b{
   font-size: 15pt;
}
img{
   width: 150px;
   height: 150px;
}
.product_img{
   border-radius: 10px;
   overflow: hidden;
}
ul.btns{
	margin: 0px;
}
</style>
<div class="myorder-container">
	<h2 class="page-header store_look_around">나의주문 - 교환/환불/취소 현황</h2>
	
	<div class="myorder-tabs">
		<!-- 네비게이션 바Area -->
		<ul class="nav nav-tabs">       
		 	<li role="presentation" class="active"><a href="/HwangDangFleamarket/order/diliveryStatus.go?page=1">배송 현황</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/myorder/success.go">구매 확정</a></li>
		  	<li role="presentation"><a href="/HwangDangFleamarket/order/requestStatus.go?page=1">교환/환불/취소</a></li>
		 </ul>
		 
	</div>
</div>