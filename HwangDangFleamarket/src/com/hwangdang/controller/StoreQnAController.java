package com.hwangdang.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hwangdang.service.ProductService;
import com.hwangdang.service.StoreQnAService;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.StoreQnA;

@Controller
@RequestMapping("/storeQnA/")
public class StoreQnAController
{
	@Autowired
	private StoreQnAService service;
	
	@Autowired
	private ProductService productService;
	
	public StoreQnAController()
	{
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("storeQnARegisterForm")
	public String storeQnARegisterForm()
	{
		return "/WEB-INF/view/seller/storeQnA_register.jsp";
	}
	
	@RequestMapping("storeQnARegister")
	public String storeQnARegister(String storeQnATitle, String storeQnAContent, int storeQnAPublished, String storeQnAWriter, String productId)
	{
		StoreQnA qna = new StoreQnA(0, storeQnATitle, storeQnAContent, 0, storeQnAPublished, storeQnAWriter, new Date(), productId);
		service.insertStoreQnA(qna);
		return "/WEB-INF/view/seller/storeQnA_register_success.jsp";
	}
	
	@RequestMapping("storeQnARemove")
	@ResponseBody
	public HashMap<String, Object> storeQnARemove(int sellerStoreNo, int storeQnANo, String memberId, String productId, HttpSession session)
	{
		HashMap<String,Object> map = new HashMap<>();
		try
		{
			if(((Member)session.getAttribute("login_info")).getMemberId().equals(service.selectSellerByNo(sellerStoreNo)) || 
					((Member)session.getAttribute("login_info")).getMemberId().equals(service.selectQnAWriterByNo(storeQnANo)))
			{
				service.deleteQnAByno(storeQnANo);
				map = productService.selectStoreQnAPaging(1, productId);
				map.put("result", "succes");
				return map;
			}
			else
			{
				map = productService.selectStoreQnAPaging(1, productId);
				map.put("result", null);
				return map;
			}
		}
		catch (Exception e)
		{
			//로그인 안한 경우.
			return map;
		}
	}
}