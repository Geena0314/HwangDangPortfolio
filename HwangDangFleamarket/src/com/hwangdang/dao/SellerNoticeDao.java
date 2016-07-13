package com.hwangdang.dao;

import java.util.List;

import com.hwangdang.vo.SellerNotice;

public interface SellerNoticeDao {
	
	//스토어 소식글 등록
	int insertSellerNotice(SellerNotice sellerNotice);

	//스토어 소식글 수정
	int updateSellerNotice(SellerNotice sellerNotice);

	//스토어 소식글 조회수 올리기
	int updateSellerNoticeHit(int sellerNoticeNo);

	//스토어 소식글 삭제
	int deleteSellerNotice(int sellerNoticeNo);

	//스토어 소식글 카운트
	int selectCountSellerNotice(int sellerStoreNo);

	//스토어 소식글 목록 조회
	List<SellerNotice> selectAllSellerNotice(int page, int sellerStoreNo);

	//스토어 소식글 번호로 소식글 조회
	SellerNotice selectSellerNoticeByNoticeNo(int sellerNoticeNo);
}
