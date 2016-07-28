package com.hwangdang.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Seller;

public interface MyOrderService {

	//나의주문 - 메인페이지 
	List<Orders> getOrdersMain(String buyer, int page);

	List<Orders> getOrdersCancel(String buyer, int page);

	List<Orders> getOrdersSuccess(String buyer, int page);

	//0:입금대기중 ,1:결제완료 , 2:배송준비중 삭제  == 주문취소 실행 
	int setOrderStatus(ArrayList<String> param, int status); // 메소드

	//셀러 정보 조회 1명 
	Seller getSellerDetailBySellerName(String sellerName);

	//전체튜플수 조회 -Orders TB  
	int getOrdersTotalItems(Map<String, Integer> param);
}