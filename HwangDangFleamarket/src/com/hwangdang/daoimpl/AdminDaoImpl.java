package com.hwangdang.daoimpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.AdminDao;

@Repository
public class AdminDaoImpl implements AdminDao
{
	@Autowired
	private SqlSessionTemplate session;
	
	public AdminDaoImpl()
	{
		// TODO Auto-generated constructor stub
	}
}