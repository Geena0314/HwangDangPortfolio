package com.hwangdang.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.OrderService;
import com.hwangdang.service.SellerService;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Seller;


@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerService service;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/sellerList")
	public ModelAndView sellerList(int page){
		HashMap map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.getCountSeller(), page);
		ArrayList list = (ArrayList)service.getAllSeller(page);
		map.put("list", list);
		map.put("pagingBean", pagingBean);
		return new ModelAndView("seller/seller_list.tiles", map);
	}
	
	@RequestMapping("/sellerStore")
	public ModelAndView sellerStore(int sellerStoreNo){
		Seller seller = service.getSellerBySellerStoreNo(sellerStoreNo);
		HashMap map = new HashMap<>();
		map.put("seller", seller);
		return new ModelAndView("seller/seller/seller_store_main.tiles", map);
	}
	
	@RequestMapping("/salesStatus")
	public ModelAndView salesStatus(int page, int sellerStoreNo)
	{
		HashMap<String, Object> map = service.selectOrderState(page, sellerStoreNo);
		ArrayList<Orders> orderList = (ArrayList<Orders>) map.get("orderList");
		ArrayList<String> status = new ArrayList<>();
		for(int i = 0; i < 11; i++)
		{
			switch(i)
			{
				case 0 :
					status.add("입금대기중");
					break;
				case 1 :
					status.add("결제완료");
					break;
				case 2 :
					status.add("배송준비중");
					break;
				case 3 :
					status.add("배송중");
					break;
				case 4 :
					status.add("배송완료");
					break;
				case 5 :
					status.add("교환신청");
					break;
				case 6 :
					status.add("환불신청");
					break;
				case 7 :
					status.add("구매취소");
					break;
				case 8 :
					status.add("교환승인처리");
					break;
				case 9 :
					status.add("환불승인처리");
					break;
				case 10 : 
					status.add("구매확정");
					break;
				default:
					break;
			}
		}
		map.put("status", status);
		return new ModelAndView("seller/seller_sales_status.tiles", map);
	}
	
	@RequestMapping("/sellerRefundCheck")
	public ModelAndView sellerRefundCheck(String ordersNo, int orderSeqNo)
	{
		System.out.println(orderSeqNo);
		return new ModelAndView("/WEB-INF/view/seller/seller_refund_check.jsp", service.selectOrderAndRefund(ordersNo, orderSeqNo));
	}
	
	@RequestMapping("/refundHandle")
	public String refundHandle(int orderSeqNo)
	{
		orderService.refundHandle(orderSeqNo);
		return "/WEB-INF/view/seller/refund_success.jsp";
	}
}