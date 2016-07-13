package com.hwangdang.service;

import com.hwangdang.vo.RefundRequest;

public interface OrderService
{
	//환불 승인 처리.
	int refundHandle(int orderSeqNo);
	
	//환불정보저장.
	int insertRefundRequest(RefundRequest refund);
}
