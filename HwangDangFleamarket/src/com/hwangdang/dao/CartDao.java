package com.hwangdang.dao;

import java.util.List;

import com.hwangdang.vo.Cart;

public interface CartDao {
	
	//장바구니 등록
	int insertCart(Cart cart);
	
	//장바구니 삭제
	int deleteCart(int cartNo);
	
	//장바구니 카운트
	int selectCountCart(String memberId);
	
	//장바구니 목록
	List<Cart> selectAllCart(String memberId);
	
	//장바구니 번호로 조회
	Cart selectCartByCartNo(int cartNo);
	
	//회원 아이디로 장바구니 상품 조회
	List<Cart> selectCartById(String memberId);
	
	//상품구매시 카트번호로 카트조회
	Cart selectOneCartProductJoin(int cartNo);
}
