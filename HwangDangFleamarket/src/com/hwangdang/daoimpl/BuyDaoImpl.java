package com.hwangdang.daoimpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

@Repository
public class BuyDaoImpl {

	
	public BuyDaoImpl(){ } 
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	//재고량 조회
	@Transactional
	public int selectProductStockByProductId(Map param){
		return session.selectOne("buy.product-stock-by-productId" ,param);
	}
	
	//orders INSERT
	@Transactional
	public int insertOrdersOne(Orders orders){
		return session.insert("buy.insert-orders" ,orders);
	}
	//order_product INSERT
	@Transactional
	public int insertOrderProductOne(OrderProduct orderProduct){
		return session.insert("buy.insert-order-product" ,orderProduct);
	}	
	//product select
	@Transactional
	public Product selectProductByProductId(String productId){
		return session.selectOne("buy.select-product-by-productId" ,productId);
	}	
	//제품옵션조회
	@Transactional
	public ProductOption selectProductOptionByOptionSubName(String optionSubName){
		return session.selectOne("buy.select-productOption-by-OptionSubName", optionSubName);
	}
	//셀러TB 조회 
	@Transactional
	public Seller selectSellerBySellerStoreNo(int sellerStoreNo){
		return session.selectOne("buy.select-seller-by-sellerStoreNo", sellerStoreNo);
	}
	
	//최근배송주소지 조회  
	@Transactional
	public Orders selectCurrentDeliveryAddress(String memberId){
		return session.selectOne("buy.select-orders-by-date", memberId);
	}
	//
	@Transactional
	public Orders selectOrdersByOrdersNo(String ordersNo){
		return session.selectOne("buy.select-orders-by-ordersNo", ordersNo);
	}
	
	@Transactional
	public void updateMemberMileage(Map param){ 
		session.update("buy.update-mileage-by-id", param);
	}
	
	@Transactional
	public Cart selectCartByCartNo(int cartNo){ 
		return session.selectOne("buy.select-cart-by-cartNo", cartNo);
	}
	
	@Transactional
	public ProductOption selectProductOptionByOptionNo(int optionNo){
		return session.selectOne("buy.select-product-option-by-optionNo", optionNo);
	}
	@Transactional
	public int selectOrderProductSeq(){
		return session.selectOne("buy.select_orderProduct_seq");
	}
	
	@Transactional
	public int updateProductStockByProductId(Map param ){
		return session.update("buy.update-productStock-by-productId" ,param);
	}
	
	@Transactional
	public int updateOptionStockByOptionId(Map param ){
		return session.update("buy.update-optionStock-by-optionId" , param);
	}
	@Transactional
	public List<Product> selectProductByLikeKeyword(Map param ){
		return session.selectList("buy.select-product-by-like" , param);
	}
	@Transactional
	public int selectProductCountByLike(String keyword){
		return session.selectOne("buy.select-product-by-totalItemsCount" , keyword);
	}
	
}
