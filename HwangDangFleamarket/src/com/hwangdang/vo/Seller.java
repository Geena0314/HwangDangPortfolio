package com.hwangdang.vo;

import java.io.Serializable;

public class Seller implements Serializable
{
	private int sellerStoreNo;
	private String sellerStoreName;
	private String sellerTaxId;
	private String sellerIndustry;
	private String sellerSubIndustry;
	private String sellerZipcode;
	private String sellerAddress;
	private String sellerSubAddress;
	private String sellerStoreImage;
	private String sellerProduct1;
	private String sellerProduct2;
	private String sellerProduct3;
	private String sellerIntroduction;
	private int sellerAssign;
	private String memberId;
	private String sellerBank;
	private String sellerAccount;
	
	private Member member;
	
	public Seller()
	{
		// TODO Auto-generated constructor stub
	}

	public Seller(int sellerStoreNo, String sellerStoreName, String sellerTaxId, String sellerIndustry,
			String sellerSubIndustry, String sellerZipcode, String sellerAddress, String sellerSubAddress,
			String sellerStoreImage, String sellerProduct1, String sellerProduct2, String sellerProduct3,
			String sellerIntroduction, int sellerAssign, String memberId, String sellerBank, String sellerAccount)
	{
		super();
		this.sellerStoreNo = sellerStoreNo;
		this.sellerStoreName = sellerStoreName;
		this.sellerTaxId = sellerTaxId;
		this.sellerIndustry = sellerIndustry;
		this.sellerSubIndustry = sellerSubIndustry;
		this.sellerZipcode = sellerZipcode;
		this.sellerAddress = sellerAddress;
		this.sellerSubAddress = sellerSubAddress;
		this.sellerStoreImage = sellerStoreImage;
		this.sellerProduct1 = sellerProduct1;
		this.sellerProduct2 = sellerProduct2;
		this.sellerProduct3 = sellerProduct3;
		this.sellerIntroduction = sellerIntroduction;
		this.sellerAssign = sellerAssign;
		this.memberId = memberId;
		this.sellerBank = sellerBank;
		this.sellerAccount = sellerAccount;
	}

	public Seller(int sellerStoreNo, String sellerStoreName, String sellerTaxId, String sellerIndustry,
			String sellerSubIndustry, String sellerZipcode, String sellerAddress, String sellerSubAddress,
			String sellerStoreImage, String sellerProduct1, String sellerProduct2, String sellerProduct3,
			String sellerIntroduction, int sellerAssign, String memberId, String sellerBank, String sellerAccount,
			Member member)
	{
		super();
		this.sellerStoreNo = sellerStoreNo;
		this.sellerStoreName = sellerStoreName;
		this.sellerTaxId = sellerTaxId;
		this.sellerIndustry = sellerIndustry;
		this.sellerSubIndustry = sellerSubIndustry;
		this.sellerZipcode = sellerZipcode;
		this.sellerAddress = sellerAddress;
		this.sellerSubAddress = sellerSubAddress;
		this.sellerStoreImage = sellerStoreImage;
		this.sellerProduct1 = sellerProduct1;
		this.sellerProduct2 = sellerProduct2;
		this.sellerProduct3 = sellerProduct3;
		this.sellerIntroduction = sellerIntroduction;
		this.sellerAssign = sellerAssign;
		this.memberId = memberId;
		this.sellerBank = sellerBank;
		this.sellerAccount = sellerAccount;
		this.member = member;
	}

	public int getSellerStoreNo()
	{
		return sellerStoreNo;
	}

	public void setSellerStoreNo(int sellerStoreNo)
	{
		this.sellerStoreNo = sellerStoreNo;
	}

	public String getSellerStoreName()
	{
		return sellerStoreName;
	}

	public void setSellerStoreName(String sellerStoreName)
	{
		this.sellerStoreName = sellerStoreName;
	}

	public String getSellerTaxId()
	{
		return sellerTaxId;
	}

	public void setSellerTaxId(String sellerTaxId)
	{
		this.sellerTaxId = sellerTaxId;
	}

	public String getSellerIndustry()
	{
		return sellerIndustry;
	}

	public void setSellerIndustry(String sellerIndustry)
	{
		this.sellerIndustry = sellerIndustry;
	}

	public String getSellerSubIndustry()
	{
		return sellerSubIndustry;
	}

	public void setSellerSubIndustry(String sellerSubIndustry)
	{
		this.sellerSubIndustry = sellerSubIndustry;
	}

	public String getSellerZipcode()
	{
		return sellerZipcode;
	}

	public void setSellerZipcode(String sellerZipcode)
	{
		this.sellerZipcode = sellerZipcode;
	}

	public String getSellerAddress()
	{
		return sellerAddress;
	}

	public void setSellerAddress(String sellerAddress)
	{
		this.sellerAddress = sellerAddress;
	}

	public String getSellerSubAddress()
	{
		return sellerSubAddress;
	}

	public void setSellerSubAddress(String sellerSubAddress)
	{
		this.sellerSubAddress = sellerSubAddress;
	}

	public String getSellerStoreImage()
	{
		return sellerStoreImage;
	}

	public void setSellerStoreImage(String sellerStoreImage)
	{
		this.sellerStoreImage = sellerStoreImage;
	}

	public String getSellerProduct1()
	{
		return sellerProduct1;
	}

	public void setSellerProduct1(String sellerProduct1)
	{
		this.sellerProduct1 = sellerProduct1;
	}

	public String getSellerProduct2()
	{
		return sellerProduct2;
	}

	public void setSellerProduct2(String sellerProduct2)
	{
		this.sellerProduct2 = sellerProduct2;
	}

	public String getSellerProduct3()
	{
		return sellerProduct3;
	}

	public void setSellerProduct3(String sellerProduct3)
	{
		this.sellerProduct3 = sellerProduct3;
	}

	public String getSellerIntroduction()
	{
		return sellerIntroduction;
	}

	public void setSellerIntroduction(String sellerIntroduction)
	{
		this.sellerIntroduction = sellerIntroduction;
	}

	public int getSellerAssign()
	{
		return sellerAssign;
	}

	public void setSellerAssign(int sellerAssign)
	{
		this.sellerAssign = sellerAssign;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getSellerBank()
	{
		return sellerBank;
	}

	public void setSellerBank(String sellerBank)
	{
		this.sellerBank = sellerBank;
	}

	public String getSellerAccount()
	{
		return sellerAccount;
	}

	public void setSellerAccount(String sellerAccount)
	{
		this.sellerAccount = sellerAccount;
	}

	public Member getMember()
	{
		return member;
	}

	public void setMember(Member member)
	{
		this.member = member;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((sellerAccount == null) ? 0 : sellerAccount.hashCode());
		result = prime * result + ((sellerAddress == null) ? 0 : sellerAddress.hashCode());
		result = prime * result + sellerAssign;
		result = prime * result + ((sellerBank == null) ? 0 : sellerBank.hashCode());
		result = prime * result + ((sellerIndustry == null) ? 0 : sellerIndustry.hashCode());
		result = prime * result + ((sellerIntroduction == null) ? 0 : sellerIntroduction.hashCode());
		result = prime * result + ((sellerProduct1 == null) ? 0 : sellerProduct1.hashCode());
		result = prime * result + ((sellerProduct2 == null) ? 0 : sellerProduct2.hashCode());
		result = prime * result + ((sellerProduct3 == null) ? 0 : sellerProduct3.hashCode());
		result = prime * result + ((sellerStoreImage == null) ? 0 : sellerStoreImage.hashCode());
		result = prime * result + ((sellerStoreName == null) ? 0 : sellerStoreName.hashCode());
		result = prime * result + sellerStoreNo;
		result = prime * result + ((sellerSubAddress == null) ? 0 : sellerSubAddress.hashCode());
		result = prime * result + ((sellerSubIndustry == null) ? 0 : sellerSubIndustry.hashCode());
		result = prime * result + ((sellerTaxId == null) ? 0 : sellerTaxId.hashCode());
		result = prime * result + ((sellerZipcode == null) ? 0 : sellerZipcode.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Seller other = (Seller) obj;
		if (member == null)
		{
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
			return false;
		if (memberId == null)
		{
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (sellerAccount == null)
		{
			if (other.sellerAccount != null)
				return false;
		} else if (!sellerAccount.equals(other.sellerAccount))
			return false;
		if (sellerAddress == null)
		{
			if (other.sellerAddress != null)
				return false;
		} else if (!sellerAddress.equals(other.sellerAddress))
			return false;
		if (sellerAssign != other.sellerAssign)
			return false;
		if (sellerBank == null)
		{
			if (other.sellerBank != null)
				return false;
		} else if (!sellerBank.equals(other.sellerBank))
			return false;
		if (sellerIndustry == null)
		{
			if (other.sellerIndustry != null)
				return false;
		} else if (!sellerIndustry.equals(other.sellerIndustry))
			return false;
		if (sellerIntroduction == null)
		{
			if (other.sellerIntroduction != null)
				return false;
		} else if (!sellerIntroduction.equals(other.sellerIntroduction))
			return false;
		if (sellerProduct1 == null)
		{
			if (other.sellerProduct1 != null)
				return false;
		} else if (!sellerProduct1.equals(other.sellerProduct1))
			return false;
		if (sellerProduct2 == null)
		{
			if (other.sellerProduct2 != null)
				return false;
		} else if (!sellerProduct2.equals(other.sellerProduct2))
			return false;
		if (sellerProduct3 == null)
		{
			if (other.sellerProduct3 != null)
				return false;
		} else if (!sellerProduct3.equals(other.sellerProduct3))
			return false;
		if (sellerStoreImage == null)
		{
			if (other.sellerStoreImage != null)
				return false;
		} else if (!sellerStoreImage.equals(other.sellerStoreImage))
			return false;
		if (sellerStoreName == null)
		{
			if (other.sellerStoreName != null)
				return false;
		} else if (!sellerStoreName.equals(other.sellerStoreName))
			return false;
		if (sellerStoreNo != other.sellerStoreNo)
			return false;
		if (sellerSubAddress == null)
		{
			if (other.sellerSubAddress != null)
				return false;
		} else if (!sellerSubAddress.equals(other.sellerSubAddress))
			return false;
		if (sellerSubIndustry == null)
		{
			if (other.sellerSubIndustry != null)
				return false;
		} else if (!sellerSubIndustry.equals(other.sellerSubIndustry))
			return false;
		if (sellerTaxId == null)
		{
			if (other.sellerTaxId != null)
				return false;
		} else if (!sellerTaxId.equals(other.sellerTaxId))
			return false;
		if (sellerZipcode == null)
		{
			if (other.sellerZipcode != null)
				return false;
		} else if (!sellerZipcode.equals(other.sellerZipcode))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "Seller [sellerStoreNo=" + sellerStoreNo + ", sellerStoreName=" + sellerStoreName + ", sellerTaxId="
				+ sellerTaxId + ", sellerIndustry=" + sellerIndustry + ", sellerSubIndustry=" + sellerSubIndustry
				+ ", sellerZipcode=" + sellerZipcode + ", sellerAddress=" + sellerAddress + ", sellerSubAddress="
				+ sellerSubAddress + ", sellerStoreImage=" + sellerStoreImage + ", sellerProduct1=" + sellerProduct1
				+ ", sellerProduct2=" + sellerProduct2 + ", sellerProduct3=" + sellerProduct3 + ", sellerIntroduction="
				+ sellerIntroduction + ", sellerAssign=" + sellerAssign + ", memberId=" + memberId + ", sellerBank="
				+ sellerBank + ", sellerAccount=" + sellerAccount + ", member=" + member + "]";
	}
}