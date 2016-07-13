package com.hwangdang.daoimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.ProductOptionDao;
import com.hwangdang.vo.ProductOption;

@Repository
public class ProductOptionDaoImpl implements ProductOptionDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertOption(ProductOption productOption) {
		return session.insert("productMapper.insertOption", productOption);
	}
}
