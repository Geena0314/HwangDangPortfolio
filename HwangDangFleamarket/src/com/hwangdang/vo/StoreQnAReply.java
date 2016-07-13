package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;

public class StoreQnAReply implements Serializable
{
	private String storeReplyWriter;
	private String storeReplyContent;
	private Date storeReplyDate;
	private int storeQnANo;
	
	public StoreQnAReply()
	{
		// TODO Auto-generated constructor stub
	}

	public StoreQnAReply(String storeReplyWriter, String storeReplyContent, Date storeReplyDate,
			int storeQnANo)
	{
		super();
		this.storeReplyWriter = storeReplyWriter;
		this.storeReplyContent = storeReplyContent;
		this.storeReplyDate = storeReplyDate;
		this.storeQnANo = storeQnANo;
	}

	public String getStoreReplyWriter()
	{
		return storeReplyWriter;
	}

	public void setStoreReplyWriter(String storeReplyWriter)
	{
		this.storeReplyWriter = storeReplyWriter;
	}

	public String getStoreReplyContent()
	{
		return storeReplyContent;
	}

	public void setStoreReplyContent(String storeReplyContent)
	{
		this.storeReplyContent = storeReplyContent;
	}

	public Date getStoreReplyDate()
	{
		return storeReplyDate;
	}

	public void setStoreReplyDate(Date storeReplyDate)
	{
		this.storeReplyDate = storeReplyDate;
	}

	public int getStoreQnANo()
	{
		return storeQnANo;
	}

	public void setStoreQnANo(int storeQnANo)
	{
		this.storeQnANo = storeQnANo;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + storeQnANo;
		result = prime * result + ((storeReplyContent == null) ? 0 : storeReplyContent.hashCode());
		result = prime * result + ((storeReplyDate == null) ? 0 : storeReplyDate.hashCode());
		result = prime * result + ((storeReplyWriter == null) ? 0 : storeReplyWriter.hashCode());
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
		StoreQnAReply other = (StoreQnAReply) obj;
		if (storeQnANo != other.storeQnANo)
			return false;
		if (storeReplyContent == null)
		{
			if (other.storeReplyContent != null)
				return false;
		} else if (!storeReplyContent.equals(other.storeReplyContent))
			return false;
		if (storeReplyDate == null)
		{
			if (other.storeReplyDate != null)
				return false;
		} else if (!storeReplyDate.equals(other.storeReplyDate))
			return false;
		if (storeReplyWriter == null)
		{
			if (other.storeReplyWriter != null)
				return false;
		} else if (!storeReplyWriter.equals(other.storeReplyWriter))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "StoreQnAReply [storeReplyWriter=" + storeReplyWriter + ", storeReplyContent=" + storeReplyContent
				+ ", storeReplyDate=" + storeReplyDate + ", storeQnANo=" + storeQnANo + "]";
	}
}