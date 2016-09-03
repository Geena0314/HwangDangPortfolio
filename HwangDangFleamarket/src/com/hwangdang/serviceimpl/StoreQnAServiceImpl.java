package com.hwangdang.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.dao.StoreQnADao;
import com.hwangdang.service.StoreQnAService;
import com.hwangdang.vo.StoreQnA;

@Service
public class StoreQnAServiceImpl implements StoreQnAService
{
	@Autowired
	private StoreQnADao dao;
	
	public StoreQnAServiceImpl()
	{
		// TODO Auto-generated constructor stub
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertStoreQnA(StoreQnA qna)
	{
		// TODO Auto-generated method stub
		return dao.insertStoreQnA(qna);
	}

	@Override
	public int selectQnAPublished(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return dao.selectQnAPublished(storeQnANo);
	}

	@Override
	public String selectSellerByNo(int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		return dao.selectSellerByNo(sellerStoreNo);
	}

	@Override
	public String selectQnAWriterByNo(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return dao.selectQnAWriterByNo(storeQnANo);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int deleteQnAByno(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return dao.deleteQnAByno(storeQnANo);
	}
}