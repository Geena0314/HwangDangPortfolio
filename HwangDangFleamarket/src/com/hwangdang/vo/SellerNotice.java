package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class SellerNotice implements Serializable{
	private int sellerNoticeNo;
	@NotEmpty(message="제목을 입력하세요.")
	private String sellerNoticeTitle;
	@NotEmpty(message="내용을 입력하세요.")
	private String sellerNoticeContent;
	private Date sellerNoticeDate;
	private int sellerNoticeHit;
	private int sellerStoreNo;
	
	public SellerNotice() {}

	public SellerNotice(int sellerNoticeNo, String sellerNoticeTitle, String sellerNoticeContent, Date sellerNoticeDate,
			int sellerNoticeHit, int sellerStoreNo) {
		super();
		this.sellerNoticeNo = sellerNoticeNo;
		this.sellerNoticeTitle = sellerNoticeTitle;
		this.sellerNoticeContent = sellerNoticeContent;
		this.sellerNoticeDate = sellerNoticeDate;
		this.sellerNoticeHit = sellerNoticeHit;
		this.sellerStoreNo = sellerStoreNo;
	}

	public int getSellerNoticeNo() {
		return sellerNoticeNo;
	}

	public void setSellerNoticeNo(int sellerNoticeNo) {
		this.sellerNoticeNo = sellerNoticeNo;
	}

	public String getSellerNoticeTitle() {
		return sellerNoticeTitle;
	}

	public void setSellerNoticeTitle(String sellerNoticeTitle) {
		this.sellerNoticeTitle = sellerNoticeTitle;
	}

	public String getSellerNoticeContent() {
		return sellerNoticeContent;
	}

	public void setSellerNoticeContent(String sellerNoticeContent) {
		this.sellerNoticeContent = sellerNoticeContent;
	}

	public Date getSellerNoticeDate() {
		return sellerNoticeDate;
	}

	public void setSellerNoticeDate(Date sellerNoticeDate) {
		this.sellerNoticeDate = sellerNoticeDate;
	}

	public int getSellerNoticeHit() {
		return sellerNoticeHit;
	}

	public void setSellerNoticeHit(int sellerNoticeHit) {
		this.sellerNoticeHit = sellerNoticeHit;
	}

	public int getSellerStoreNo() {
		return sellerStoreNo;
	}

	public void setSellerStoreNo(int sellerStoreNo) {
		this.sellerStoreNo = sellerStoreNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sellerNoticeContent == null) ? 0 : sellerNoticeContent.hashCode());
		result = prime * result + ((sellerNoticeDate == null) ? 0 : sellerNoticeDate.hashCode());
		result = prime * result + sellerNoticeHit;
		result = prime * result + sellerNoticeNo;
		result = prime * result + ((sellerNoticeTitle == null) ? 0 : sellerNoticeTitle.hashCode());
		result = prime * result + sellerStoreNo;
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
		SellerNotice other = (SellerNotice) obj;
		if (sellerNoticeContent == null) {
			if (other.sellerNoticeContent != null)
				return false;
		} else if (!sellerNoticeContent.equals(other.sellerNoticeContent))
			return false;
		if (sellerNoticeDate == null) {
			if (other.sellerNoticeDate != null)
				return false;
		} else if (!sellerNoticeDate.equals(other.sellerNoticeDate))
			return false;
		if (sellerNoticeHit != other.sellerNoticeHit)
			return false;
		if (sellerNoticeNo != other.sellerNoticeNo)
			return false;
		if (sellerNoticeTitle == null) {
			if (other.sellerNoticeTitle != null)
				return false;
		} else if (!sellerNoticeTitle.equals(other.sellerNoticeTitle))
			return false;
		if (sellerStoreNo != other.sellerStoreNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SellerNotice [sellerNoticeNo=" + sellerNoticeNo + ", sellerNoticeTitle=" + sellerNoticeTitle
				+ ", sellerNoticeContent=" + sellerNoticeContent + ", sellerNoticeDate=" + sellerNoticeDate
				+ ", sellerNoticeHit=" + sellerNoticeHit + ", sellerStoreNo=" + sellerStoreNo + "]";
	}
}
