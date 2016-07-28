package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.dao.OrderDao;
import com.hwangdang.dao.ProductDao;
import com.hwangdang.service.OrderService;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.RefundRequest;

@Service
public class OrderServiceImpl implements OrderService
{
	@Autowired
	private OrderDao dao;
	
	@Autowired
	private ProductDao productDao;
	
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
	@Transactional(rollbackFor = Exception.class)
	public int insertRefundRequest(RefundRequest refund)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductRefundStatus(refund.getOrderSeqNo());
		return dao.insertRefundRequest(refund);
	}

	@Override
	public HashMap<String, Object> orderProductProductOption(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		
		//orderSeqNo로 order_product 와  product_option 조회.
		OrderProduct orderProduct = dao.orderProductProductOption(orderSeqNo);
		//productId로 상품옵션리스트 조회.
		List<ProductOption> optionList = productDao.selectOptionById(orderProduct.getProductId());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderProduct", orderProduct);
		map.put("optionList", optionList);
		return map;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertRequestExchange(ExchangeRequest exchange)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductExchangeStatus(exchange.getOrderSeqNo());
		return dao.insertRequestExchange(exchange);
	}
}