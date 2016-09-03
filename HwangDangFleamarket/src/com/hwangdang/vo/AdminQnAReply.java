package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;

public class AdminQnAReply implements Serializable
{
	private int adminReplyNo;
	private String adminReplyContent;
	private Date adminReplyDate;
	private String adminReplyWriter;
	private int adminQnaNo;
	
	public AdminQnAReply()
	{
		// TODO Auto-generated constructor stub
	}

	public AdminQnAReply(int adminReplyNo, String adminReplyContent, Date adminReplyDate, String adminReplyWriter,
			int adminQnaNo) 
	{
		super();
		this.adminReplyNo = adminReplyNo;
		this.adminReplyContent = adminReplyContent;
		this.adminReplyDate = adminReplyDate;
		this.adminReplyWriter = adminReplyWriter;
		this.adminQnaNo = adminQnaNo;
	}
	
	public int getAdminReplyNo() 
	{
		return adminReplyNo;
	}

	public void setAdminReplyNo(int adminReplyNo) 
	{
		this.adminReplyNo = adminReplyNo;
	}

	public String getAdminReplyContent() 
	{
		return adminReplyContent;
	}

	public void setAdminReplyContent(String adminReplyContent) 
	{
		this.adminReplyContent = adminReplyContent;
	}

	public Date getAdminReplyDate() 
	{
		return adminReplyDate;
	}

	public void setAdminReplyDate(Date adminReplyDate) 
	{
		this.adminReplyDate = adminReplyDate;
	}

	public String getAdminReplyWriter() 
	{
		return adminReplyWriter;
	}

	public void setAdminReplyWriter(String adminReplyWriter) 
	{
		this.adminReplyWriter = adminReplyWriter;
	}

	public int getAdminQnaNo() 
	{
		return adminQnaNo;
	}

	public void setAdminQnaNo(int adminQnaNo) 
	{
		this.adminQnaNo = adminQnaNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + adminQnaNo;
		result = prime * result + ((adminReplyContent == null) ? 0 : adminReplyContent.hashCode());
		result = prime * result + ((adminReplyDate == null) ? 0 : adminReplyDate.hashCode());
		result = prime * result + adminReplyNo;
		result = prime * result + ((adminReplyWriter == null) ? 0 : adminReplyWriter.hashCode());
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
		AdminQnAReply other = (AdminQnAReply) obj;
		if (adminQnaNo != other.adminQnaNo)
			return false;
		if (adminReplyContent == null) {
			if (other.adminReplyContent != null)
				return false;
		} else if (!adminReplyContent.equals(other.adminReplyContent))
			return false;
		if (adminReplyDate == null) {
			if (other.adminReplyDate != null)
				return false;
		} else if (!adminReplyDate.equals(other.adminReplyDate))
			return false;
		if (adminReplyNo != other.adminReplyNo)
			return false;
		if (adminReplyWriter == null) {
			if (other.adminReplyWriter != null)
				return false;
		} else if (!adminReplyWriter.equals(other.adminReplyWriter))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AdminQnAReply [adminReplyNo=" + adminReplyNo + ", adminReplyContent=" + adminReplyContent
				+ ", adminReplyDate=" + adminReplyDate + ", adminReplyWriter=" + adminReplyWriter + ", adminQnaNo="
				+ adminQnaNo + "]";
	}
}