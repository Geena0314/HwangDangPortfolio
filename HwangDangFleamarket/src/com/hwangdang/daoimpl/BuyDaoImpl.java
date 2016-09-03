package com.hwangdang.daoimpl;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.BuyDao;
import com.hwangdang.vo.Product;

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
