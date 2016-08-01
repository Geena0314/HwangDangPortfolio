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
	
	@RequestMapping("/diliveryStatus")
	public ModelAndView diliveryStatus(HttpSession session){
		return new ModelAndView("buyer/myorder_main.tiles", 
				service.selectDiliveryStatus(((Member)session.getAttribute("login_info")).getMemberId()));
	}
}
