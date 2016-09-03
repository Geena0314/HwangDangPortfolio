package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.dao.BuyDao;
import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

@Repository
public class BuyDaoImpl implements BuyDao {

	
	public BuyDaoImpl(){ } 
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Product selectProductSellerOptionJoin(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectOne("buyMapper.selectProductSellerOptionJoin", map);
	}
}
