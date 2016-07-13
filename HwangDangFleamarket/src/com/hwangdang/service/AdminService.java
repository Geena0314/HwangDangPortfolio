package com.hwangdang.service;

import java.util.HashMap;

import com.hwangdang.vo.Seller;

public interface AdminService
{
	//셀러 등록 리스트 조회 + 페이징
	HashMap<String, Object> selectSellerRegister(int page);
	
	//셀러 - 멤버 조인.(관리자가 신청정보 확인.)
	Seller selectSellerMember(int sellerStoreNo);
	
	//판매자 신청 승인.
	int sellerRegisterRecognize(int sellerStoreNo, String memberId);
	
	//판매자 신청 거부.
	int deleteSellerByNo(int sellerStoreNo);
}