package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hwangdang.vo.Cart;
import com.hwangdang.vo.OrderProduct;
import com.hwangdang.vo.Orders;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Seller;

public interface BuyDao 
{
	//상품, 판매자, Option 1:1:1조인
	Product selectProductSellerOptionJoin(HashMap<String,Object> map);
}