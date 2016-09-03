package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.AdminNoticeDao;
import com.hwangdang.vo.Notice;

@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertNotice(Notice notice) {
		return session.insert("adminNoticeMapper.insertNotice", notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return session.update("adminNoticeMapper.updateNotice", notice);
	}

	@Override
	public int updateNoticeHit(int noticeNo) {
		return session.update("adminNoticeMapper.updateNoticeHit", noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return session.delete("adminNoticeMapper.deleteNoticeByNoticeNo", noticeNo);
	}
	
	
	@Override
	public int selectCountNotice() {
		return session.selectOne("adminNoticeMapper.selectCountNotice");
	}

	@Override
	public List<Notice> selectAllNotice(HashMap<String, Object> map) {
		return session.selectList("adminNoticeMapper.selectNoticePaging", map);
	}

	@Override
	public Notice selectNoticeByNoticeNo(int noticeNo) {
		return session.selectOne("adminNoticeMapper.selectNoticeByNoticeNo", noticeNo);
	}
}
