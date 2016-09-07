package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.BuyDao;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
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
	
	@Override
	public int insertOrders(Orders orders)
	{
		// TODO Auto-generated method stub
		return session.insert("buyMapper.insertOrders", orders);
	}

	@Override
	public List<OrderProduct> selectDiliveryStatusByOrderNo(String ordersNo)
	{
		// TODO Auto-generated method stub
		return session.selectList("buyMapper.selectDiliveryStatusByOrderNo", ordersNo);
	}
	
	@Override
	public int insertOrderProduct(OrderProduct orderProduct)
	{
		// TODO Auto-generated method stub
		return session.insert("buyMapper.insertOrderProduct", orderProduct);
	}
}
