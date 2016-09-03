package com.hwangdang.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;

public interface AdminQnAService {

	//페이징 게시판 글 등록 
	int insertAdminQnA(AdminQnA adminQnA);

	//페이징 게시판 리스트 조회 
	List<AdminQnA> selectAdminQnAList(int page);

	//게시판의 전체글 갯수 조회 
	int selectCountAdminQnA();

	//글번호로 글조회
	AdminQnA selectAdminQnAByNo(int adminQnaNo);

	//글삭제
	int deleteAdminQnA(int adminQnaNo);

	//글수정
	int updateAdminQnA(AdminQnA adminQnA);

	//답글등록
	int insertAdminQnAReply(AdminQnAReply adminQnAReply);

	//답글수정
	int updateAdminQnAReply(AdminQnAReply adminQnAReply);
		
	//답글삭제
	int deleteAdminQnAReply(int adminReplyNo);
}