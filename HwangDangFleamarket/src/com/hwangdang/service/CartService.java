package com.hwangdang.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.Cart;

public interface CartService {

	@Transactional
	public int addCart(Cart cart);
	
	@Transactional
	public int removeCart(int cartNo);
	
	public List<Cart> getAllCart(String memberId);
	
	public int getCountCart(String memberId);
	
	public Cart getCartByCartNo(int cartNo);
}
