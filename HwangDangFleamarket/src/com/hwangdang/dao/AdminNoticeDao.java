package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Notice;

public interface AdminNoticeDao {
	
	//관리자 게시글 등록
	int insertNotice(Notice notice);
	
	//관리자 게시글 수정
	int updateNotice(Notice notice);
	
	//관리자 게시글 조회수 올리기
	int updateNoticeHit(int noticeNo);
	
	//관리자 게시글 삭제
	int deleteNotice(int noticeNo);

	//관리자 게시글 카운트
	int selectCountNotice();
	
	//관리자 게시글 목록 조회
	List<Notice> selectAllNotice(HashMap<String, Object> map);
	
	//관리자 게시글 번호로 게시글 조회
	Notice selectNoticeByNoticeNo(int noticeNo);
}
