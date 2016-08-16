package com.hwangdang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
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
	
	//교환정보삭제(거절)
	int deleteExchangeRequest(int orderSeqNo);
	
	//교환 승인 처리.
	int exchangeHandle(int orderSeqNo);
	
	//교환시 차액 마일리지지급
	int updateMileage(int orderSeqNo, int mileage);
	
	//배송 현황 조회
	HashMap<String, Object> selectDiliveryStatus(String memberId, int page);
	
	//교환,환불,취소 현황 조회
	HashMap<String, Object> selectRequestStatus(String memberId, int page);
	
	//구매확정 상품 조회
	HashMap<String, Object> selectPurchaseConfirm(String memberId, int page);
	
	//구매 취소 시 현황 변경
	int updateCancelOrderProductStatus(int orderSeqNo);
	
	//구매 확정 시 현황 변경
	int updateConfirmOrderProductStatus(int orderSeqNo);
	
	//구매처리 로직
	int buyProductsHandle(Orders orders, ArrayList<OrderProduct> list, int[] cartNo, int memberMileage);
	
	//주문번호로 주문내역 검색
	List<OrderProduct> selectDiliveryStatusByOrderNo(String ordersNo);
}