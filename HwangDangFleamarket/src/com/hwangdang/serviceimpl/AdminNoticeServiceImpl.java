package com.hwangdang.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.dao.AdminNoticeDao;
import com.hwangdang.service.AdminNoticeService;
import com.hwangdang.vo.Notice;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService{
	
	@Autowired
	private AdminNoticeDao dao;

	@Override
	public int adminRegisterNotice(Notice notice) {
		return dao.insertNotice(notice);
	}

	@Override
	public int adminEditNotice(Notice notice) {
		return dao.updateNotice(notice);
	}

	@Override
	public List getAllNotice(int page) {
		List<Notice> list = dao.selectAllNotice(page);
		for(Notice notice : list){
			notice.setNoticeTitle(notice.getNoticeTitle().replace(">", "&gt;"));
			notice.setNoticeTitle(notice.getNoticeTitle().replace("<", "&lt;"));
			notice.setNoticeTitle(notice.getNoticeTitle().replace("\n", "<br>"));
			notice.setNoticeTitle(notice.getNoticeTitle().replace(" ", "&nbsp;"));
		}
		return list;
	}

	@Override
	public int getCountNotice() {
		return dao.selectCountNotice();
	}

	@Override
	public Notice getNoticeByNoticeNo(int noticeNo){
		Notice notice = dao.selectNoticeByNoticeNo(noticeNo);
		dao.updateNoticeHit(noticeNo);
		return notice;
	}

	@Override
	public int removNotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}
}
