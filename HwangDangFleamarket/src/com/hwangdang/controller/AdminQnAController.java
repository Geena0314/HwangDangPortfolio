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
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.AdminQnAService;
import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.Notice;

@Controller
@RequestMapping("/adminQnA")
public class AdminQnAController {
	
	@Autowired
	private AdminQnAService service;
	
	//QnA 목록
	@RequestMapping("/adminQnAList")
	public ModelAndView selectAdminQnA(int page){
		HashMap<String, Object> map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.selectCountAdminQnA(), page);
		ArrayList<AdminQnA> list = (ArrayList<AdminQnA>)service.selectAdminQnAList(page);
		map.put("list", list);
		map.put("pagingBean", pagingBean);
		return new ModelAndView("admin/admin_QnA_list.tiles", map);
	}
	
	//QnA 등록 폼 이동
	@RequestMapping("/registerAdminQnAForm")
	public String registerQnAForm(){
		return "admin/admin_register_QnA.tiles";
	}
	
	//QnA 등록
	@RequestMapping("/registerAdminQnA")
	public ModelAndView insertAdminQnA(@ModelAttribute @Valid AdminQnA adminQnA, BindingResult errors, int page, HttpServletRequest request){
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
	@RequestMapping("/beforeAdminQnADetail")
	public ModelAndView beforeSelectAdminQnAByNo(){
		return new ModelAndView();
	}
	
	//QnA 조회
	@RequestMapping("/adminQnADetail")
	public ModelAndView selectAdminQnAByNo(int page, int adminQnaNo){
		AdminQnA adminQnA = service.selectAdminQnAByNo(adminQnaNo);
		adminQnA = convertor(adminQnA);
		HashMap<String, Object> map = new HashMap<>();
		map.put("adminQnA", adminQnA);
		map.put("page", page);
		
		return new ModelAndView("admin/admin_QnA_detail.tiles", map);
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