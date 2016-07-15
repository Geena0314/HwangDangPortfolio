package com.hwangdang.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwangdang.common.util.MailSender;
import com.hwangdang.dao.MemberDao;
import com.hwangdang.service.MemberService;
import com.hwangdang.vo.Code;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.Seller;
import com.hwangdang.vo.Zipcode;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;
	
	public MemberServiceImpl(){}
	
	
	
	@Override
	public Member findById(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectById(memberId);
	}
	
	@Override
	public Seller selectSellerById(String memberId)
	{
		// TODO Auto-generated method stub
		return dao.selectSellerById(memberId);
	}
	
	@Override
	public int selectSellerStoreName(String sellerStoreName)
	{
		// TODO Auto-generated method stub
		return dao.selectSellerStoreName(sellerStoreName);
	}

	@Override
	public void add(Member member) {
		// TODO Auto-generated method stub
		dao.insert(member);
	}
	
	@Override
	public List<Code> selectEmailList()
	{
		// TODO Auto-generated method stub
		return dao.selectEmailList();
	}
	@Override
	public List<Zipcode> selectZipcode(String dong)
	{
		// TODO Auto-generated method stub
		return dao.selectZipcode(dong);
	}

	@Override
	public Member selectById(String memberId)
	{
		// TODO Auto-generated method stub
		return dao.selectById(memberId);
	}
	
	@Override
	public int deleteMemberByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return dao.deleteById(memberId);
	}
	
	//회원정보수정
	@Override
	public int setMemberInfoByMemberId(Member setMember) {
		return  dao.updateMemberInfoByMemberId(setMember);
	}

	@Override
	public String selectMemeberByName(String memberName, String memberPhone)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberName", memberName);
		map.put("memberPhone", memberPhone);
		dao.selectMemeberByName(map);
		return dao.selectMemeberByName(map).getMemberId();
	}



	@Override
	public String selelctPasswordById(String memberId)
	{
		// TODO Auto-generated method stub
		return dao.selelctPasswordById(memberId);
	}
}