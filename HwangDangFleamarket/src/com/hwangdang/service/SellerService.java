package com.hwangdang.service;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Product;
import com.hwangdang.vo.Seller;

public interface SellerService {
	
	public int getCountSeller();
	
	public Seller getSellerBySellerStoreNo(int sellerStoreNo);
	
	public List getAllSeller(int page);
	
	//셀러 정보 등록
	int insertSeller(Seller seller);
	
	//주문상품리스트조회.
	HashMap<String, Object> selectOrderState(int page, int sellerStoreNo);
	
	//주문번호로 주문정보조회, 주문상품번호로 환불정보 조회.
	HashMap<String, Object> selectOrderAndRefund(String ordersNo, int orderSeqNo);
	
	//셀러 정보 삭제
	int deleteSeller(int sellerStoreNo, String memberId);
	
	//주문번호로 주문정보조회, 주문상품번호로 교환정보 조회.
	HashMap<String, Object> selectOrderAndExchange(String ordersNo, int orderSeqNo);
	
	//판매자 해쉬태그 검색(+페이징)
	HashMap<String, Object> selectSearchSeller(String keyword, int page);
}