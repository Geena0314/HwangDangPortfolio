package com.hwangdang.service;

import java.util.List;

import com.hwangdang.vo.Notice;

public interface AdminNoticeService {
	
	//관리자 게시글 전체 목록 조회
	public List<Notice> getAllNotice(int page);
	
	//관리자 게시글 카운트
	public int getCountNotice();
	
	//관리자 게시글 번호로 게시글 조회
	public Notice getNoticeByNoticeNo(int noticeNo);
	
	//관리자 게시글 등록
	public int adminRegisterNotice(Notice notice);
	
	//관리자 게시글 수정
	public int adminEditNotice(Notice notice);
	
	//관리자 게시글 삭제
	public int removNotice(int noticeNo);

}
