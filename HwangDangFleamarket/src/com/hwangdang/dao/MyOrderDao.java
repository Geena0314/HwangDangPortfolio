package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Seller;

public interface MyOrderDao {

	//배송현황조회 - 0:입금대기중 ,1:결제완료 , 2:배송준비중 , 3:배송중  
	List<Orders> selectOrdersMain(String buyer, int page);

	//주문 취소리스트 조회  - 5:주문취소 , 6:교환신청 , 7:환불신청
	List<Orders> selectOrdersCancel(String buyer, int page);

	//배송완료 조회  - 4: 배송완료 
	List<Orders> selectOrdersSuccess(String buyer, int page);

	//배송중 3: 배송완료4: 를 환불신청 :6으로 변경 
	int updateOrdersStatus(HashMap<String, Object> map);

	//셀러정보 조회 
	Seller selectSellerBySellerName(String sellerName);

	//order TB 튜플총개수 조회 
	int selectOrdersTotalItems(Map<String, Integer> param);
}