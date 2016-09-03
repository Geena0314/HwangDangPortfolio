package com.hwangdang.service;

import java.util.List;

import com.hwangdang.vo.SellerNotice;

public interface SellerNoticeService {
	
	//판매자 소식글 전체 목록 조회
	public List<SellerNotice> getAllSellerNotice(int page, int sellerStoreNo);

	//판매자 소식들 카운트
	public int getCountSellerNotice(int sellerStoreNo);

	//판매자 소식글 번호로 소식글 조회
	public SellerNotice getSellerNoticeByNoticeNo(int sellerNoticeNo);

	//판매자 소식글 등록
	public int sellerRegisterNotice(SellerNotice sellerNotice);

	//판매자 소식글 수정
	public int sellerEditNotice(SellerNotice sellerNotice);

	//판매자 소식글 삭제
	public int removeSellerNotice(int sellerNoticeNo);
}