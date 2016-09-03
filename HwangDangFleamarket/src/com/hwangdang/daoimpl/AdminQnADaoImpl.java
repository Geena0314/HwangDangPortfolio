package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.AdminQnADao;
import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;

@Repository
public class AdminQnADaoImpl implements AdminQnADao {

	@Autowired
	private SqlSessionTemplate session;

	//게시글 insert 
	@Override
	public int insertAdminQnA(AdminQnA adminQnA){
		return session.insert("adminQnAMapper.insertAdminQnA", adminQnA);
	}
		
	//QnA게시판 전체 조회 -페이징
	@Override
	public List<AdminQnA> selectAdminQnAList(HashMap<String, Object> map){
		return session.selectList("adminQnAMapper.selectAdminQnAList" , map);
	}
	
	//게시판 전체글갯수 조회 
	@Override
	public int selectCountAdminQnA(){
		return session.selectOne("adminQnAMapper.selectCountAdminQnA");
	}
	
	//글번호로 게시글 조회
	@Override
	public AdminQnA selectAdminQnAByNo(int adminQnaNo){
		session.update("adminQnAMapper.updateAdminQnAHit", adminQnaNo);
		return session.selectOne("adminQnAMapper.selectAdminQnAByNo" , adminQnaNo);
	}
	
	//글삭제
	@Override
	public int deleteAdminQnA(int adminQnaNo) {
		// TODO Auto-generated method stub
		return session.delete("adminQnAMapper.deleteAdminQnA", adminQnaNo);
	}

	//글수정
	@Override
	public int updateAdminQnA(AdminQnA adminQnA) {
		// TODO Auto-generated method stub
		return session.update("adminQnAMapper.updateAdminQnA", adminQnA);
	}

	//답글등록
	@Override
	public int insertAdminQnAReply(AdminQnAReply adminQnAReply) {
		// TODO Auto-generated method stub
		return session.insert("adminQnAMapper.insertAdminQnAReply", adminQnAReply);
	}

	//답글 수정
	@Override
	public int updateAdminQnAReply(AdminQnAReply adminQnAReply) {
		// TODO Auto-generated method stub
		return session.update("adminQnAMapper.updateAdminQnAReply", adminQnAReply);
	}

	//답글 삭제
	@Override
	public int deleteAdminQnAReply(int adminReplyNo) {
		// TODO Auto-generated method stub
		return session.delete("adminQnAMapper.deleteAdminQnAReply", adminReplyNo);
	}

	//답글 등록 시 답변 여부 상태 변경
	@Override
	public int updateReplyExsitByNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.update("adminQnAMapper.updateReplyExsitByNo", map);
	}
}