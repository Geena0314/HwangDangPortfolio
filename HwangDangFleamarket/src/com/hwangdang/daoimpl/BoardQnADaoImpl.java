package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.common.util.Constants;
import com.hwangdang.dao.BoardQnADao;
import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;

@Repository
public class BoardQnADaoImpl implements BoardQnADao {

	@Autowired
	private SqlSessionTemplate session;

	
	//게시글 추가전  현재 시퀀스값 조회
	@Override
	public int selectQnABoardSeq(){
		return session.selectOne("boardQnA.select-get-QnA-no");
	}
	
	//게시글 insert 
	@Override
	public int insertAdminQnA(AdminQnA adminQnA){
		return session.insert("boardQnA.insert", adminQnA);
	}
		
	//QnA게시판 전체 조회 -페이징
	@Override
	public List selectAllQnABoard(int page){
		HashMap<String ,Object> map = new HashMap();
		map.put("page", page);
		map.put("itemPerPage", Constants.ITEMS_PER_PAGE);
		return session.selectList("boardQnA.select-list-paging" , map);
	}
	//게시판 전체글갯수 조회 
	@Override
	public int selectTotalItems(){
		return session.selectOne("boardQnA.select-list-count");
	}
	
	//글번호로 게시글 조회
	@Override
	public AdminQnA selectByNo(int no){
		session.update("boardQnA.update-hit", no);
		return session.selectOne("boardQnA.select-one-detail" ,no);
	}
	//글번호로 게시글 삭제
	@Override
	public int deleteByNo(int no){
		int cnt = session.delete("boardQnA.delete-by-no", no);
		return cnt;
	}
	//글번호로 게시글 수정변경 
	@Override
	public int updateByNo(HashMap param){
		return session.update("boardQnA.update-by-no", param);
	}
	//댓글등록 add
	@Override
	public int insertReploy(AdminQnAReply reply){
		//System.out.println("글번호 : " + reply.getAdminQnaNo());
		int cnt = session.update("boardQnA.update-by-no-reply-exsit", reply.getAdminQnaNo());
		cnt =session.insert("boardQnA.insert-reply", reply);
		return cnt;
	}  
	//댓글삭제 remove
	@Override
	public void deleteReployByNo(int replyNo , int contentNo){ 
		//adminQnA 컬럼 'f'으로 변경 
		session.update("boardQnA.update-by-no-reply-exsit-f",contentNo);
		//댓글삭제
		session.delete("boardQnA.delete-reply-by-no", replyNo);
	}
	//댓글수정 update
	@Override
	public void updateReployByNo(HashMap param){
		session.update("boardQnA.update-reply-by-no", param);
	}
}
