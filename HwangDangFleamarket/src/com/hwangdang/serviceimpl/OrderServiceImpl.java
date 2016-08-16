package com.hwangdang.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.common.util.Constants;
import com.hwangdang.common.util.PagingBean;
import com.hwangdang.dao.CartDao;
import com.hwangdang.dao.MemberDao;
import com.hwangdang.dao.OrderDao;
import com.hwangdang.dao.ProductDao;
import com.hwangdang.dao.SellerDao;
import com.hwangdang.service.OrderService;
import com.hwangdang.vo.ExchangeRequest;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.RefundRequest;

@Service
public class OrderServiceImpl implements OrderService
{
	@Autowired
	private OrderDao dao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private CartDao cartDao;
	
	public OrderServiceImpl()
	{
		// TODO Auto-generated constructor stub
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int refundHandle(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductStatus(orderSeqNo);
		HashMap<String, Object> map = dao.selectOptionAmount(orderSeqNo);
		return dao.updateOptionStock(map);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertRefundRequest(RefundRequest refund)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductRefundStatus(refund.getOrderSeqNo());
		return dao.insertRefundRequest(refund);
	}

	@Override
	public HashMap<String, Object> orderProductProductOption(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		
		//orderSeqNo로 order_product 와  product_option 조회.
		OrderProduct orderProduct = dao.orderProductProductOption(orderSeqNo);
		//productId로 상품옵션리스트 조회.
		List<ProductOption> optionList = productDao.selectOptionById(orderProduct.getProductId());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderProduct", orderProduct);
		map.put("optionList", optionList);
		//주문상품(수량), 상품(가격)
		OrderProduct price = dao.selectOrderProductAndProduct(orderSeqNo);
		map.put("price", price);
		//주문한 상품 총 가격
		int priceAll = (price.getProduct().getProductPrice() + orderProduct.getProductOption().getOptionAddPrice()) * price.getOrderAmount();
		map.put("priceAll", priceAll);
		return map;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertRequestExchange(ExchangeRequest exchange)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductExchangeStatus(exchange.getOrderSeqNo());
		return dao.insertRequestExchange(exchange);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteExchangeRequest(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		dao.updateOrderProductStatus11(orderSeqNo);
		return dao.deleteExchangeRequest(orderSeqNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int exchangeHandle(int orderSeqNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		
		//기존 옵션 재고량 ↑
		OrderProduct orderProduct = dao.orderProductProductOption(orderSeqNo);
		int originalStock = orderProduct.getOrderAmount(); //더해줘야하는 수량.
		int originalOptionId = orderProduct.getOptionId(); //기존의 옵션정보를 담고있는 옵션.
		
		map.put("originalStock", originalStock);
		map.put("originalOptionId", originalOptionId);
		dao.updatePlusOptionStock(map);
		
		//바꿀 옵션 재고량 ↓
		ExchangeRequest exchange = sellerDao.selectExchangeByNo(orderSeqNo);
		int exchangeStock = exchange.getExchangeStock(); //빼줘야하는 수량.
		int exchangeOptionId = exchange.getOptionId(); //교환 옵션정보를 담고있는 옵션.
		
		map.put("exchangeStock", exchangeStock);
		map.put("exchangeOptionId", exchangeOptionId);
		dao.updateMinusOptionStock(map);
		
		//주문상품 상태 8번(교환승인처리)로 변경.
		dao.updateOrderProductStatus8(orderSeqNo);
		
		//교환 정보 삭제
		return dao.deleteExchangeRequest(orderSeqNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateMileage(int orderSeqNo, int mileage)
	{
		// TODO Auto-generated method stub
		Orders orders = dao.selectOrdersOrderProduct(orderSeqNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberId", orders.getMemberId());
		map.put("memberMileage", mileage);
		return memberDao.updateMileage(map);
	}

	@Override
	public HashMap<String, Object> selectDiliveryStatus(String memberId, int page) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemsPerPage", Constants.ITEMS_PER_PAGE);
		map.put("page", page);
		map.put("memberId", memberId);
		PagingBean pageBean = new PagingBean(dao.selectCountOrderProduct(memberId), page);
		map.put("pagingBean", pageBean);
		
		ArrayList<OrderProduct> list = (ArrayList<OrderProduct>) dao.selectDiliveryStatus(map);
		map.put("diliveryStatus", list);
		return map;
	}

	@Override
	public HashMap<String, Object> selectRequestStatus(String memberId, int page) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemsPerPage", Constants.ITEMS_PER_PAGE);
		map.put("page", page);
		map.put("memberId", memberId);
		PagingBean pageBean = new PagingBean(dao.selectCountRequestOrderProduct(memberId), page);
		map.put("pagingBean", pageBean);
		
		ArrayList<OrderProduct> list = (ArrayList<OrderProduct>) dao.selectRequestStatus(map);
		map.put("requestStatus", list);
		return map;
	}

	@Override
	public HashMap<String, Object> selectPurchaseConfirm(String memberId, int page) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemsPerPage", Constants.ITEMS_PER_PAGE);
		map.put("page", page);
		map.put("memberId", memberId);
		PagingBean pageBean = new PagingBean(dao.selectCountPurchaseConfirm(memberId), page);
		map.put("pagingBean", pageBean);
		
		ArrayList<OrderProduct> list = (ArrayList<OrderProduct>) dao.selectPurchaseConfirm(map);
		map.put("purchaseConfirm", list);
		return map;
	}

	@Override
	public int updateCancelOrderProductStatus(int orderSeqNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		
		//주문 취소한 상품의 재고량 ↑
		OrderProduct orderProduct = dao.orderProductProductOption(orderSeqNo);
		int originalStock = orderProduct.getOrderAmount();
		int originalOptionId = orderProduct.getOptionId();
		
		map.put("originalStock", originalStock);
		map.put("originalOptionId", originalOptionId);
		dao.updatePlusOptionStock(map);
		return dao.updateCancelOrderProductStatus(orderSeqNo);
	}

	@Override
	public int updateConfirmOrderProductStatus(int orderSeqNo) {
		// TODO Auto-generated method stub
		return dao.updateConfirmOrderProductStatus(orderSeqNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int buyProductsHandle(Orders orders, ArrayList<OrderProduct> list, int[] cartNo, int memberMileage)
	{
		// TODO Auto-generated method stub
		//주문정보 등록
		int result = dao.insertOrders(orders);
		
		OrderProduct orderProduct = new OrderProduct();
		HashMap<String, Object> map = new HashMap<>();
		for(int i = 0; i < list.size(); i++)
		{
			orderProduct = list.get(i);
			
			//주문상품1개등록
			dao.insertOrderProduct(orderProduct);
			
			//옵션ID로 주문수량만큼 재고량 감소
			map.put("exchangeStock", orderProduct.getOrderAmount());
			map.put("exchangeOptionId", orderProduct.getOptionId());
			dao.updateMinusOptionStock(map);
			
			if(cartNo[0] == 99999)
				continue;
			//cartNo로 장바구니정보 삭제
			cartDao.deleteCart(cartNo[i]);
		}
		return result;
	}

	@Override
	public List<OrderProduct> selectDiliveryStatusByOrderNo(String ordersNo)
	{
		// TODO Auto-generated method stub
		return dao.selectDiliveryStatusByOrderNo(ordersNo);
	}
}