package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Cart;

public interface CartDao {
	
	int insertCart(Cart cart);
	
	int deleteCart(int cartNo);
	
	int selectCountCart(String memberId);
	
	List<Cart> selectAllCart(String memberId);
	
	Cart selectCartByCartNo(int cartNo);

}
