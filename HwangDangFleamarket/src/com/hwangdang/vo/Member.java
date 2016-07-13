package com.hwangdang.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Member implements Serializable
{
	@NotEmpty(message="아이디를 입력하세요.")
	private String memberId;
	@NotEmpty(message="패스워드를 입력하세요.")
	@Length(min=8,max=20,message="패스워드는 8자 이상 20자 이하로 입력해 주세요.")
	private String memberPassword;
	@NotEmpty(message="이름을 입력하세요.")
	@Length(min=2,max=6,message="이름은 2자이상 6자 이하로 입력해 주세요.")
	private String memberName;
	@NotEmpty(message="전화번호를 입력하세요.")
	@Length(min=12,max=13,message="전화번호는 12글자 이상, 13글자 이하로 입력해 주세요.")
	private String memberPhone;
	@NotEmpty(message="우편번호를 입력하세요.")
	private String memberZipcode;
	private String memberAddress;
	@NotEmpty(message="세부주소를 입력하세요.")
	private String memberSubAddress;
	private int memberAssign;
	private int memberMileage;
	
	public Member()
	{
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPassword, String memberName, String memberPhone, String memberZipcode,
			String memberAddress, String memberSubAddress, int memberAssign)
	{
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberZipcode = memberZipcode;
		this.memberAddress = memberAddress;
		this.memberSubAddress = memberSubAddress;
		this.memberAssign = memberAssign;
	}
	//마일리지 추가 
	public Member(String memberId, String memberPassword, String memberName, String memberPhone, String memberZipcode,
			String memberAddress, String memberSubAddress, int memberAssign, int memberMileage) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberZipcode = memberZipcode;
		this.memberAddress = memberAddress;
		this.memberSubAddress = memberSubAddress;
		this.memberAssign = memberAssign;
		this.memberMileage = memberMileage;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberZipcode() {
		return memberZipcode;
	}

	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberSubAddress() {
		return memberSubAddress;
	}

	public void setMemberSubAddress(String memberSubAddress) {
		this.memberSubAddress = memberSubAddress;
	}

	public int getMemberAssign() {
		return memberAssign;
	}

	public void setMemberAssign(int memberAssign) {
		this.memberAssign = memberAssign;
	}

	public int getMemberMileage() {
		return memberMileage;
	}

	public void setMemberMileage(int memberMileage) {
		this.memberMileage = memberMileage;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberZipcode=" + memberZipcode + ", memberAddress="
				+ memberAddress + ", memberSubAddress=" + memberSubAddress + ", memberAssign=" + memberAssign
				+ ", memberMileage=" + memberMileage + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memberAddress == null) ? 0 : memberAddress.hashCode());
		result = prime * result + memberAssign;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + memberMileage;
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + ((memberPassword == null) ? 0 : memberPassword.hashCode());
		result = prime * result + ((memberPhone == null) ? 0 : memberPhone.hashCode());
		result = prime * result + ((memberSubAddress == null) ? 0 : memberSubAddress.hashCode());
		result = prime * result + ((memberZipcode == null) ? 0 : memberZipcode.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (memberAddress == null) {
			if (other.memberAddress != null)
				return false;
		} else if (!memberAddress.equals(other.memberAddress))
			return false;
		if (memberAssign != other.memberAssign)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (memberMileage != other.memberMileage)
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (memberPassword == null) {
			if (other.memberPassword != null)
				return false;
		} else if (!memberPassword.equals(other.memberPassword))
			return false;
		if (memberPhone == null) {
			if (other.memberPhone != null)
				return false;
		} else if (!memberPhone.equals(other.memberPhone))
			return false;
		if (memberSubAddress == null) {
			if (other.memberSubAddress != null)
				return false;
		} else if (!memberSubAddress.equals(other.memberSubAddress))
			return false;
		if (memberZipcode == null) {
			if (other.memberZipcode != null)
				return false;
		} else if (!memberZipcode.equals(other.memberZipcode))
			return false;
		return true;
	}
	
	

}