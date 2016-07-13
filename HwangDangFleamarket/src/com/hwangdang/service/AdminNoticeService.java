package com.hwangdang.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.Notice;

public interface AdminNoticeService {
	
	public List getAllNotice(int page);
	
	public int getCountNotice();
	
	public Notice getNoticeByNoticeNo(int noticeNo);
	
	@Transactional
	public int adminRegisterNotice(Notice notice);
	
	@Transactional
	public int adminEditNotice(Notice notice);
	
	@Transactional
	public int removNotice(int noticeNo);

}
