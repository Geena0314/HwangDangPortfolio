package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.SellerNoticeDao;
import com.hwangdang.vo.SellerNotice;

@Repository
public class SellerNoticeDaoImpl implements SellerNoticeDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertSellerNotice(SellerNotice sellerNotice) {
		return session.insert("sellerNoticeMapper.insertSellerNotice", sellerNotice);
	}

	@Override
	public int updateSellerNotice(SellerNotice sellerNotice) {
		return session.update("sellerNoticeMapper.updateSellerNotice", sellerNotice);
	}

	@Override
	public int updateSellerNoticeHit(int sellerNoticeNo) {
		return session.update("sellerNoticeMapper.updateSellerNoticeHit", sellerNoticeNo);
	}

	@Override
	public int deleteSellerNotice(int sellerNoticeNo) {
		return session.delete("sellerNoticeMapper.deleteSellerNoticeByNoticeNo", sellerNoticeNo);
	}

	@Override
	public int selectCountSellerNotice(int sellerStoreNo) {
		return session.selectOne("sellerNoticeMapper.selectCountSellerNotice", sellerStoreNo);
	}

	@Override
	public List<SellerNotice> selectAllSellerNotice(HashMap<String, Object> map) {
		return session.selectList("sellerNoticeMapper.selectSellerNoticePaging", map);
	}

	@Override
	public SellerNotice selectSellerNoticeByNoticeNo(int sellerNoticeNo) {
		return session.selectOne("sellerNoticeMapper.selectSellerNoticeByNoticeNo", sellerNoticeNo);
	}
}
