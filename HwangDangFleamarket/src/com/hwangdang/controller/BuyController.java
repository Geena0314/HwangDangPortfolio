package com.hwangdang.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hwangdang.common.util.Constants;
import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.BuyService;
import com.hwangdang.service.CartService;
import com.hwangdang.service.MemberService;
import com.hwangdang.vo.Cart;
import com.hwangdang.vo.Code;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

@Controller
@RequestMapping("/buy")
public class BuyController {

	
	@Autowired
	private BuyService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	
	//구매전 재고수량 확인 로직 - ajax 
	@ResponseBody
	@RequestMapping("/checkStock.go")
	public String checkStock( String productId , int amount , String optionSubName){
		
		//재고확인로직
		Map<String , Object> param = new HashMap<>();
		param.put("productId", productId);
		param.put("optionSubName", optionSubName);
		int stock = service.getProductStockByProductId(param);
		//System.out.println("재고량 조회:" + stock);
		String msg = "";
		if(amount > stock){
			//주문수량이 재고량보다 큼 
			//System.out.println("주문수량이 재고량보다 큼 : 주문실패 ");
			 msg = "재고수량부족";
			
		}else if(amount <= stock){
			//주문수량이 재고량보다 작거나 같을때 : 주문가능 
			//System.out.println("주문가능상태 : 재고량가능!");
			msg="재고수량가능";
		}
		return msg;
	}  
	
	/**
	 * 바로구매 :1개  상품결제 페이지 이동 
	 *   (비로그인상태이면 로그인페이지로 거쳐서 로그인후 구매페이지로 이동  )
	 */
	@RequestMapping("/moveBuyPage.go") 
	public String moveBuyPage(@RequestParam(value="page" ,defaultValue="1") int page  , 
			@RequestParam(value="productId" ,required=false) String productId   ,
			@RequestParam(value="sellerStoreNo" , required=false) int sellerStoreNo , String sellerStoreImage , 
			int amount , @RequestParam(value="memberId" ,required=false) String memberId , String option , Model model){
		String url = "";
		if(memberId == null || memberId.isEmpty()){ 
			//로그인이 안된상태 로그인페이지로 이동 !! 
			url ="member/login_form.tiles";
			model.addAttribute("errorMsg", "로그인이 필요한서비스입니다. 로그인해주세요");
			model.addAttribute("flag" ,"true");
			//이메일 셀렉트 박스를 위한 zipcode tB 조회 
			List<Code> emailList = memberService.selectEmailList();
			model.addAttribute("emailList", emailList);
			
		}else{ 
			// ********* 로그인상태! - 바로구매페이지로 이동 ***************
			if(productId != null){
				ArrayList<OrderProduct> orderProductList = new ArrayList<>();
				//System.out.println(sellerStoreNo);
				Member member = memberService.findById(memberId);
				Product product = service.getProductInfo(productId);
				ProductOption productOption = service.getProductOptionByOptionSubName(option);
				Seller seller = service.getSellerByNo(sellerStoreNo);
				long randomNumber = (int) (Math.random() * 999999999) + 1;
				String ordersNo = "" + randomNumber;
				int orderSeqNo = service.getOrderProductSeq();
				OrderProduct orderProduct = new OrderProduct(orderSeqNo ,amount, ordersNo, productId, productOption.getOptionId()  ,product.getSellerStoreNo() , 0 , product, productOption, seller);
				orderProductList.add(orderProduct);
				model.addAttribute("orderProductList",orderProductList);
				model.addAttribute("ordersNo",ordersNo);
				
				url ="buyer/buyForm.tiles";	
			} 
		
		}
		return url;
	}  
	
	/**
	 * 장바구니 구매  N개 : 상품결제 페이지로 이동 
	 */
	@RequestMapping("/buyCarts.go")
	public String buyCarts(String cartNoList , Model model , HttpSession session ){
		
		
		//System.out.println("카트리스트:"+ cartNoList);
		//1.주문번호 생성
		long randomNumber = (int) (Math.random() * 999999999) + 1;
		String ordersNo = "" + randomNumber;
		
		ArrayList<String> listParam = listSplit(cartNoList);
		//ArrayList<Cart> cartList = new ArrayList<>();
		ArrayList<OrderProduct> orderProductList = new ArrayList<>();
		for(int i =0;  i < listParam.size();  i++){
			Cart cart = service.getCartByCartNo(Integer.parseInt(listParam.get(i)) );
			//Member member = memberService.findById(cart.getMemberId());
			if(cart != null){
				Product product = service.getProductInfo(cart.getProductId());
				ProductOption productOption = service.getProductOptionInfoByoptionNo(cart.getOptionId());
				Seller seller = service.getSellerByNo(product.getSellerStoreNo());
				int orderSeqNo = service.getOrderProductSeq();
				OrderProduct orderProduct = new OrderProduct(orderSeqNo ,cart.getCartProductAmount(), ordersNo, cart.getProductId(), cart.getOptionId(),product.getSellerStoreNo() , 0 , product, productOption, seller);
				orderProductList.add(orderProduct);
			}else{
				System.out.println("127라인 널! : cart 객체");
			}
			
		}
		model.addAttribute("flaN" , "ok");
		model.addAttribute("ordersNo",ordersNo );
		model.addAttribute("orderProductList",orderProductList);
		model.addAttribute("cartNoList",cartNoList);
		
		String url ="buyer/buyForm.tiles";	
		return url;
	}  
	
	/**
	 * 	상품구매 로직  1개 : 실제구매로직
	 */
	@RequestMapping("/buyProductOne.go")
	public String buyProductOne(@RequestParam(value="ordersNo" ,required=false) String ordersNo ,    
			String ordersReceiver , String ordersPhone, String ordersZipcode , Model model ,
			String ordersAddress , String ordersSubAddress , int ordersTotalPrice ,
			String ordersPayment , @RequestParam(value="ordersRequest" ,required=false) String ordersRequest , int paymentStatus , String memberId ,
			int orderAmount , String productId , int optionId , int sellerStoreNo , int orderProductStatus ,
			@RequestParam(value="usedMileage" ,defaultValue= "0") int usedMileage  ,  HttpSession session , 
			HttpServletResponse response , HttpServletRequest request  , @RequestParam(value="bank" ,required=false) String bank ,
			@RequestParam(value="card" ,required=false) String card ,
			@RequestParam(value="quota" ,required=false) String quota) throws Exception{ // 0 결재대기 , 1 결재완료  
		
		String url = "";
		//검증 결제예정금액이 마이너스인경우  : 즉 사용한마일리지 > 결제예정금액 인경우!
		if(ordersTotalPrice < 0) {
			request.setAttribute("errorMsg", "마일리지 사용금액이 실제 결제금액을 초과합니다. 마일리지 사용값을 확인해주세요");
			return "error.tiles";
		}
		
		String vitualBankNo ="";
		//System.out.println("bank:" + bank);
		//가상번호 생성 로직 
		if(bank != null  && !bank.isEmpty()){
			//System.out.println("계좌번호생성!");
			long randomNumber1 = (int) (Math.random() * 998) + 1;
			vitualBankNo  = "" + randomNumber1 + "-";
			long randomNumber2 = (int) (Math.random() * 99998) + 1;
			vitualBankNo  = vitualBankNo + "" + randomNumber2 + "-";
			long randomNumber3 = (int) (Math.random() * 998) + 1;
			vitualBankNo  = vitualBankNo + "" + randomNumber3 + "-";
			long randomNumber4 = (int) (Math.random() * 98) + 1;
			vitualBankNo  = vitualBankNo + "" + randomNumber4 ;
			session.setAttribute("vitualBankNo" ,vitualBankNo);
			session.setAttribute("bank",bank);
		
		}else if(card != null && quota != null){
			session.setAttribute("card" ,card);
			session.setAttribute("quota" ,quota);
		}
		
		/*
		if(ordersNo == null){
			//1.주문번호 생성
			long randomNumber = (int) (Math.random() * 999999999) + 1;
			ordersNo = "" + randomNumber;
		}*/
		
		//System.out.println("사용한 마일리지 : int :" + usedMileage);
		//2.마일리지 사용했다면 변경하는 로직 
				if(usedMileage != 0){
					Map<String,Object> param = new HashMap<>();
					param.put("memberId", memberId);
					param.put("mileage", usedMileage);
					service.setMemberMileage(param);
					
					//마일리지사용 했을경우 세션의 login_info 정보 수정 
					Member newMember = memberService.selectById(memberId);
					session.setAttribute("login_info", newMember);
					              
					// 사용한 마일리지가 있다면 결제성공 페이지에 정보 출력
					session.setAttribute("usedMileage", usedMileage);
				}
		
		Orders orders = new Orders(ordersNo, ordersReceiver, ordersPhone, ordersZipcode, ordersAddress, ordersSubAddress, ordersTotalPrice, ordersPayment, ordersRequest, paymentStatus, new Date(), memberId);
		OrderProduct op = new OrderProduct(orderAmount, ordersNo, productId, optionId, sellerStoreNo, orderProductStatus );
		Product product = service.getProductInfo(productId);
		Seller seller = service.getSellerByNo(sellerStoreNo);
		ProductOption po = service.getProductOptionInfoByoptionNo(optionId);
		op.setProduct(product);
		op.setSeller(seller);
		op.setProductOption(po);
		ArrayList<OrderProduct> orderProductList = new ArrayList<>();
		orderProductList.add(op);
		orders.setOrderProductList(orderProductList);
		
		/* 뒤로가기이슈 해결 
		//response.setHeader("Cache-Control", "no-store");
		response.setHeader("Cache-Control","no-store");   
		response.setHeader("Pragma","no-cache");   
		response.setDateHeader("Expires",0);   
		if (request.getProtocol().equals("HTTP/1.1")) {
			   response.setHeader("Cache-Control", "no-cache"); 
		}
		*/
		
		//****************************************
		//orders TB , orders product TB INSERT 
		int cnt = service.addProductOne(orders ,op);
		
		if(cnt == 1){
			//System.out.println("성공"); 
			//1.개별optionStock Minus
			Map<String,Object> param = new HashMap<String,Object>();
				param.put("buyStock", orderAmount);
				param.put("optionId", optionId);
				param.put("productId",productId );
				service.setOptionStockByOptionId(param);
				service.setProductStockByProductId(param);
				session.setAttribute("orders", orders);
				
				//마일리지사용 , 결제페이지 에서 회원정보 수정시 세션의 login_info 정보 수정 
				Member newMember = memberService.selectById(memberId);
				session.setAttribute("login_info", newMember);
				
			url = "redirect:/buy/addProductSuccessPage.go?cnt="+cnt+"&ordersNo="+ordersNo+"&productId="+productId;
			
		}else{
			url = "redirect:/error.tiles"; 
		}
	return url; 
	}  
	
	
	/**
	 * 	상품구매 로직   N개 : 
	 */
	@RequestMapping("/buyProducts.go")
	public String buyProducts(String ordersNo , String ordersReceiver , String ordersPhone, String ordersZipcode ,
			String ordersAddress , String ordersSubAddress , int ordersTotalPrice ,
			String ordersPayment , @RequestParam(value="ordersRequest" ,required=false) String ordersRequest , int paymentStatus , String memberId ,
			String amountList , String productIdList , String optionIdList , String sellerStoreNoList , int orderProductStatus ,
			@RequestParam(value="usedMileage" ,defaultValue= "0") int usedMileage  ,  HttpSession session , 
			HttpServletResponse response , HttpServletRequest request ,String cartNoList, 
			@RequestParam(value="bank" ,required=false) String bank , 
			@RequestParam(value="card" ,required=false) String card , @RequestParam(value="quota" ,required=false) String quota) throws Exception{ // 0 결재대기 , 1 결재완료  
		
		String url = "";
		//검증 결제예정금액이 마이너스인경우  : 즉 사용한마일리지 > 결제예정금액 인경우!
		if(ordersTotalPrice < 0) {
			request.setAttribute("errorMsg", "마일리지 사용금액이 실제 결제금액을 초과합니다. 마일리지 사용값을 확인해주세요");
			return "error.tiles";
		}
		
		String vitualBankNo ="";
		//System.out.println("bank:" + bank);
		//가상번호 생성 로직 
		if(bank != null  && !bank.isEmpty()){
			//System.out.println("계좌번호생성!");
			long randomNumber1 = (int) (Math.random() * 998) + 1;
			vitualBankNo  = "" + randomNumber1 + "-";
			long randomNumber2 = (int) (Math.random() * 99998) + 1;
			vitualBankNo  = vitualBankNo + "" + randomNumber2 + "-";
			long randomNumber3 = (int) (Math.random() * 998) + 1;
			vitualBankNo  = vitualBankNo + "" + randomNumber3 + "-";
			long randomNumber4 = (int) (Math.random() * 98) + 1;
			vitualBankNo  = vitualBankNo + "" + randomNumber4 ;
			session.setAttribute("vitualBankNo" ,vitualBankNo);
			session.setAttribute("bank",bank);
			//System.out.println(vitualBankNo);
			
		}else if(card != null && quota != null){
			session.setAttribute("card" ,card);
			session.setAttribute("quota" ,quota);
		}
		//2.마일리지 사용했다면 변경하는 로직 
		if(usedMileage != 0){
			Map<String,Object> param = new HashMap<>();
			param.put("memberId", memberId);
			param.put("mileage", usedMileage);
			service.setMemberMileage(param);
			
			//마일리지사용 했을경우 세션의 login_info 정보 수정 
			Member newMember = memberService.selectById(memberId);
			session.setAttribute("login_info", newMember);
			              
			// 사용한 마일리지가 있다면 결제성공 페이지에 정보 출력
			session.setAttribute("usedMileage", usedMileage);
		}
		
		//마일리지는 사용않했지만 주소만 변경했다면!! session의 login_info 수정
		//결제페이지에서 회원정보 수정 구현X
		
		  
		//3. 매개변수 split
		ArrayList<String> amountSplitList =  listSplit(amountList);
		ArrayList<String> productIdSplitList =  listSplit(productIdList);
		ArrayList<String> optoinIdSplitList =  listSplit(optionIdList);
		ArrayList<String> sellerStoreNoSplitList =  listSplit(sellerStoreNoList);
		
		// 4. 객체생성
		ArrayList<OrderProduct> orderProductList = new ArrayList<>();
		Orders orders = new Orders(ordersNo, ordersReceiver, ordersPhone, ordersZipcode, ordersAddress, ordersSubAddress, ordersTotalPrice, ordersPayment, ordersRequest, paymentStatus, new Date(), memberId);
		
		
		for(int i=0; i < amountSplitList.size(); i++){
			//System.out.println("판매자가 결제한 수량 : "+amountSplitList.get(i));
			Product product = service.getProductInfo(productIdSplitList.get(i));
			Seller seller = service.getSellerByNo(Integer.parseInt(sellerStoreNoSplitList.get(i)));
			ProductOption productOption = service.getProductOptionInfoByoptionNo(Integer.parseInt(optoinIdSplitList.get(i)));
			
			OrderProduct op = new OrderProduct(Integer.parseInt(amountSplitList.get(i)), 
					ordersNo, productIdSplitList.get(i) , Integer.parseInt(optoinIdSplitList.get(i)), Integer.parseInt(sellerStoreNoSplitList.get(i)), orderProductStatus ,product ,productOption , seller );
			
			//List에 add()
			orderProductList.add(op);
		}
		orders.setOrderProductList(orderProductList);
		
		
		//****************************************
		 // 5.orders TB , orders product TB INSERT 
		int cnt = service.addProductN(orders);
		
		for(OrderProduct op : orderProductList ){
			//DB에 INSERT
			cnt = service.addProductN(op);
			if(cnt == 0){
				throw new Exception("addProductN(OrderProduct) 메소드에서 예외발생");
			}
		}
		
		//6-1. DB에 INSERT  : 결재완료라면 Cart에서 삭제
		if(cnt == 1){
				ArrayList<String> cartList = null;
				cartList = listSplit(cartNoList);
				for(String temp : cartList){
					int cartNo = Integer.parseInt(temp);
					cartService.removeCart(cartNo);
				}
		} //if
	
		// 6-2결재완료라면  구매한 상품 수량 마이너스 
		if(cnt == 1){
			//1.개별optionStock Minus
			Map<String,Object> param = new HashMap<String,Object>();
			for(int i=0; i < amountSplitList.size(); i++){
				int optionStock = Integer.parseInt(amountSplitList.get(i));
				param.put("buyStock", optionStock);
				param.put("optionId",orders.getOrderProductList().get(i).getProductOption().getOptionId() );
				param.put("productId", productIdSplitList.get(i));
				service.setOptionStockByOptionId(param);
				service.setProductStockByProductId(param);
			}
		}
		
		
		
		
		if(cnt == 1){
			//System.out.println("성공"); //   "*/*.tiles"
			/*//뒤로가기이슈 해결 
			//response.setHeader("Cache-Control", "no-store");
			response.setHeader("Cache-Control","no-store");   
			response.setHeader("Pragma","no-cache");   
			response.setDateHeader("Expires",0);   
			if (request.getProtocol().equals("HTTP/1.1")) {
			        response.setHeader("Cache-Control", "no-cache"); 
			}*/
			
			session.setAttribute("orders", orders);
			
			url = "redirect:/buy/addProductSuccessPage.go?cnt="+cnt+"&ordersNo="+ordersNo+"&orderProductList="+orderProductList;
			
		}else{
			url = "redirect:/error.tiles"; 
		}
	return url; 
	}  
	
	
	
	/**
	 * 	구매성공 : 결제성공 페이지 이동 
	 */
	@RequestMapping("/addProductSuccessPage.go")
	public String addProductPage(String ordersNo ,@RequestParam(value="productId" ,required=false ) String productId 
			,@RequestParam(value="orderProductList" ,required=false ) List orderProductList ,Model model ){
		String url = "/";
		//System.out.println(ordersNo +", "+ productId);
		
			url = "buyer/buy_success.tiles";
			Orders orders = service.getOrdersByOrdersNo(ordersNo);
			model.addAttribute("orders" ,orders);
			model.addAttribute("product",productId);
			model.addAttribute("orderProductList",orderProductList);
			/*url = "error.tiles"; 
			model.addAttribute("errorMsg","결제가실패하였습니다. 관리자에게 문의하세요.");*/
		
		return url;
	}
	/**
	 * 	최근배송지 조회   - 
	 */
	@RequestMapping("/currentDeliveryAddress.go")
	@ResponseBody
	public Orders currentDeliveryAddress(String memberId){
		//System.out.println("아이디:"+memberId);
		Orders orders = service.getcurrentDeliveryAddress(memberId);
		//System.out.println(orders);
		return orders;  //세부주소가진 orders 객체 리턴 
	}
	
	/**
	 * 	체크박스 list  콤마 split 메소드 
	 */
	public ArrayList<String> listSplit(String str){
		String array[] = str.split(",");
		ArrayList<String> param = new ArrayList<>();
		for (int i = 0; i < array.length; i++) {
			param.add(array[i]);
		}
		return param;
	}
	/**
	 * 세션의 회원의  마일리지 실시간 조회를 위한 메소드 
	 */
	@RequestMapping("/getMemberMileageAjax.go")
	@ResponseBody
	public int getMemberMileageAjax(String memberId){
		Member member = memberService.findById(memberId);
		return member.getMemberMileage();
	}
	
	
	/**
	 메인페이지 상품검색 기능 : 키워드로 상품이나 스토어 검색!
	 * */
	@RequestMapping("/findProductByKeyword.go")
	public String findProductByKeyword(Model model,
					@RequestParam(value="keyword" ,required=false) String keyword , 
					@RequestParam(value="page" , defaultValue="1") int page){
		//System.out.println("키워드:"+keyword);
		if(!keyword.isEmpty()){
			Map<String ,Object> param = new HashMap<String,Object>();
			param.put("keyword", keyword);
			param.put("itemPerPage", Constants.ITEMS_PER_PAGE);
			param.put("page" , page);
			List<Product> productList = service.getProductByLikeKeyword(param);
			/*for(Product p : productList){
				System.out.println(p);
			}*/
			int totalItems = service.getProductTotalByLikeKeyword(keyword);
			PagingBean pagingBean = new PagingBean(totalItems, page);
			
			model.addAttribute("pagingBean", pagingBean);
			model.addAttribute("productList", productList);
			model.addAttribute("keyword" ,keyword);
		}		
		
		return "buyer/product_list.tiles";
	}
	
	
	/**
	결제버튼 클릭시 결제정보입력
	 * */
	@RequestMapping("/inputPayInfo.go")
	public String findProductByKeyword(){
		return "/WEB-INF/view/buyer/pay_info_form.jsp";
	}
	
}
