package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.common.util.Constants;
import com.hwangdang.dao.CartDao;
import com.hwangdang.vo.Cart;

@Repository
public class CartDaoImpl implements CartDao{

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertCart(Cart cart) {
		return session.insert("cartMapper.insertCart", cart);
	}

	@Override
	public int deleteCart(int cartNo) {
		return session.delete("cartMapper.deleteCart", cartNo);
	}

	@Override
	public int selectCountCart(String memberId) {
		return session.selectOne("cartMapper.selectCountCart", memberId);
	}

	@Override
	public List<Cart> selectAllCart(String memberId) {
		return session.selectList("cartMapper.selectCartProductJoin", memberId);
	}

	@Override
	public Cart selectCartByCartNo(int cartNo) {
		return session.selectOne("cartMapper.selectCartByCartNo", cartNo);
	}

	@Override
	public List<Cart> selectCartById(String memberId) {
		// TODO Auto-generated method stub
		return session.selectList("cartMapper.selectCartById", memberId);
	}
}
