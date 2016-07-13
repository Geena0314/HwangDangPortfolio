package com.hwangdang.dao;

import java.util.HashMap;
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

}
