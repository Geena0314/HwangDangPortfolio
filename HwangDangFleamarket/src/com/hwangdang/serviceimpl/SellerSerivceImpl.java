package com.hwangdang.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.common.util.Constants;
import com.hwangdang.common.util.PagingBean;
import com.hwangdang.dao.SellerDao;
import com.hwangdang.service.SellerService;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Seller;

@Service
public class SellerSerivceImpl implements SellerService{

	@Autowired
	private SellerDao dao;
	
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
		/*List<Orders> orders= dao.selectOrderState(map);
		ArrayList<OrderProduct> orderProductList = new ArrayList<>();
		for(int i = 0; i < orders.size(); i++)
		{
			for(int o = 0; o < orders.get(i).getOrderProductList().size(); o++)
			{
				orderProductList.add(orders.get(i).getOrderProductList().get(o));
			}
		}
		map.put("orderProductList", orderProductList);*/
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
}