package com.hwangdang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;

public interface BuyService {
	//상품, 상품옵션 조회
	HashMap<String,Object> selectProductProductOption(String productId, int optionId, int sellerStoreNo);
	
	//카트번호로 주문할 상품 조회
	ArrayList<Cart> selectCartByCartNo(int[] cartNo);
	
	//구매처리 로직
	int buyProductsHandle(Orders orders, ArrayList<OrderProduct> list, int[] cartNo, int memberMileage);
	
	//주문번호로 주문내역 검색
	List<OrderProduct> selectDiliveryStatusByOrderNo(String ordersNo);
}