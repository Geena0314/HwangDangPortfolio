package com.hwangdang.service;

import java.util.List;
import java.util.Map;

import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

public interface BuyService {

	//바로구매페이지 이동전 재고량조회
	int getProductStockByProductId(Map param);

	//바로구매하기 - Orders , Order_product INSERT 
	int addProductOne(Orders orders, OrderProduct orderProduct);

	/*** 1 ***/
	//장바구니 구매하기 - 1개 Orders
	int addProductN(Orders orders);

	/*** 2 ***/
	//장바구니 구매하기 - N개 Order_product INSERT
	int addProductN(OrderProduct orderProduct);

	//상품 정보 조회 - Product TB 
	Product getProductInfo(String productId);

	//상품옵션 조회 - product_option TB  : 옵션명으로 조회 
	ProductOption getProductOptionByOptionSubName(String optionSubName);

	//상품옵션 조회 - product_option TB  :옵션NO 로조회 
	ProductOption getProductOptionInfoByoptionNo(int optionNo);

	// 셀러의 스토어상호명 조회 
	Seller getSellerByNo(int sellerStoreNo);

	//상품옵션 조회 
	Orders getcurrentDeliveryAddress(String memberId);

	//orders TB조회  구매성공한후 buy-product-one-success.jsp 에서 보여주기위해  
	Orders getOrdersByOrdersNo(String ordersNo);

	// 구매시 마일리지 사용하면 마일리지 수정  
	void setMemberMileage(Map param);

	// 카드정보조회   
	Cart getCartByCartNo(int cartNo);

	// product TB 전체상품 수량 변경 (마이너스) 
	int setProductStockByProductId(Map param);

	// product_option TB 개별상품 수량 변경 (마이너스) 
	int setOptionStockByOptionId(Map param);

	// 상품명으로 제품들 조회 LIKE keyword
	List<Product> getProductByLikeKeyword(Map param);

	// 키워드로 조회한 아이템의 토탈갯수 
	int getProductTotalByLikeKeyword(String keyword);

}