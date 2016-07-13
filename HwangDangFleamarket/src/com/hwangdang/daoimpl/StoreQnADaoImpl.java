package com.hwangdang.daoimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.StoreQnADao;
import com.hwangdang.vo.StoreQnA;

@Repository
public class StoreQnADaoImpl implements StoreQnADao
{
	@Autowired
	private SqlSessionTemplate session;
	
	public StoreQnADaoImpl() 
	{

	}

	@Override
	public int insertStoreQnA(StoreQnA qna)
	{
		// TODO Auto-generated method stub
		return session.insert("storeQnAMapper.insertStoreQnA", qna);
	}

	@Override
	public int selectQnAPublished(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("storeQnAMapper.selectQnAPublished", storeQnANo);
	}

	@Override
	public String selectSellerByNo(int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectSellerByNo", sellerStoreNo);
	}

	@Override
	public String selectQnAWriterByNo(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("storeQnAMapper.selectQnAWriterByNo", storeQnANo);
	}

	@Override
	public int deleteQnAByno(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return session.delete("storeQnAMapper.deleteQnAByno", storeQnANo);
	}
}