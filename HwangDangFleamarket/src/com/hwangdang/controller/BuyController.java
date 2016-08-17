package com.hwangdang.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.service.BuyService;
import com.hwangdang.service.CartService;
import com.hwangdang.service.MemberService;
import com.hwangdang.service.OrderService;
import com.hwangdang.service.ProductService;
import com.hwangdang.service.SellerService;
import com.hwangdang.vo.Cart;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	private BuyService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
 	//메인페이지 상품검색 기능 : 키워드로 상품이나 스토어 검색!
	@RequestMapping("/search")
	public ModelAndView findProductByKeyword(String searchCode, String keyword, int page)
	{
		HashMap<String, Object> map = new HashMap<>();
		if(keyword.equals(""))
		{
			return new ModelAndView("seller/seller/search_empty.tiles");
		}
		if(searchCode.equals("태그"))
		{
			//판매물품으로 판매자 조회해서 seller_list로
			map = sellerService.selectSearchSeller(keyword, page);
			return new ModelAndView("seller/seller_list.tiles", map);
		}
		else if(searchCode.equals("상품명"))
		{
			//상품 명으로 상품 조회해서 search_product_list로
			return new ModelAndView("seller/seller/search_product_list.tiles", productService.selectSearchProductByName(keyword, page));
		}
		else
		{
			//상품 id로 상품 조회해서 search_product_list로
			return new ModelAndView("seller/seller/search_product_list.tiles", productService.selectSearchProductById(keyword, page));
		}
	}
	
	//바로구매 버튼 클릭시 결제 폼으로 이동.
	@RequestMapping("/buyForm")
	public String buyForm(OrderProduct orderProduct, int totalPrice, Model model, HttpSession session)
	{
		//전화번호 split
		Member member = (Member)session.getAttribute("login_info");
		String[] phone = member.getMemberPhone().split("-");
		model.addAttribute("hp1", phone[1]);
		model.addAttribute("hp2", phone[2]);
		
		//product, productOption 각각의 id로 조회.
		model.addAttribute("detail", service.selectProductProductOption(orderProduct.getProductId(), orderProduct.getOptionId(), orderProduct.getSellerStoreNo()));
		model.addAttribute("orderProduct", orderProduct);
		model.addAttribute("totalPrice", totalPrice);
		
		//배송비 측정
		int deliveryPrice = 0;
		if(totalPrice > 30000)
			deliveryPrice = 2500;
		model.addAttribute("deliveryPrice", deliveryPrice);
		
		return "buyer/buy_form.tiles";
	}
	
	//장바구니에서 여러개상품 구매시
	@RequestMapping("/buyFormByCart")
	public String buyFormByCart(int[] cartNoList, Model model, HttpSession session)
	{
		//전화번호 split
		Member member = (Member)session.getAttribute("login_info");
		String[] phone = member.getMemberPhone().split("-");
		model.addAttribute("hp1", phone[1]);
		model.addAttribute("hp2", phone[2]);
		
		//cartNoList -> 구매하기위해 체크한 장바구니상품번호들
		List<Cart> cartList = service.selectCartByCartNo(cartNoList);

		int totalPrice = 0;
		int deliveryPrice = 0;
		ArrayList<Integer> sellerStoreNos = new ArrayList<>();
		
		if(cartList.size() == 1)
		{
			//cartList가 1개인 경우
			Cart cart = cartList.get(0);
			//총 주문 가격 측정
			totalPrice = (cart.getProductList().get(0).getProductPrice() 
					+ cart.getProductList().get(0).getProductOption().getOptionAddPrice())
					* cart.getCartProductAmount();
			
			//배송비 측정
			if(totalPrice < 30000)
			{
				deliveryPrice = 2500;
			}
			else
			{
				deliveryPrice = 0;
			}
			model.addAttribute("deliveryPrice", deliveryPrice);
		}
		else
		{	
			//cartList가 여러개인 경우(같은 스토어의 주문가격이 3만원을 넘으면 배송비 0원)
			for(int i = 0; i < cartList.size(); i++)
			{
				//비교할 cart
				Cart cart1 = cartList.get(i);
				totalPrice = totalPrice
						+ (cart1.getProductList().get(0).getProductPrice() 
						+ cart1.getProductList().get(0).getProductOption().getOptionAddPrice())
						* cart1.getCartProductAmount();
				
				for(int idx = 0; idx < sellerStoreNos.size(); idx++)
				{
					//이미 비교완료한 스토어인지 확인
					if(cart1.getProductList().get(0).getSellerStoreNo() == sellerStoreNos.get(idx))
						continue;
				}
				
				//같은 스토어상품의 가격을 더할 변수
				int sameStorePrice = 0;
				
				for(int j = i+1; j < cartList.size(); j++)
				{
					//비교당할 cart
					Cart cart2 = cartList.get(j);
					if(cart1.getProductList().get(0).getSellerStoreNo() == cart2.getProductList().get(0).getSellerStoreNo())
					{
						//같은 스토어의 상품인경우
						sameStorePrice = sameStorePrice 
								+ (cart1.getProductList().get(0).getProductPrice() 
								+ cart1.getProductList().get(0).getProductOption().getOptionAddPrice())
								* cart1.getCartProductAmount()
								+ (cart2.getProductList().get(0).getProductPrice() 
								+ cart2.getProductList().get(0).getProductOption().getOptionAddPrice())
								* cart2.getCartProductAmount();
						
						if(j == cartList.size()-1 && sameStorePrice < 30000)
						{
							deliveryPrice = deliveryPrice + 2500;
						}
					}
				}
				sellerStoreNos.add(cart1.getProductList().get(0).getSellerStoreNo());
			}
		}
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("deliveryPrice", deliveryPrice);
		return "buyer/buy_form.tiles";
	}
	
	//구매하기 버튼 클릭.
	@RequestMapping("/buyProducts")
	public String buyProducts(HttpSession session, HttpServletRequest request, Orders orders, 
			String hp1, String hp2, String hp3, int[] orderAmount, String[] productId, int[] optionId, 
			int[] sellerStoreNo, int[] cartNo, @RequestParam(value="memberMileage" ,defaultValue= "0")int memberMileage)
	{
		//주문번호 생성
		String ordersNo = new SimpleDateFormat("yyMMddHHmmssSSS").format(new Date());
		orders.setOrdersNo(ordersNo);
		//주문자 전화번호
		orders.setOrdersPhone(hp1+"-"+hp2+"-"+hp3);
		//결제여부 변경
		orders.setPaymentStatus(1);
		orders.setOrdersDate(new Date());
		
		//주문상품 리스트 생성
		ArrayList<OrderProduct> list = new ArrayList<>();
		for(int i = 0; i < orderAmount.length; i++)
		{
			list.add(new OrderProduct(orderAmount[i], ordersNo, productId[i], optionId[i], sellerStoreNo[i], 1));
		}
		
		int result = orderService.buyProductsHandle(orders, list, cartNo, memberMileage);
		
		if(memberMileage != 0)
		{
			//마일리지 사용내역이 있을경우 마일리지 차감 후, 세션에 저장된 멤버의 마일리지 최신화
			Member member = (Member)session.getAttribute("login_info");
			memberService.updateMileageMinus(member.getMemberId(), memberMileage);
			member.setMemberMileage(member.getMemberMileage() - memberMileage);
			session.setAttribute("login_info", member);
		}
		
		return "redirect:/buy/buySuccess.go?result="+result+"&ordersNo="+ordersNo;
	}
	
	//구매완료 페이지로 이동
	@RequestMapping("/buySuccess")
	public ModelAndView buySuccess(HttpSession session, HttpServletRequest request)
	{
		if(Integer.parseInt(request.getParameter("result")) == 1)
		{
			return new ModelAndView("buyer/buy_success.tiles", "diliveryStatus", orderService.selectDiliveryStatusByOrderNo(request.getParameter("ordersNo")));
		}
		return new ModelAndView("buyer/buy_success.tiles");
	}
}