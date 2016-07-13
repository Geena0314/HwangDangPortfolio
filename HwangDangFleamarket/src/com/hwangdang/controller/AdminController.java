package com.hwangdang.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController
{
	@Autowired
	private AdminService service;
	
	public AdminController()
	{
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("sellerRegisterStatus")
	public ModelAndView sellerRegisterStatus(int page)
	{
		HashMap<String, Object> map = service.selectSellerRegister(page);
		return new ModelAndView("admin/seller_register_status.tiles", map);
	}
	
	@RequestMapping("sellerRegisterInfo")
	public ModelAndView sellerRegisterInfo(int sellerStoreNo)
	{
		if(sellerStoreNo == 0)
		{
			return new ModelAndView("/WEB-INF/view/admin/seller_register_reject.jsp");
		}
		return new ModelAndView("/WEB-INF/view/admin/seller_register_info.jsp", "seller", service.selectSellerMember(sellerStoreNo));
	}
	
	@RequestMapping("sellerRegisterRecognize")
	public String sellerRegisterRecognize(int sellerStoreNo, String memberId)
	{
		service.sellerRegisterRecognize(sellerStoreNo, memberId);
		return "/WEB-INF/view/admin/seller_register_recognize.jsp";
	}
	
	@RequestMapping("sellerRegisterReject")
	public String sellerRegisterReject(int sellerStoreNo)
	{
		service.deleteSellerByNo(sellerStoreNo);
		return "redirect:/admin/sellerRegisterInfo.go?sellerStoreNo=0";
	}
}