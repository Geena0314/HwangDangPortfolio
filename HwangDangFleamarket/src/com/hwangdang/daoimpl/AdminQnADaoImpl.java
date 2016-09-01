package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.common.util.Constants;
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
	public List<AdminQnA> selectAdminQnAList(int page){
		HashMap<String ,Object> map = new HashMap<>();
		map.put("page", page);
		map.put("itemsPerPage", Constants.ITEMS_PER_PAGE);
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
		session.update("adminQnAMapper.update-hit", adminQnaNo);
		return session.selectOne("adminQnAMapper.selectAdminQnAByNo" , adminQnaNo);
	}
	//글번호로 게시글 삭제
	@Override
	public int deleteByNo(int no){
		int cnt = session.delete("adminQnAMapper.delete-by-no", no);
		return cnt;
	}
	//글번호로 게시글 수정변경 
	@Override
	public int updateByNo(HashMap param){
		return session.update("adminQnAMapper.update-by-no", param);
	}
	//댓글등록 add
	@Override
	public int insertReploy(AdminQnAReply reply){
		//System.out.println("글번호 : " + reply.getAdminQnaNo());
		int cnt = session.update("adminQnAMapper.update-by-no-reply-exsit", reply.getAdminQnaNo());
		cnt =session.insert("adminQnAMapper.insert-reply", reply);
		return cnt;
	}  
	//댓글삭제 remove
	@Override
	public void deleteReployByNo(int replyNo , int contentNo){ 
		//adminQnA 컬럼 'f'으로 변경 
		session.update("adminQnAMapper.update-by-no-reply-exsit-f",contentNo);
		//댓글삭제
		session.delete("adminQnAMapper.delete-reply-by-no", replyNo);
	}
	//댓글수정 update
	@Override
	public void updateReployByNo(HashMap param){
		session.update("adminQnAMapper.update-reply-by-no", param);
	}
}
