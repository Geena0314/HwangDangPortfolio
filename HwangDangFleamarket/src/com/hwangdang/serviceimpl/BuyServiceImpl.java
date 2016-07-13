package com.hwangdang.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.daoimpl.BuyDaoImpl;
import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

@Service
public class BuyServiceImpl {

	@Autowired
	private BuyDaoImpl dao;
	
	public BuyServiceImpl () { }
	
	//바로구매페이지 이동전 재고량조회
	public int getProductStockByProductId(Map param){
		return dao.selectProductStockByProductId(param);
	}
	
	//바로구매하기 - Orders , Order_product INSERT 
	public int addProductOne(Orders orders , OrderProduct orderProduct){
		int flag = dao.insertOrdersOne(orders);
		flag = dao.insertOrderProductOne(orderProduct);
		return flag;
	}
	
	/*** 1 ***/
	//장바구니 구매하기 - 1개 Orders
	public int addProductN(Orders orders){
		int flag = dao.insertOrdersOne(orders);
		return flag;
	}
	/*** 2 ***/
	//장바구니 구매하기 - N개 Order_product INSERT
	public int addProductN(OrderProduct orderProduct){
		int flag = dao.insertOrderProductOne(orderProduct);
		return flag;
	}
	
	
	
	//상품 정보 조회 - Product TB 
	public Product getProductInfo(String productId){
		return dao.selectProductByProductId(productId);
	}
	//상품옵션 조회 - product_option TB  : 옵션명으로 조회 
	public ProductOption getProductOptionByOptionSubName(String optionSubName){
		return dao.selectProductOptionByOptionSubName(optionSubName);
	}
	//상품옵션 조회 - product_option TB  :옵션NO 로조회 
		public ProductOption getProductOptionInfoByoptionNo(int optionNo){
			return dao.selectProductOptionByOptionNo(optionNo);
		}
		
	// 셀러의 스토어상호명 조회 
	public Seller getSellerByNo(int sellerStoreNo){
		return dao.selectSellerBySellerStoreNo(sellerStoreNo);
	}
	
	//상품옵션 조회 
	public Orders getcurrentDeliveryAddress(String memberId){
		return dao.selectCurrentDeliveryAddress(memberId);
	}
	
	//orders TB조회  구매성공한후 buy-product-one-success.jsp 에서 보여주기위해  
	public Orders getOrdersByOrdersNo(String ordersNo){
		return dao.selectOrdersByOrdersNo(ordersNo);
	}
	
	// 구매시 마일리지 사용하면 마일리지 수정  
	public void setMemberMileage(Map param){
		dao.updateMemberMileage(param);
	}
	
	// 카드정보조회   
	public Cart getCartByCartNo(int cartNo){
		return dao.selectCartByCartNo(cartNo);
	}
	// order_product TB 시퀀스 조회    
	public int getOrderProductSeq(){
		return dao.selectOrderProductSeq();
	}
	
	// product TB 전체상품 수량 변경 (마이너스) 
	public int setProductStockByProductId(Map param){
		return dao.updateProductStockByProductId(param);
	}
	// product_option TB 개별상품 수량 변경 (마이너스) 
	public int setOptionStockByOptionId(Map param){
		return dao.updateOptionStockByOptionId(param);
	}
	
	// 상품명으로 제품들 조회 LIKE keyword
	public List<Product> getProductByLikeKeyword(Map param){
		return dao.selectProductByLikeKeyword(param);
	}
	
	// 키워드로 조회한 아이템의 토탈갯수 
		public int getProductTotalByLikeKeyword(String keyword){
			return dao.selectProductCountByLike(keyword);
		}
}
