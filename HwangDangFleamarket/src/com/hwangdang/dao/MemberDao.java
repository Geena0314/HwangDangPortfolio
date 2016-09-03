package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Code;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.Seller;
import com.hwangdang.vo.Zipcode;

public interface MemberDao {
	/**
	 * 회원정보 insert
	 */
	int insert(Member member);

	/**
	 * 특정 ID의 회원의 나머지 정보 update
	 */
	int update(Member member);

	/**
	 * ID로 회원 delete
	 */
	int deleteById(String memberId);

	/**
	 * Id로 회원 select
	 */
	Member selectById(String memberId);

	int selectCountById(String memberId);

	//멤버id로 셀러정보찾기.
	Seller selectSellerById(String memberId);
	
	//스토어 이름으로 중복체크
	int selectSellerStoreName(String sellerStoreName);
	
	//멤버어싸인 1로변경(판매자등록승인)
	int updateMemberAssign(String memberId);
	
	//멤버어싸인 0으로변경(판매자 정보 삭제)
	int updateMemberAssignZero(String memberId);
	
	//이메일 리스트.
	List<Code> selectEmailList();
	
	//동명으로 검색한 주소 리스트.
	List<Zipcode> selectZipcode(String dong);
	
	//회원정보 수정 
	public int updateMemberById(Member member);
	
	//멤버 이름과 전화번호로 멤버아이디 찾기.
	Member selectMemeberByName(HashMap<String, Object> map);
	
	//멤버 아이디로 패스워드 조회.
	String selelctPasswordById(String memberId);
	
	//멤버마일리지 변경
	int updateMileage(HashMap<String, Object> map);
	
	//은행명 조회
	List<Code> selectBankCode();
	
	//멤버 마일리지 차감
	int updateMileageMinus(HashMap<String, Object> map);
}