package com.hwangdang.dao;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

public interface BuyDao {

	//재고량 조회
	int selectProductStockByProductId(Map param);

	//orders INSERT
	int insertOrdersOne(Orders orders);

	//order_product INSERT
	int insertOrderProductOne(OrderProduct orderProduct);

	//product select
	Product selectProductByProductId(String productId);

	//제품옵션조회
	ProductOption selectProductOptionByOptionSubName(String optionSubName);

	//셀러TB 조회 
	Seller selectSellerBySellerStoreNo(int sellerStoreNo);

	//최근배송주소지 조회  
	Orders selectCurrentDeliveryAddress(String memberId);

	//
	Orders selectOrdersByOrdersNo(String ordersNo);

	void updateMemberMileage(Map param);

	Cart selectCartByCartNo(int cartNo);

	ProductOption selectProductOptionByOptionNo(int optionNo);

	int selectOrderProductSeq();

	int updateProductStockByProductId(Map param);

	int updateOptionStockByOptionId(Map param);

	List<Product> selectProductByLikeKeyword(Map param);

	int selectProductCountByLike(String keyword);

}