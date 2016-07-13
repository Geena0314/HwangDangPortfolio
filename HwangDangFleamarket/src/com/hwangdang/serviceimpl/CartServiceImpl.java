package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.dao.CartDao;
import com.hwangdang.service.CartService;
import com.hwangdang.vo.Cart;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao dao;

	@Override
	public int addCart(Cart cart) {
		return dao.insertCart(cart);
	}

	@Override
	public int removeCart(int cartNo) {
		return dao.deleteCart(cartNo);
	}

	@Override
	public List<Cart> getAllCart(String memberId) {
		return dao.selectAllCart(memberId);
	}

	@Override
	public int getCountCart(String memberId) {
		return dao.selectCountCart(memberId);
	}

	@Override
	public Cart getCartByCartNo(int cartNo) {
		return dao.selectCartByCartNo(cartNo);
	}
}
