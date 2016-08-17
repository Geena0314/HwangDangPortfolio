package com.hwangdang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.service.OrderService;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.RefundRequest;
import com.hwangdang.vo.Seller;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService service;
	
	public OrderController() {
		// TODO Auto-generated constructor stub
	}
	
	//배송 현황 조회
	@RequestMapping("/diliveryStatus")
	public ModelAndView diliveryStatus(HttpSession session, int page){
		return new ModelAndView("buyer/myorder_main.tiles", 
				service.selectDiliveryStatus(((Member)session.getAttribute("login_info")).getMemberId(), page));
	}
	
	//교환,환불,취소 현황 조회
	@RequestMapping("/requestStatus")
	public ModelAndView requestStatus(HttpSession session, int page){
		return new ModelAndView("buyer/request_status.tiles",
				service.selectRequestStatus(((Member)session.getAttribute("login_info")).getMemberId(), page));
	}
	
	//구매 확정
	@RequestMapping("/purchaseConfirm")
	public ModelAndView purchaseConfirm(HttpSession session, int page){
		return new ModelAndView("buyer/purchase_confirm.tiles",
				service.selectPurchaseConfirm(((Member)session.getAttribute("login_info")).getMemberId(), page));
	}
	
	//구매 취소
	@RequestMapping("/orderCancel")
	public String orderCancel(int orderSeqNo){
		service.updateCancelOrderProductStatus(orderSeqNo);
		return "/order/requestStatus.go?page=1";
	}
	
	//구매 확정
	@RequestMapping("/goPurchaseConfirm")
	public String purchaseConfirm(int orderSeqNo){
		service.updateConfirmOrderProductStatus(orderSeqNo);
		return "/order/purchaseConfirm.go?page=1";
	}
	
	//교환신청폼으로 이동
	@RequestMapping("/exchangeForm")
	public ModelAndView exchangeForm(int orderSeqNo)
	{
		return new ModelAndView("/WEB-INF/view/buyer/exchange_form.jsp", service.orderProductProductOption(orderSeqNo));
	}
	
	//교환신청 내용 DB에 저장, OrderProduct 상태변경
	@RequestMapping("/exchangeSuccess")
	public String exchangeSuccessForm(ExchangeRequest exchange, HttpServletRequest request)
	{
		int result = service.insertRequestExchange(exchange);
		if(result  == 1)
		{
			request.setAttribute("result", 1);
			return "/WEB-INF/view/buyer/exchange_success.jsp";
		}
		else
		{
			return "/WEB-INF/view/buyer/exchange_success.jsp";
		}
	}
	
	//환불신청폼으로 이동
	@RequestMapping("/refundForm")
	public String refundRegisterForm()
	{
		return "/WEB-INF/view/buyer/refund_form.jsp";
	}
	
	@RequestMapping("/refundSuccess")
	public String refundSuccessForm(RefundRequest refund, HttpServletRequest request)
	{
		int result = service.insertRefundRequest(refund);
		if(result  == 1)
		{
			request.setAttribute("result", 1);
			return "/WEB-INF/view/buyer/refund_success.jsp";
		}
		else
		{
			return "/WEB-INF/view/buyer/refund_success.jsp";
		}
	}
	
	//주문상품 상태변경
	@RequestMapping("/orderStatusChange")
	public String orderStatusChange(int orderSeqNo, int orderProductStatus, int page, HttpSession session)
	{
		//주문상품 상태변경 로직호출
		service.updateOrderProductStatus234(orderSeqNo, orderProductStatus);
		
		int sellerStoreNo = ((Seller)session.getAttribute("seller")).getSellerStoreNo();
		return "/seller/salesStatus.go?page=" + page + "&sellerStoreNo=" + sellerStoreNo;
	}
}