package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;

public interface BuyDao 
{
	//상품, 판매자, Option 1:1:1조인
	Product selectProductSellerOptionJoin(HashMap<String,Object> map);
	
	//주문정보 등록
	int insertOrders(Orders orders);
	
	//주문번호로 주문내역 검색
	List<OrderProduct> selectDiliveryStatusByOrderNo(String ordersNo);
	
	//주문상품 등록
	int insertOrderProduct(OrderProduct orderProduct);
}