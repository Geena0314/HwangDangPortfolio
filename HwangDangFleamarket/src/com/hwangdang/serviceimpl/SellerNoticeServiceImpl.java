package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.common.util.Constants;
import com.hwangdang.dao.SellerNoticeDao;
import com.hwangdang.service.SellerNoticeService;
import com.hwangdang.vo.SellerNotice;

@Service
public class SellerNoticeServiceImpl implements SellerNoticeService{
	
	@Autowired
	private SellerNoticeDao dao;

	@Override
	public List<SellerNotice> getAllSellerNotice(int page, int sellerStoreNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("itemsPerPage", Constants.ITEMS_PER_PAGE);
		map.put("sellerStoreNo", sellerStoreNo);
		List<SellerNotice> list = dao.selectAllSellerNotice(map);
		
		for(SellerNotice sellerNotice : list){
			sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace(">", "&gt;"));
			sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace("<", "&lt;"));
			sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace("\n", "<br>"));
			sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace(" ", "&nbsp;"));
		}
		return list;
	}

	@Override
	public int getCountSellerNotice(int sellerStoreNo) {
		return dao.selectCountSellerNotice(sellerStoreNo);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public SellerNotice getSellerNoticeByNoticeNo(int sellerNoticeNo) {
		dao.updateSellerNoticeHit(sellerNoticeNo);
		return dao.selectSellerNoticeByNoticeNo(sellerNoticeNo);
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int sellerRegisterNotice(SellerNotice sellerNotice) {
		return dao.insertSellerNotice(sellerNotice);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int sellerEditNotice(SellerNotice sellerNotice) {
		return dao.updateSellerNotice(sellerNotice);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int removeSellerNotice(int sellerNoticeNo) {
		return dao.deleteSellerNotice(sellerNoticeNo);
	}
}