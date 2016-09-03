package com.hwangdang.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.AdminQnAService;
import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;

@Controller
@RequestMapping("/adminQnA")
public class AdminQnAController {
	
	@Autowired
	private AdminQnAService service;
	
	//QnA 목록
	@RequestMapping("/adminQnAList")
	public ModelAndView adminQnAList(int page){
		HashMap<String, Object> map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.selectCountAdminQnA(), page);
		ArrayList<AdminQnA> list = (ArrayList<AdminQnA>)service.selectAdminQnAList(page);
		map.put("list", list);
		map.put("pagingBean", pagingBean);
		return new ModelAndView("admin/admin_QnA_list.tiles", map);
	}
	
	//QnA 등록 폼 이동
	@RequestMapping("/registerAdminQnAForm")
	public String registerAdminQnAForm(){
		return "admin/admin_register_QnA.tiles";
	}
	
	//QnA 등록
	@RequestMapping("/registerAdminQnA")
	public ModelAndView registerAdminQnA(@ModelAttribute @Valid AdminQnA adminQnA, BindingResult errors, int page, HttpServletRequest request){
		if(errors.hasErrors()){
			request.setAttribute("errors", errors);
			return new ModelAndView("admin/admin_register_QnA.tiles");
		}
		adminQnA.setAdminQnaDate(new Date());
		service.insertAdminQnA(adminQnA);
		adminQnA = convertor(adminQnA);
		HashMap<String, Object> map = new HashMap<>();
		map.put("adminQnA", adminQnA);
		map.put("page", page);
		return new ModelAndView("admin/admin_QnA_detail.tiles", map); // 일단은 list로 넘겨줌
	}
	
	//QnA 조회시 비공개 글 비밀번호 확인폼
	@RequestMapping("/confirmAdminQnAPassword")
	@ResponseBody
	public int confirmAdminQnAPassword(int page, int adminQnaNo, String adminQnaPassword){
		AdminQnA adminQnA = service.selectAdminQnAByNo(adminQnaNo);
		if(adminQnA.getAdminQnaPassword().equals(adminQnaPassword)){
			return 1; // 비밀번호 일치
		}
		return 0; // 비밀번호 불일치
	}

	//QnA 수정폼
	@RequestMapping("/adminQnAEditForm")
	public ModelAndView adminQnAEditForm(int page, int adminQnaNo){
		return new ModelAndView("admin/admin_QnA_edit.tiles", "adminQnA", service.selectAdminQnAByNo(adminQnaNo));
	}
	
	//QnA 수정
	@RequestMapping("/adminQnAEdit")
	public String adminQnAEdit(@ModelAttribute @Valid AdminQnA adminQnA, BindingResult errors, int page, HttpServletRequest request){
		if(errors.hasErrors()){
			request.setAttribute("errors", errors);
			return "admin/admin_QnA_edit.tiles";
		}
		adminQnA.setAdminQnaDate(new Date());
		service.updateAdminQnA(adminQnA);
		return "redirect:/adminQnA/adminQnADetail.go?page="+page+"&adminQnaNo="+adminQnA.getAdminQnaNo();
	}
	
	//QnA 삭제
	@RequestMapping("/adminQnADelete")
	public String adminQnADelete(int page, int adminQnaNo){
		service.deleteAdminQnA(adminQnaNo);
		return "redirect:/adminQnA/adminQnAList.go?page="+page;
	}
	
	//QnA 조회
	@RequestMapping("/adminQnADetail")
	public ModelAndView adminQnADetail(int page, int adminQnaNo){
		AdminQnA adminQnA = service.selectAdminQnAByNo(adminQnaNo);
		adminQnA = convertor(adminQnA);
		HashMap<String, Object> map = new HashMap<>();
		map.put("adminQnA", adminQnA);
		map.put("page", page);
		
		return new ModelAndView("admin/admin_QnA_detail.tiles", map);
	}
	
	//QnA 답글 등록
	@RequestMapping("/registerAdminQnAReply")
	public String registerAdminQnAReply(AdminQnAReply adminQnAReply, int page){
		adminQnAReply = new AdminQnAReply(0, adminQnAReply.getAdminReplyContent(), new Date(), "관리자", adminQnAReply.getAdminQnaNo());
		service.insertAdminQnAReply(adminQnAReply);
		return "redirect:/adminQnA/adminQnADetail.go?page="+page+"&adminQnaNo="+adminQnAReply.getAdminQnaNo();
	}
	
	//QnA 답글 수정
	@RequestMapping("/editAdminQnAReply")
	public String editAdminQnAReply(int page, AdminQnAReply adminQnAReply){
		adminQnAReply.setAdminReplyDate(new Date());
		service.updateAdminQnAReply(adminQnAReply);
		return "redirect:/adminQnA/adminQnADetail.go?page="+page+"&adminQnaNo="+adminQnAReply.getAdminQnaNo();
	}
	
	//QnA 답글 삭제
	@RequestMapping("/deleteAdminQnAReply")
	public String deleteAdminQnAReply(int page, AdminQnAReply adminQnAReply){
		service.deleteAdminQnAReply(adminQnAReply.getAdminReplyNo());
		return "redirect:/adminQnA/adminQnADetail.go?page="+page+"&adminQnaNo="+adminQnAReply.getAdminQnaNo();
	}
	
	// HTML <-> Text 변환
	public AdminQnA convertor(AdminQnA adminQnA){
		adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace(">", "&gt;"));
		adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace("<", "&lt;"));
		adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace("\n", "<br>"));
		adminQnA.setAdminQnaTitle(adminQnA.getAdminQnaTitle().replace(" ", "&nbsp;"));
		
		adminQnA.setAdminQnaContent(adminQnA.getAdminQnaContent().replace(">", "&gt;"));
		adminQnA.setAdminQnaContent(adminQnA.getAdminQnaContent().replace("<", "&lt;"));
		adminQnA.setAdminQnaContent(adminQnA.getAdminQnaContent().replace("\n", "<br>"));
		adminQnA.setAdminQnaContent(adminQnA.getAdminQnaContent().replace(" ", "&nbsp;"));
		
		return adminQnA;
	}
}