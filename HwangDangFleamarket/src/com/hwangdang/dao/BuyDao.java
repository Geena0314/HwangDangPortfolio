package com.hwangdang.dao;

import java.util.HashMap;

import com.hwangdang.vo.Product;

public interface BuyDao 
{
	//상품, 판매자, Option 1:1:1조인
	Product selectProductSellerOptionJoin(HashMap<String,Object> map);
}