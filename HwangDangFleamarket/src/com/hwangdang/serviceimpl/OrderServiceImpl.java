package com.hwangdang.serviceimpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.dao.OrderDao;
import com.hwangdang.service.OrderService;
import com.hwangdang.vo.RefundRequest;

@Service
public class OrderServiceImpl implements OrderService
{
	@Autowired
	private OrderDao dao;
	
	public OrderServiceImpl()
	{
		// TODO Auto-generated constructor stub
	}

	@Override
	public int refundHandle(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductStatus(orderSeqNo);
		HashMap<String, Object> map = dao.selectOptionAmount(orderSeqNo);
		return dao.updateOptionStock(map);
	}

	@Override
	public int insertRefundRequest(RefundRequest refund)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductRefundStatus(refund.getOrderSeqNo());
		return dao.insertRefundRequest(refund);
	}
}