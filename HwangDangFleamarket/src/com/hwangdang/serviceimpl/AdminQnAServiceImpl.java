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
	@Transactional(rollbackFor=Exception.class)
	public AdminQnA selectAdminQnAByNo(int adminQnaNo){
		return dao.selectAdminQnAByNo(adminQnaNo);
	}

	//글번호로 글삭제
	@Override
	@Transactional(rollbackFor=Exception.class)
		public void removeAdminQnAByNo(int no){
			int cnt = dao.deleteByNo(no);
			/*if(cnt ==1){
				System.out.println("삭제성공");
			}*/
		}
	//글번호로 글삭제
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int setAdminQnAByNo(HashMap param){
		return dao.updateByNo(param);
	}
	
	//댓글 입력 add
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int addReply(AdminQnAReply reply){
		return dao.insertReploy(reply);
	}	
	
	//댓글 삭제 remove
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void removeReplyByNo(int replyNo , int contentNo ){
		dao.deleteReployByNo(replyNo ,contentNo );
	}	
	
	//댓글 수정 remove
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void setReplyByNo(HashMap param ){
		dao.updateReployByNo(param);
	}		  
}