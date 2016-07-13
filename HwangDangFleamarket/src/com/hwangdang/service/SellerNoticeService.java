package com.hwangdang.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.SellerNotice;

public interface SellerNoticeService {
	public List getAllSellerNotice(int page, int sellerStoreNo);

	public int getCountSellerNotice(int sellerStoreNo);

	public SellerNotice getSellerNoticeByNoticeNo(int sellerNoticeNo);

	@Transactional
	public int sellerRegisterNotice(SellerNotice sellerNotice);

	@Transactional
	public int sellerEditNotice(SellerNotice sellerNotice);

	@Transactional
	public int removeSellerNotice(int sellerNoticeNo);
}
