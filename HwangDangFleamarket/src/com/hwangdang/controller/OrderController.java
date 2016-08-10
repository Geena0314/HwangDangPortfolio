package com.hwangdang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.service.OrderService;
import com.hwangdang.vo.Member;

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
}