package com.hwangdang.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.dao.BuyDao;
import com.hwangdang.dao.CartDao;
import com.hwangdang.dao.OrderDao;
import com.hwangdang.dao.ProductDao;
import com.hwangdang.dao.SellerDao;
import com.hwangdang.service.BuyService;
import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;

@Service
public class BuyServiceImpl implements BuyService {

	@Autowired
	private BuyDao dao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private CartDao cartDao;
	
	public BuyServiceImpl () { }
	
	@Override
	public HashMap<String,Object> selectProductProductOption(String productId, int optionId, int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();

		map.put("product", productDao.selectProductById(productId));
		map.put("productOption", orderDao.selectOptionByOptionId(optionId));
		map.put("seller", sellerDao.selectSellerRegisterOne(sellerStoreNo));
		return map;
	}

	@Override
	public ArrayList<Cart> selectCartByCartNo(int[] cartNo)
	{
		// TODO Auto-generated method stub
		ArrayList<Cart> cartList = new ArrayList<>();
		for(int i = 0; i < cartNo.length; i++)
		{
			cartList.add(cartDao.selectOneCartProductJoin(cartNo[i]));
		}
		return cartList;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int buyProductsHandle(Orders orders, ArrayList<OrderProduct> list, int[] cartNo, int memberMileage)
	{
		// TODO Auto-generated method stub
		//구매처리 로직
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
			orderDao.updateMinusOptionStock(map);
			
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
		//주문번호로 주문내역 검색
		return dao.selectDiliveryStatusByOrderNo(ordersNo);
	}
}