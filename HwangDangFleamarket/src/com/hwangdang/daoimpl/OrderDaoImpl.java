package com.hwangdang.daoimpl;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.OrderDao;
import com.hwangdang.vo.RefundRequest;

@Repository
public class OrderDaoImpl implements OrderDao
{
	@Autowired
	private SqlSessionTemplate session;
	
	public OrderDaoImpl()
	{
		// TODO Auto-generated constructor stub
	}

	@Override
	public int updateOrderProductStatus(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateOrderProductStatus", orderSeqNo);
	}

	@Override
	public HashMap<String, Object> selectOptionAmount(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("orderMapper.selectOptionAmount", orderSeqNo);
	}

	@Override
	public int updateOptionStock(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateOptionStock", map);
	}

	@Override
	public int insertRefundRequest(RefundRequest refund)
	{
		// TODO Auto-generated method stub
		return session.insert("orderMapper.insertRefundRequest", refund);
	}

	@Override
	public int updateOrderProductRefundStatus(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateOrderProductRefundStatus", orderSeqNo);
	}
}