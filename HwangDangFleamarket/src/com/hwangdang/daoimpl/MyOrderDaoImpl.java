package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.common.util.Constants;
import com.hwangdang.dao.MyOrderDao;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Seller;

@Repository
public class MyOrderDaoImpl implements  MyOrderDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public MyOrderDaoImpl() { }
	
	//배송현황조회 - 0:입금대기중 ,1:결제완료 , 2:배송준비중 , 3:배송중  
	@Override
	@Transactional
	public List<Orders> selectOrdersMain(String buyer , int page ){
		HashMap<String ,Object> map = new HashMap();
		map.put("page", page);
		map.put("itemPerPage", Constants.ITEMS_PER_PAGE);
		map.put("buyer", buyer);
		return session.selectList("myorder.select-diliver-status" , map);
	}
	
	//주문 취소리스트 조회  - 5:주문취소 , 6:교환신청 , 7:환불신청
		@Override
		@Transactional
		public List<Orders> selectOrdersCancel(String buyer , int page ){
			Map<String ,Object> map = new HashMap<>();
			map.put("page", page);
			map.put("itemPerPage", Constants.ITEMS_PER_PAGE);
			map.put("buyer", buyer);
			return session.selectList("myorder.select-diliver-cancel" , map);
		}
		
	
	//배송완료 조회  - 4: 배송완료 
	@Override
	@Transactional
	public List<Orders> selectOrdersSuccess(String buyer, int page ){
		Map<String ,Object> map = new HashMap<>();
		map.put("page", page);
		map.put("itemPerPage", Constants.ITEMS_PER_PAGE);
		map.put("buyer", buyer);
		return session.selectList("myorder.select-diliver-success" , map);
	}
	
	
	//배송중 3: 배송완료4: 를 환불신청 :6으로 변경 
	@Override
	@Transactional
	public int updateOrdersStatus(HashMap<String,Object> map ){
		return session.update("myorder.update-by-orderNo" , map);
	}
		
	//셀러정보 조회 
	@Override
	@Transactional
	public Seller selectSellerBySellerName(String sellerName){
		return session.selectOne("myorder.select-seller-by-sellerName",sellerName) ;
	}
	//order TB 튜플총개수 조회 
	@Override
	@Transactional
	public int selectOrdersTotalItems(Map<String,Integer> param){
		return session.selectOne("myorder.select-orders-total-couont" , param);
	}
	
	@Override
	@Transactional
	public int insertExchangeRequestByOrdersNo(ExchangeRequest exchage){
		
		int cnt = session.insert("myorder.insert-requestExchange" , exchage);
		Map<String,Object> param = new HashMap<>();
		param.put("status", 5);
		param.put("no",exchage.getOrderSeqNo());
		cnt = session.update("myorder.update-by-orderNo",param );
		return cnt;
	}
	
}
