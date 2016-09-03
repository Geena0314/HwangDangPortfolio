package com.hwangdang.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hwangdang.vo.Cart;

public interface BuyService {
	//상품, 상품옵션 조회
	HashMap<String,Object> selectProductProductOption(String productId, int optionId, int sellerStoreNo);
	
	//카트번호로 주문할 상품 조회
	ArrayList<Cart> selectCartByCartNo(int[] cartNo);
}