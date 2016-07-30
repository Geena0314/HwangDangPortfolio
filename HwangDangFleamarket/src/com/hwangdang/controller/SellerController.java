package com.hwangdang.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.OrderService;
import com.hwangdang.service.SellerService;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.ProductOption;
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
		for(int i = 0; i < 12; i++)
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
					status.add("교환승인");
					break;
				case 9 :
					status.add("환불승인");
					break;
				case 10 : 
					status.add("구매확정");
					break;
				case 11 : 
					status.add("교환거부");
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
		return new ModelAndView("/WEB-INF/view/seller/seller_refund_check.jsp", service.selectOrderAndRefund(ordersNo, orderSeqNo));
	}
	
	@RequestMapping("/refundHandle")
	public String refundHandle(int orderSeqNo)
	{
		orderService.refundHandle(orderSeqNo);
		return "/WEB-INF/view/seller/refund_success.jsp";
	}
	
	//교환 신청 확인
	@RequestMapping("/sellerExchangeCheck")
	public ModelAndView sellerExchangeCheck(String ordersNo, int orderSeqNo)
	{
		return new ModelAndView("/WEB-INF/view/seller/seller_exchange_check.jsp", service.selectOrderAndExchange(ordersNo, orderSeqNo));
	}
	
	//교환 신청 거부
	@RequestMapping("/exchangeReject")
	public String exchangeReject(int orderSeqNo)
	{
		orderService.deleteExchangeRequest(orderSeqNo);
		return "/WEB-INF/view/seller/seller_exchange_reject.jsp";
	}
	
	//교환 신청 승인
	@RequestMapping("/exchangeHandle")
	public String exchangeHandle(int orderSeqNo, String exchangeCharge)
	{
		if(!exchangeCharge.equals(""))
		{
			if(exchangeCharge.indexOf("-") == 0)
			{
				int endIdx = exchangeCharge.indexOf("원");
				int mileage = Integer.parseInt(exchangeCharge.substring(1, endIdx));
				orderService.updateMileage(orderSeqNo, mileage);
			}
		}
		orderService.exchangeHandle(orderSeqNo);
		return "/WEB-INF/view/seller/seller_exchange_recognize.jsp";
	}
	
	@RequestMapping("/sellerWithdrawal")
	public String sellerWithdrawal(HttpSession session){
		Seller seller =  ((Seller)session.getAttribute("seller"));
		session.removeAttribute("seller"); //session에 seller란 이름으로 등록된 정보를 지움
		session.removeAttribute("sellerRegister");
		service.deleteSeller(seller.getSellerStoreNo(), seller.getMemberId());
		return "redirect:/seller/sellerWithdrawalSuccess.go";
	}
	
	@RequestMapping("/sellerWithdrawalSuccess")
	public String sellerWithdrawalSuccess(){
		return "member/mypage.tiles";
	}
}