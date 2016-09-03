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
import com.hwangdang.service.SellerNoticeService;
import com.hwangdang.vo.SellerNotice;

@Controller
@RequestMapping("sellerNotice")
public class SellerNoticeController {

	@Autowired
	private SellerNoticeService service;
	
	// 판매자 소식글 전체 목록 조회
	@RequestMapping("/sellerNotice")
	public ModelAndView sellerNoticeList(int page, int sellerStoreNo){
		HashMap<String, Object> map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.getCountSellerNotice(sellerStoreNo),page);
		ArrayList list = (ArrayList) service.getAllSellerNotice(page, sellerStoreNo);
		map.put("list", list);
		map.put("pagingBean",pagingBean);
		map.put("sellerStoreNo", sellerStoreNo);
		return new ModelAndView("seller/seller/seller_notice_list.tiles", map);
	}
	
	// 판매자 소식글 상세보기
	@RequestMapping("/sellerNoticeDetail")
	public ModelAndView sellerNoticeDetail(int page, int sellerNoticeNo){
		SellerNotice sellerNotice = service.getSellerNoticeByNoticeNo(sellerNoticeNo);
		sellerNotice = convertor(sellerNotice);
		HashMap<String, Object> map = new HashMap<>();
		map.put("sellerNotice", sellerNotice);
		map.put("page", page);
		return new ModelAndView("seller/seller/seller_notice_detail.tiles", map);
	}
	
	// 판매자 소식글 등록 폼 이동
	@RequestMapping("/sellerRegisterNoticeForm")
	public ModelAndView sellerRegisterNoticeForm(int sellerStoreNo){
		return new ModelAndView("seller/seller/seller_register_notice.tiles", "sellerStoreNo", sellerStoreNo);
	}
	
	// 판매자 소식글 등록 폼
	@RequestMapping("/sellerRegisterNotice")
	public ModelAndView sellerRegisterNotice(@ModelAttribute @Valid SellerNotice sellerNotice,  BindingResult errors, int page, int sellerStoreNo, HttpServletRequest request){
		if(errors.hasErrors()){
			request.setAttribute("errors", errors);
			return new ModelAndView("seller/seller/seller_register_notice.tiles");
		}
		sellerNotice.setSellerNoticeDate(new Date());
		sellerNotice.setSellerStoreNo(sellerStoreNo);
		service.sellerRegisterNotice(sellerNotice);
		sellerNotice = convertor(sellerNotice);
		HashMap<String, Object> map = new HashMap<>();
		map.put("sellerNotice", sellerNotice);
		map.put("page", page);
		return new ModelAndView("seller/seller/seller_notice_detail.tiles", map);
	}
	
	// 판매자 소식글 수정 폼으로 이동
	@RequestMapping("/sellerEditNoticeForm")
	public ModelAndView sellerEditNoticeForm(int page, int sellerNoticeNo, int sellerStoreNo){
		SellerNotice sellerNotice = service.getSellerNoticeByNoticeNo(sellerNoticeNo);
		HashMap<String, Object> map = new HashMap<>();
		map.put("sellerNotice", sellerNotice);
		map.put("page", page);
		map.put("sellerStoreNo", sellerStoreNo);
		return new ModelAndView("seller/seller/seller_edit_notice.tiles", map);
	}

	// 판매자 소식글 수정 폼
	@RequestMapping("/sellerEditNotice")
	public ModelAndView sellerEditNotice(@ModelAttribute @Valid SellerNotice sellerNotice, BindingResult errors, int page, int sellerStoreNo, HttpServletRequest request){
		if(errors.hasErrors()){
			request.setAttribute("errors", errors);
			return new ModelAndView("seller/seller/seller_edit_notice.tiles");
		}
		sellerNotice.setSellerNoticeDate(new Date());
		sellerNotice = convertor(sellerNotice);
		HashMap<String, Object> map = new HashMap<>();
		map.put("sellerNotice", sellerNotice);
		map.put("page", page);
		map.put("sellerStoreNo",sellerStoreNo);
		return new ModelAndView("seller/seller/seller_notice_detail.tiles", map);
	}
	
	// 판매자 소식글 삭제
	@RequestMapping("/sellerRemoveNotice")
	public ModelAndView sellerRemoveNotice(int page, int sellerNoticeNo, int sellerStoreNo){
		service.removeSellerNotice(sellerNoticeNo);
		HashMap<String, Object> map = new HashMap<>();
		PagingBean pagingBean = new PagingBean(service.getCountSellerNotice(sellerStoreNo),page);
		ArrayList list = (ArrayList) service.getAllSellerNotice(page, sellerStoreNo);
		map.put("list", list);
		map.put("pagingBean",pagingBean);
		map.put("sellerStoreNo",sellerStoreNo);
		return new ModelAndView("seller/seller/seller_notice_list.tiles", map);
	}
	
	// HTML <-> Text 변환
	public SellerNotice convertor(SellerNotice sellerNotice){
		sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace(">", "&gt;"));
		sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace("<", "&lt;"));
		sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace("\n", "<br>"));
		sellerNotice.setSellerNoticeTitle(sellerNotice.getSellerNoticeTitle().replace(" ", "&nbsp;"));
		
		sellerNotice.setSellerNoticeContent(sellerNotice.getSellerNoticeContent().replace(">", "&gt;"));
		sellerNotice.setSellerNoticeContent(sellerNotice.getSellerNoticeContent().replace("<", "&lt;"));
		sellerNotice.setSellerNoticeContent(sellerNotice.getSellerNoticeContent().replace("\n", "<br>"));
		sellerNotice.setSellerNoticeContent(sellerNotice.getSellerNoticeContent().replace(" ", "&nbsp;"));
		return sellerNotice;
	}
}