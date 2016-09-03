package com.hwangdang.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

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
		/*map.put("productId", productId);
		map.put("optionId", optionId);
		
		return dao.selectProductSellerOptionJoin(map);*/
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
}