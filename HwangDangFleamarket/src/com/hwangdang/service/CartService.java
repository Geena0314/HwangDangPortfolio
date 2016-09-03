package com.hwangdang.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.Cart;

public interface CartService {

	//장바구니 상품 등록
	public int addCart(Cart cart, String memberId, String productId, String cartProductOption);
	
	//장바구니 상품 삭제
	public int removeCart(int cartNo);
	
	//장바구니 전체 상품 목록 조회
	public List<Cart> getAllCart(String memberId);
	
	//장바구니 카운트
	public int getCountCart(String memberId);
	
	//장바구니 번호로 장바구니 조회
	public Cart getCartByCartNo(int cartNo);
}
