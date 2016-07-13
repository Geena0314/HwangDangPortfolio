package com.hwangdang.dao;

import java.util.HashMap;

import com.hwangdang.vo.RefundRequest;

public interface OrderDao
{
	/*환불 승인 처리.
	주문상품 주문현황 변경.(환불승인처리 9번)*/
	int updateOrderProductStatus(int orderSeqNo);
	
	//주문상품 번호로 옵션 id, 구매상품수량 조회.
	HashMap<String, Object> selectOptionAmount(int orderSeqNo);
	
	//반품된 수량만큼 옵션의 재고량 증가.
	int updateOptionStock(HashMap<String, Object> map);
	
	//환불정보저장.
	int insertRefundRequest(RefundRequest refund);
	
	//환불신청시 주문상품상태 환불신청상태로 변경.
	int updateOrderProductRefundStatus(int orderSeqNo);
}