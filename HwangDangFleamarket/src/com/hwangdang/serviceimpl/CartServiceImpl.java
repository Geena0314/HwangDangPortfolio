package com.hwangdang.serviceimpl;

import java.util.ArrayList;
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
	public int addCart(Cart cart, String memberId, String productId, String cartProductOption) {
		ArrayList<Cart> list = (ArrayList<Cart>)dao.selectCartById(memberId);
		for(int idx=0; idx<list.size(); idx++){
			if(productId.equals(list.get(idx).getProductId())){
				if(cartProductOption.equals(list.get(idx).getCartProductOption())){
					return 0;
				}
			}
		}
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
