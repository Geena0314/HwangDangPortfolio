package com.hwangdang.service;

import java.util.HashMap;

import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.RefundRequest;

public interface OrderService
{
	//환불 승인 처리.
	int refundHandle(int orderSeqNo);
	
	//환불정보저장.
	int insertRefundRequest(RefundRequest refund);
	
	//orderSeqNo로 order_product 와  product_option 조회.
	HashMap<String, Object> orderProductProductOption(int orderSeqNo);
	
	//교환정보저장.
	int insertRequestExchange(ExchangeRequest exchange);
}
