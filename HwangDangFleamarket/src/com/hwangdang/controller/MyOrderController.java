package com.hwangdang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.OrderService;
import com.hwangdang.serviceimpl.MyOrderServiceImpl;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.RefundRequest;
import com.hwangdang.vo.Seller;

@Controller
@RequestMapping("/myorder")
public class MyOrderController {
	
	@Autowired
	MyOrderServiceImpl service;
	
	@Autowired
	OrderService orderService;
	
	public Map<String ,Integer > getTotalItemsParam(int num1 ,int num2 , int num3 , 
																	int num4 , int num5 ){
		Map<String ,Integer> param = new HashMap<>();
		param.put("value1", new Integer(num1));
		param.put("value2", new Integer(num2));
		param.put("value3", new Integer(num3));
		param.put("value4", new Integer(num4));
		param.put("value5", new Integer(num5));
		return param;
	}
	
	
	
	//나의주문 - 메인페이지 (배송현황 조회 ) 이동 
	@RequestMapping("/main.go") 
	public String goMainPage(String loginId , Model model , @RequestParam(value="page" ,defaultValue="1") int page ){
		
		Map<String ,Integer> param = getTotalItemsParam(0, 1, 2, 3, 4);
		PagingBean pagingBean = new PagingBean(service.getOrdersTotalItems(param), page); 
		
		if(page > pagingBean.getEndPage()){
			//System.out.println("페이지1로 돌아가야한다.");
			page = 1;
		}
		List<Orders> orderList =  service.getOrdersMain(loginId , page);
		/*for(Orders temp : orderList){
			System.out.println("temp:"+temp);     
		}*/
		
		model.addAttribute("orderList" ,orderList); 
		model.addAttribute("pagingBean" , pagingBean);
		return "myorder/myorder_main.tiles";  
	}
	
	//나의주문- 배송완료 페이지이동 
	@RequestMapping("/success.go")
	public String goDeriveryPage(String loginId , Model model , @RequestParam(value="page" ,defaultValue="1") int page ){
		
		Map<String ,Integer> param = getTotalItemsParam(10,10,10,10,10);
		PagingBean pagingBean = new PagingBean(service.getOrdersTotalItems(param), page); 
		if(page > pagingBean.getEndPage()){
			page = 1;
		}
		List<Orders> orderList =  service.getOrdersSuccess(loginId, page);
		/*for(Orders temp : orderList){
			System.out.println(temp.toString());
		}*/ 
		model.addAttribute("orderList" ,orderList); 
		model.addAttribute("pagingBean" , pagingBean);
		
		return "myorder/myorder_success.tiles";  
	}
	
	// 주문취소 ,환불 , 교환 페이지 이동 
	@RequestMapping("/cancel.go")
	public String goCancelPage(String loginId , Model model , @RequestParam(value="page" ,defaultValue="1") int page ){
		
		// 전체피이지수 ,  보고픈  page번호   : 디폴트 1  
		Map<String ,Integer> param = getTotalItemsParam(5, 6, 7, 8, 9);
		PagingBean pagingBean = new PagingBean(service.getOrdersTotalItems(param), page); 
		if(page > pagingBean.getEndPage()){
			page = 1;
		}
		//리스트 조회 로직 
		List<Orders> orderList =  service.getOrdersCancel(loginId , page);
		model.addAttribute("orderList" ,orderList); 
		model.addAttribute("pagingBean" , pagingBean);
		
		return "myorder/myorder_cancel.tiles";  
	}
	
	//체크박스 list  콤마 split 메소드 
	public ArrayList<String> listSplit(String str){
		String array[] = str.split(",");
		ArrayList<String> list = new ArrayList<>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		return list;
	}
	
	//주문취소 로직수행
	//0:입금대기중 ,1:결제완료 , 2:배송준비중 삭제   
	@RequestMapping("/orderCancelList.go") 
	public String orderCancelList(String orderCancelList , String loginId , int status , 
		@RequestParam(value="page" ,defaultValue="1") int page ){
		//System.out.println(orderCancelList);
		ArrayList<String> param  = listSplit(orderCancelList);
		service.setOrderStatus(param,status);
		return "redirect:/myorder/main.go?loginId="+loginId+"&page="+page;
	}
	
	//구매확정 
	@RequestMapping("/orderStatusChange.go") 
	public String orderStatus10(String orderList ,String loginId , int status){
		
		/*System.out.println("구매확정 : "+ orderList);
		System.out.println("status: "+status); */
		String url = "";
		ArrayList<String> param  = listSplit(orderList);   
		int flag = service.setOrderStatus(param , status);  
		if(status != 10 && flag == 1 ){
			// 6:환불신청 status //5: 교환신청status
			url = "redirect:/myorder/cancel.go?loginId="+loginId;
		}else{
			//10:구매확정
			url = "redirect:/myorder/success.go?loginId="+loginId;
		}
		
		return url;
	}  
	
	//셀러 세부정보 조회 ajax
	@RequestMapping("/SellerDetail.go") 
	@ResponseBody
	public Seller orderStatusRefund(String  sellerName ,String loginId ){
		//System.out.println("sellerName:"+sellerName + "loginId:"+loginId);
		return service.getSellerDetailBySellerName(sellerName);
	}  
	
	//교환신청시 교환폼 띄우기 
	@RequestMapping("/exchangeRequestFormMove.go") 
	public String exchangeRequestFormMove(){
		return "/WEB-INF/view/myorder/myorder_exchange_form.jsp";
	}  
	
	//교환신청 내용 DB에 저장 
	@RequestMapping("/exchangeRequest.go")
	public String exchangeRequest(ExchangeRequest  exchange, HttpServletRequest request){
		
		//System.out.println(exchange);
		int flag = service.addExchageRequest(exchange);
		if(flag  == 1){
			request.setAttribute("result", 1);
			return "/WEB-INF/view/myorder/myorder_exchange_success.jsp";
		}else{
			return "/WEB-INF/view/myorder/myorder_exchange_success.jsp";
		}
	}
	
	@RequestMapping("/refundForm")
	public String refundRegisterForm()
	{
		return "/WEB-INF/view/myorder/myorder_refund_form.jsp";
	}
	
	@RequestMapping("/refundSuccess")
	public String refundSuccessForm(RefundRequest refund, HttpServletRequest request)
	{
		int result = orderService.insertRefundRequest(refund);
		if(result  == 1)
		{
			request.setAttribute("result", 1);
			return "/WEB-INF/view/myorder/myorder_refund_success.jsp";
		}
		else
		{
			return "/WEB-INF/view/myorder/myorder_refund_success.jsp";
		}
	}
	
	
	
	
}