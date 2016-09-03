package com.hwangdang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

public interface BuyService {
	//상품, 상품옵션 조회
	HashMap<String,Object> selectProductProductOption(String productId, int optionId, int sellerStoreNo);
	
	//카트번호로 주문할 상품 조회
	ArrayList<Cart> selectCartByCartNo(int[] cartNo);
}