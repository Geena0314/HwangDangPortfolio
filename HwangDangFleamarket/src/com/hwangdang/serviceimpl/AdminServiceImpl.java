package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.dao.AdminDao;
import com.hwangdang.dao.MemberDao;
import com.hwangdang.dao.SellerDao;
import com.hwangdang.service.AdminService;
import com.hwangdang.vo.Seller;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private MemberDao memberDao;
	
	public AdminServiceImpl()
	{
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public HashMap<String, Object> selectSellerRegister(int page)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		PagingBean bean = new PagingBean(sellerDao.selectCountSellerRegister(), page);
		map.put("itemPerPage", 6);
		map.put("page", page);
		List<Seller> list = sellerDao.selectSellerRegister(map);
		for(Seller s : list)
		{
			s.setSellerIntroduction(s.getSellerIntroduction().replace(">", "&gt;"));
			s.setSellerIntroduction(s.getSellerIntroduction().replace("<", "&lt;"));
			s.setSellerIntroduction(s.getSellerIntroduction().replace("\n", "<br>"));
			s.setSellerIntroduction(s.getSellerIntroduction().replace(" ", "&nbsp;"));
		}
		map.put("registerList", list);
		map.put("bean", bean);
		
		return map;
	}

	@Override
	public Seller selectSellerMember(int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		Seller seller = sellerDao.selectSellerMember(sellerStoreNo);
		seller.setSellerIntroduction(seller.getSellerIntroduction().replace(">", "&gt;"));
		seller.setSellerIntroduction(seller.getSellerIntroduction().replace("<", "&lt;"));
		seller.setSellerIntroduction(seller.getSellerIntroduction().replace("\n", "<br>"));
		seller.setSellerIntroduction(seller.getSellerIntroduction().replace(" ", "&nbsp;"));
		return seller;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int sellerRegisterRecognize(int sellerStoreNo, String memberId)
	{
		// TODO Auto-generated method stub
		sellerDao.sellerAssignUpdate(sellerStoreNo);
		memberDao.updateMemberAssign(memberId);
		return 0;
	}

	@Override
	public int deleteSellerByNo(int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		return sellerDao.deleteSellerByNo(sellerStoreNo);
	}
}