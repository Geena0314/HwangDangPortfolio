package com.hwangdang.daoimpl;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.OrderDao;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.ProductOption;
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

	@Override
	public OrderProduct orderProductProductOption(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("orderMapper.orderProductProductOption", orderSeqNo);
	}

	@Override
	public int insertRequestExchange(ExchangeRequest exchange)
	{
		// TODO Auto-generated method stub
		return session.insert("orderMapper.insertRequestExchange", exchange);
	}

	@Override
	public int updateOrderProductExchangeStatus(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateOrderProductExchangeStatus", orderSeqNo);
	}

	@Override
	public ProductOption selectOptionByOptionId(int optionId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("orderMapper.selectOptionByOptionId", optionId);
	}

	@Override
	public int deleteExchangeRequest(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.delete("orderMapper.deleteExchangeRequest", orderSeqNo);
	}

	@Override
	public int updateOrderProductStatus8(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateOrderProductStatus8", orderSeqNo);
	}

	@Override
	public int updatePlusOptionStock(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updatePlusOptionStock", map);
	}

	@Override
	public int updateMinusOptionStock(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateMinusOptionStock", map);
	}

	@Override
	public int updateOrderProductStatus11(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.update("orderMapper.updateOrderProductStatus11", orderSeqNo);
	}

	@Override
	public OrderProduct selectOrderProductAndProduct(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("orderMapper.selectOrderProductAndProduct", orderSeqNo);
	}
}