package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.RefundRequest;
import com.hwangdang.vo.Seller;

public interface SellerDao {

	int selectCountSeller();
	
	Seller selectSellerBySellerStoreNo(int sellerStoreNo);
	
	List<Seller> selectAllSeller(int page);
	
	//셀러 정보 등록
	int insertSeller(Seller seller);
	
	//셀러 등록신청 조회.
	List<Seller> selectSellerRegister(HashMap<String, Object> map);
	
	//셀러 등록신청한 사람수 조회.
	int selectCountSellerRegister();
	
	//셀러 - 멤버 조인.
	Seller selectSellerMember(int sellerStoreNo);
	
	//셀러 assign 1로변경(판매자등록승인)
	int sellerAssignUpdate(int sellerStoreNo);
	
	//셀러정보삭제(관리자가 거부)
	int deleteSellerByNo(int sellerStoreNo);
	
	//주문상품리스트조회.
	List<Orders> selectOrderState(HashMap<String, Object> map);
	
	//주문상품 전체개수 조회.(스토어넘버로)
	int selectOrderCount(int sellerStoreNo);
	
	//주문상품 번호로 환불정보 조회.
	RefundRequest selectRefundByNo(int orderSeqNo);
	
	//주문번호로 주문정보조회.
	Orders selectOrderInfo(String ordersNo);
	
	//셀러등록신청한 회원의 셀러정보조회.(이메일보내주기위함.)
	Seller selectSellerRegisterOne(int sellerStoreNo);
	
	//셀러정보수정
	int updateSellerInfo(Seller seller);
	
	//주문상품 번호로 교환정보 조회.
	ExchangeRequest selectExchangeByNo(int orderSeqNo);
}