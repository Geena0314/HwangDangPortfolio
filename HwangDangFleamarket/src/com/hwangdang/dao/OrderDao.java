package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.RefundRequest;

public interface OrderDao
{
	/*환불 승인 처리.
	주문상품 주문현황 변경.(환불승인처리 9번)*/
	int updateOrderProductStatus(int orderSeqNo);
	
	//주문상품 번호로 옵션 id, 구매상품수량 조회.
	HashMap<String, Object> selectOptionAmount(int orderSeqNo);
	
	//취소/반품된 수량만큼 옵션의 재고량 증가.
	int updateOptionStock(HashMap<String, Object> map);
	
	//환불정보저장.
	int insertRefundRequest(RefundRequest refund);
	
	//환불신청시 주문상품상태 환불신청상태로 변경.
	int updateOrderProductRefundStatus(int orderSeqNo);
	
	//orderSeqNo로 order_product 와  product_option 조회.
	OrderProduct orderProductProductOption(int orderSeqNo);
	
	//교환 정보 저장 
	int insertRequestExchange(ExchangeRequest exchange);
	
	//주문상품 주문현황 변경.(교환신청상태 5번)
	int updateOrderProductExchangeStatus(int orderSeqNo);
	
	//옵션id로 옵션조회
	ProductOption selectOptionByOptionId(int optionId);
	
	//교환 신청 삭제(거절)
	int deleteExchangeRequest(int orderSeqNo);
	
	//주문상품 주문현황 변경.(교환승인처리 8번)
	int updateOrderProductStatus8(int orderSeqNo);
	
	//기존 옵션 재고량 더해주기.
	int updatePlusOptionStock(HashMap<String, Object> map);
	
	//바꿀 옵션 재고량 빼주기.
	int updateMinusOptionStock(HashMap<String, Object> map);
	
	//주문상태변경 (교환거부처리 11번);
	int updateOrderProductStatus11(int orderSeqNo);
	
	//주문상품, 주문 Join
	OrderProduct selectOrderProductAndProduct(int orderSeqNo);
	
	//주문, 주문상품 Join(memberId찾기)
	Orders selectOrdersOrderProduct(int orderSeqNo);
	
	//배송 현황 조회
	List<OrderProduct> selectDiliveryStatus(HashMap<String, Object> map);
	
	//주문 총 갯수 조회
	int selectCountOrderProduct(String memberId);
	
	//교환,환불,취소 현황 조회
	List<OrderProduct> selectRequestStatus(HashMap<String, Object> map);
	
	//교환,환불,취소 상품 총 갯수 조회
	int selectCountRequestOrderProduct(String memberId);
	
	//구매확정 상품 조회
	List<OrderProduct> selectPurchaseConfirm(HashMap<String, Object> map);
	
	//구매확정 상품 총 갯수 조회
	int selectCountPurchaseConfirm(String memberId);
	
	//구매 취소 시 현황 변경
	int updateCancelOrderProductStatus(int orderSeqNo);
	
	//구매 확정 시 현황 변경
	int updateConfirmOrderProductStatus(int orderSeqNo);
	
	//주문상품 주문현황 변경.(교환승인처리 8번)
	int updateOrderProductStatus234(HashMap<String, Object> map);
}