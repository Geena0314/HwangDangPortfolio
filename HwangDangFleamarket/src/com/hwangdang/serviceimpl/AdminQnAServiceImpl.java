package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.dao.AdminQnADao;
import com.hwangdang.service.AdminQnAService;
import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;

@org.springframework.stereotype.Service
public class AdminQnAServiceImpl implements AdminQnAService{
	
	@Autowired
	private AdminQnADao dao;
	
	//페이징 게시판 글 등록 
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertAdminQnA(AdminQnA adminQnA){
		return dao.insertAdminQnA(adminQnA);
	}
	
	//게시판의 전체글 갯수 조회 
	@Override
	public int selectCountAdminQnA() {
		// TODO Auto-generated method stub
		return dao.selectCountAdminQnA();
	}
	
	//페이징 게시판 리스트 조회 
	@Override
	public List<AdminQnA> selectAdminQnAList(int page) {
		// TODO Auto-generated method stub
		List<AdminQnA> list = dao.selectAdminQnAList(page);
		for(AdminQnA adminQnA : list){
			adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace(">", "&gt;"));
			adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace("<", "&lt;"));
			adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace("\n", "<br>"));
			adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace(" ", "&nbsp;"));
		}
		return list;
	}
	
	//글번호로 글조회
	@Override
	public AdminQnA selectAdminQnAByNo(int adminQnaNo){
		return dao.selectAdminQnAByNo(adminQnaNo);
	}

	//글수정
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int updateAdminQnA(AdminQnA adminQnA) {
		// TODO Auto-generated method stub
		return dao.updateAdminQnA(adminQnA);
	}

	//글삭제
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int deleteAdminQnA(int adminQnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteAdminQnA(adminQnaNo);
	}
	
	//답글 등록
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertAdminQnAReply(AdminQnAReply adminQnAReply) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("adminQnaReplyExist", "t");
		map.put("adminQnaNo", adminQnAReply.getAdminQnaNo());
		dao.updateReplyExsitByNo(map);
		return dao.insertAdminQnAReply(adminQnAReply);
	}
	
	//답글 수정
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int updateAdminQnAReply(AdminQnAReply adminQnAReply) {
		// TODO Auto-generated method stub
		return dao.updateAdminQnAReply(adminQnAReply);
	}

	//답글 삭제
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int deleteAdminQnAReply(int adminReplyNo) {
		// TODO Auto-generated method stub
		return dao.deleteAdminQnAReply(adminReplyNo);
	}	
}