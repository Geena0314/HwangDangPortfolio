package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;

public interface AdminQnADao {

	//게시글 insert 
	int insertAdminQnA(AdminQnA adminQnA);

	//QnA게시판 전체 조회 -페이징
	List<AdminQnA> selectAdminQnAList(int page);

	//게시판 전체글갯수 조회 
	int selectCountAdminQnA();

	//글번호로 게시글 조회
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
	
	//답변 등록 시 답변 여부 상태 변경
	int updateReplyExsitByNo(HashMap<String, Object> map);
}