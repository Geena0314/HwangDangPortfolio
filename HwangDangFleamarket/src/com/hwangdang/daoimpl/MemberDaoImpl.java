package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.MemberDao;
import com.hwangdang.vo.Code;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.Seller;
import com.hwangdang.vo.Zipcode;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate session;

	public MemberDaoImpl() {
	}
	
	public MemberDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}
	
	@Override
	public int insert(Member member) {
		return session.insert("memberMapper.insert", member);
	}

	@Override
	public int update(Member member) {
		return session.update("membeMapper.update", member);
	}

	@Override
	public int deleteById(String memberId) {
		return session.delete("memberMapper.deleteById", memberId);
	}

	@Override
	public Member selectById(String memberId) {
		return session.selectOne("memberMapper.selectById", memberId);
	}

	@Override
	public int selectCountById(String memberId) {
		return session.selectOne("memberMapper.selectCountById", memberId);
	}

	@Override
	public Seller selectSellerById(String memberId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selectSellerById", memberId);
	}

	@Override
	public int selectSellerStoreName(String sellerStoreName)
	{
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selectSellerStoreName", sellerStoreName);
	}

	@Override
	public int updateMemberAssign(String memberId)
	{
		// TODO Auto-generated method stub
		return session.update("memberMapper.updateMemberAssign", memberId);
	}

	@Override
	public List<Code> selectEmailList()
	{
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.selectEmailList");
	}

	@Override
	public List<Zipcode> selectZipcode(String dong)
	{
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.selectZipcode", dong);
	}
	  
	@Override
	public int updateMemberById(Member member){
		return session.update("memberMapper.updateMemberById", member);
	}

	@Override
	public Member selectMemeberByName(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selectMemeberByName", map);
	}

	@Override
	public String selelctPasswordById(String memberId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selelctPasswordById", memberId);
	}

	@Override
	public int updateMemberAssignZero(String memberId) {
		// TODO Auto-generated method stub
		return session.update("memberMapper.updateMemberAssignZero", memberId);
	}

	@Override
	public int updateMileage(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.update("memberMapper.updateMileage", map);
	}

	@Override
	public List<Code> selectBankCode()
	{
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.selectBankCode");
	}

	@Override
	public int updateMileageMinus(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.update("memberMapper.updateMileageMinus", map);
	}
}