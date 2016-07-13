package com.hwangdang.dao;

import java.util.List;

import com.hwangdang.vo.SellerNotice;

public interface SellerNoticeDao {
	int insertSellerNotice(SellerNotice sellerNotice);

	int updateSellerNotice(SellerNotice sellerNotice);

	int updateSellerNoticeHit(int sellerNoticeNo);

	int deleteSellerNotice(int sellerNoticeNo);

	int selectCountSellerNotice(int sellerStoreNo);

	List<SellerNotice> selectAllSellerNotice(int page, int sellerStoreNo);

	SellerNotice selectSellerNoticeByNoticeNo(int sellerNoticeNo);
}
