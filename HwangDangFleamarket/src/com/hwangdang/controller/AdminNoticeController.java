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
import com.hwangdang.service.AdminNoticeService;
import com.hwangdang.vo.Notice;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController{
	
	@Autowired
	private AdminNoticeService service;
	
	@RequestMapping("/adminNotice")
	public ModelAndView noticeList(int page){
		HashMap map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.getCountNotice(),page);
		ArrayList list = (ArrayList) service.getAllNotice(page);
		map.put("list", list);
		map.put("pagingBean",pagingBean);
		return new ModelAndView("admin/admin_notice_list.tiles", map);
	}
	
	@RequestMapping("/adminNoticeDetail")
	public ModelAndView noticeDetail(int page, int noticeNo){
		Notice notice = service.getNoticeByNoticeNo(noticeNo);
		notice = convertor(notice);
		HashMap map = new HashMap<>();
		map.put("notice", notice);
		map.put("page", page);
		return new ModelAndView("admin/admin_notice_detail.tiles", map);
	}
	
	@RequestMapping("/adminRegisterForm")
	public String registerForm(){
		return "admin/admin_register_notice.tiles";
	}
	
	@RequestMapping("/adminRegisterNotice")
	public ModelAndView registerNotice(@ModelAttribute @Valid Notice notice, BindingResult errors, int page, HttpServletRequest request){
		if(errors.hasErrors()){
			request.setAttribute("errors", errors);
			return new ModelAndView("admin/admin_register_notice.tiles");
		}
		notice.setNoticeDate(new Date());
		service.adminRegisterNotice(notice);
		notice = convertor(notice);
		HashMap map = new HashMap<>();
		map.put("notice", notice);
		map.put("page", page);
		return new ModelAndView("admin/admin_notice_detail.tiles", map);
	}
	
	@RequestMapping("/adminEditForm")
	public ModelAndView editForm(int page, int noticeNo){
		Notice notice = service.getNoticeByNoticeNo(noticeNo);
		HashMap map = new HashMap<>();
		map.put("notice", notice);
		map.put("page", page);
		return new ModelAndView("admin/admin_edit_notice.tiles", map);
	}

	@RequestMapping("/adminEditNotice")
	public ModelAndView editNotice(@ModelAttribute @Valid Notice notice, BindingResult errors, int page, HttpServletRequest request){
		if(errors.hasErrors()){
			request.setAttribute("errors", errors);
			return new ModelAndView("admin/admin_edit_notice.tiles");
		}
		notice.setNoticeDate(new Date());
		service.adminEditNotice(notice);
		notice = convertor(notice);
		HashMap map = new HashMap<>();
		map.put("notice", notice);
		map.put("page", page);
		return new ModelAndView("admin/admin_notice_detail.tiles", map);
	}
	
	@RequestMapping("/adminRemoveNotice")
	public ModelAndView removeNotice(int page, int noticeNo){
		service.removNotice(noticeNo);
		HashMap map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.getCountNotice(),page);
		ArrayList list = (ArrayList) service.getAllNotice(page);
		map.put("list", list);
		map.put("pagingBean",pagingBean);
		return new ModelAndView("admin/admin_notice_list.tiles", map);
	}
	
	public Notice convertor(Notice notice){
		notice.setNoticeTitle(notice.getNoticeTitle().replace(">", "&gt;"));
		notice.setNoticeTitle(notice.getNoticeTitle().replace("<", "&lt;"));
		notice.setNoticeTitle(notice.getNoticeTitle().replace("\n", "<br>"));
		notice.setNoticeTitle(notice.getNoticeTitle().replace(" ", "&nbsp;"));
		
		notice.setNoticeContent(notice.getNoticeContent().replace(">", "&gt;"));
		notice.setNoticeContent(notice.getNoticeContent().replace("<", "&lt;"));
		notice.setNoticeContent(notice.getNoticeContent().replace("\n", "<br>"));
		notice.setNoticeContent(notice.getNoticeContent().replace(" ", "&nbsp;"));
		return notice;
	}
}
