package com.hwangdang.dao;

import java.util.List;

import com.hwangdang.vo.Notice;

public interface AdminNoticeDao {
	
	int insertNotice(Notice notice);
	
	int updateNotice(Notice notice);
	
	int updateNoticeHit(int noticeNo);
	
	int deleteNotice(int noticeNo);

	int selectCountNotice();
	
	List<Notice> selectAllNotice(int page);
	
	Notice selectNoticeByNoticeNo(int noticeNo);
}
