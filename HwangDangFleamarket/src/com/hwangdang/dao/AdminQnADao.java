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

	//글번호로 게시글 삭제
	int deleteByNo(int no);

	//글번호로 게시글 수정변경 
	int updateByNo(HashMap param);

	//댓글등록 add
	int insertReploy(AdminQnAReply reply);

	//댓글삭제 remove
	void deleteReployByNo(int replyNo, int contentNo);

	//댓글수정 update
	void updateReployByNo(HashMap param);

}