package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.dao.BuyDao;
import com.hwangdang.dao.OrderDao;
import com.hwangdang.dao.ProductDao;
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
	
	public BuyServiceImpl () { }
	
	//바로구매페이지 이동전 재고량조회
	@Override
	public int getProductStockByProductId(Map param){
		return dao.selectProductStockByProductId(param);
	}
	
	//바로구매하기 - Orders , Order_product INSERT 
	@Override
	public int addProductOne(Orders orders , OrderProduct orderProduct){
		int flag = dao.insertOrdersOne(orders);
		System.out.println(orderProduct);
		flag = dao.insertOrderProductOne(orderProduct);
		return flag;
	}
	
	/*** 1 ***/
	//장바구니 구매하기 - 1개 Orders
	@Override
	public int addProductN(Orders orders){
		int flag = dao.insertOrdersOne(orders);
		return flag;
	}
	/*** 2 ***/
	//장바구니 구매하기 - N개 Order_product INSERT
	@Override
	public int addProductN(OrderProduct orderProduct){
		int flag = dao.insertOrderProductOne(orderProduct);
		return flag;
	}
	
	
	
	//상품 정보 조회 - Product TB 
	@Override
	public Product getProductInfo(String productId){
		return dao.selectProductByProductId(productId);
	}
	//상품옵션 조회 - product_option TB  : 옵션명으로 조회 
	@Override
	public ProductOption getProductOptionByOptionSubName(String optionSubName){
		return dao.selectProductOptionByOptionSubName(optionSubName);
	}
	//상품옵션 조회 - product_option TB  :옵션NO 로조회 
		@Override
		public ProductOption getProductOptionInfoByoptionNo(int optionNo){
			return dao.selectProductOptionByOptionNo(optionNo);
		}
		
	// 셀러의 스토어상호명 조회 
	@Override
	public Seller getSellerByNo(int sellerStoreNo){
		return dao.selectSellerBySellerStoreNo(sellerStoreNo);
	}
	
	//상품옵션 조회 
	@Override
	public Orders getcurrentDeliveryAddress(String memberId){
		return dao.selectCurrentDeliveryAddress(memberId);
	}
	
	//orders TB조회  구매성공한후 buy-product-one-success.jsp 에서 보여주기위해  
	@Override
	public Orders getOrdersByOrdersNo(String ordersNo){
		return dao.selectOrdersByOrdersNo(ordersNo);
	}
	
	// 구매시 마일리지 사용하면 마일리지 수정  
	@Override
	public void setMemberMileage(Map param){
		dao.updateMemberMileage(param);
	}
	
	// 카드정보조회   
	@Override
	public Cart getCartByCartNo(int cartNo){
		return dao.selectCartByCartNo(cartNo);
	}
	
	// product TB 전체상품 수량 변경 (마이너스) 
	@Override
	public int setProductStockByProductId(Map param){
		return dao.updateProductStockByProductId(param);
	}
	// product_option TB 개별상품 수량 변경 (마이너스) 
	@Override
	public int setOptionStockByOptionId(Map param){
		return dao.updateOptionStockByOptionId(param);
	}
	
	// 상품명으로 제품들 조회 LIKE keyword
	@Override
	public List<Product> getProductByLikeKeyword(Map param){
		return dao.selectProductByLikeKeyword(param);
	}
	
	// 키워드로 조회한 아이템의 토탈갯수 
	@Override
	public int getProductTotalByLikeKeyword(String keyword){
		return dao.selectProductCountByLike(keyword);
	}

	@Override
	public HashMap<String, Object> selectProductProductOption(String productId, int optionId)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("product", productDao.selectProductById(productId));
		map.put("productOption", orderDao.selectOptionByOptionId(optionId));
		return map;
	}
}