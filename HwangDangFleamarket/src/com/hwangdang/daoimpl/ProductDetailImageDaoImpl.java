package com.hwangdang.daoimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.ProductDetailImageDao;
import com.hwangdang.vo.ProductDetailImage;

@Repository
public class ProductDetailImageDaoImpl implements ProductDetailImageDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertDetailImage(ProductDetailImage productDetailImage) {
		return session.insert("productMapper.insertDetailImage", productDetailImage);
	}
}
