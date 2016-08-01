package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.common.util.Constants;
import com.hwangdang.common.util.PagingBean;
import com.hwangdang.dao.MemberDao;
import com.hwangdang.dao.OrderDao;
import com.hwangdang.dao.SellerDao;
import com.hwangdang.service.SellerService;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Seller;

@Service
public class SellerSerivceImpl implements SellerService{

	@Autowired
	private SellerDao dao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public int getCountSeller() {
		return dao.selectCountSeller();
	}

	@Override
	public List getAllSeller(int page) {
		List<Seller> list = dao.selectAllSeller(page);
		for(Seller seller : list){
			seller.setSellerIntroduction(seller.getSellerIntroduction().replace(">", "&gt;"));
			seller.setSellerIntroduction(seller.getSellerIntroduction().replace("<", "&lt;"));
			seller.setSellerIntroduction(seller.getSellerIntroduction().replace("\n", "<br>"));
			seller.setSellerIntroduction(seller.getSellerIntroduction().replace(" ", "&nbsp;"));
		}
		return list;
	}

	@Override
	public Seller getSellerBySellerStoreNo(int sellerStoreNo) {
		Seller seller =  dao.selectSellerBySellerStoreNo(sellerStoreNo);
		return seller;
	}

	@Override
	public int insertSeller(Seller seller)
	{
		// TODO Auto-generated method stub
		return dao.insertSeller(seller);
	}

	@Override
	public HashMap<String, Object> selectOrderState(int page, int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemPerPage", Constants.ITEMS_PER_PAGE);
		map.put("page", page);
		map.put("sellerStoreNo", sellerStoreNo);
		map.put("orderList", dao.selectOrderState(map));
		PagingBean bean = new PagingBean(dao.selectOrderCount(sellerStoreNo), page);
		map.put("bean", bean);
		return map;
	}

	@Override
	public HashMap<String, Object> selectOrderAndRefund(String ordersNo, int orderSeqNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("orders", dao.selectOrderInfo(ordersNo));
		map.put("refund", dao.selectRefundByNo(orderSeqNo));
		return map;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteSeller(int sellerStoreNo, String memberId) {
		// TODO Auto-generated method stub
		memberDao.updateMemberAssignZero(memberId);
		return dao.deleteSellerByNo(sellerStoreNo);
	}

	@Override
	public HashMap<String, Object> selectOrderAndExchange(String ordersNo, int orderSeqNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("orders", dao.selectOrderInfo(ordersNo));
		ExchangeRequest exchange = dao.selectExchangeByNo(orderSeqNo);
		map.put("exchange", exchange);
		//기존 옵션 정보(교환전)를 담고있음.
		map.put("originalOption", orderDao.orderProductProductOption(orderSeqNo));
		//새로운 옵션 정보(교환할)
		map.put("exchangeOption", orderDao.selectOptionByOptionId(exchange.getOptionId()));
		return map;
	}

	@Override
	public HashMap<String, Object> selectSearchSeller(String keyword)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemsPerPage", Constants.ITEMS_PER_PAGE);
		map.put("page", 1);
		map.put("keyword", keyword);
		map.put("list", dao.selectSearchSeller(map));
		PagingBean bean = new PagingBean(dao.selectCountSellerByProduct(keyword), 1);
		map.put("pagingBean", bean);
		return map;
	}
}