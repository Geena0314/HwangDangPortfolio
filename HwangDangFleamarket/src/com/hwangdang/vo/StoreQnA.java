package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;

public class StoreQnA implements Serializable
{
	private int storeQnANo;
	private String storeQnATitle;
	private String storeQnAContent;
	private int storeQnAHit;
	private int storeQnAPublished;
	private String storeQnAWriter;
	private Date storeQnADate;
	private String productId;

	private StoreQnAReply storeQnAReply;
	
	public StoreQnA()
	{
		// TODO Auto-generated constructor stub
	}

	public StoreQnA(int storeQnANo, String storeQnATitle, String storeQnAContent, int storeQnAHit,
			int storeQnAPublished, String storeQnAWriter, Date storeQnADate, String productId)
	{
		super();
		this.storeQnANo = storeQnANo;
		this.storeQnATitle = storeQnATitle;
		this.storeQnAContent = storeQnAContent;
		this.storeQnAHit = storeQnAHit;
		this.storeQnAPublished = storeQnAPublished;
		this.storeQnAWriter = storeQnAWriter;
		this.storeQnADate = storeQnADate;
		this.productId = productId;
	}

	public StoreQnA(int storeQnANo, String storeQnATitle, String storeQnAContent, int storeQnAHit,
			int storeQnAPublished, String storeQnAWriter, Date storeQnADate, String productId,
			StoreQnAReply storeQnAReply)
	{
		super();
		this.storeQnANo = storeQnANo;
		this.storeQnATitle = storeQnATitle;
		this.storeQnAContent = storeQnAContent;
		this.storeQnAHit = storeQnAHit;
		this.storeQnAPublished = storeQnAPublished;
		this.storeQnAWriter = storeQnAWriter;
		this.storeQnADate = storeQnADate;
		this.productId = productId;
		this.storeQnAReply = storeQnAReply;
	}

	public StoreQnAReply getStoreQnAReply()
	{
		return storeQnAReply;
	}

	public void setStoreQnAReply(StoreQnAReply storeQnAReply)
	{
		this.storeQnAReply = storeQnAReply;
	}

	public int getStoreQnANo()
	{
		return storeQnANo;
	}

	public void setStoreQnANo(int storeQnANo)
	{
		this.storeQnANo = storeQnANo;
	}

	public String getStoreQnATitle()
	{
		return storeQnATitle;
	}

	public void setStoreQnATitle(String storeQnATitle)
	{
		this.storeQnATitle = storeQnATitle;
	}

	public String getStoreQnAContent()
	{
		return storeQnAContent;
	}

	public void setStoreQnAContent(String storeQnAContent)
	{
		this.storeQnAContent = storeQnAContent;
	}

	public int getStoreQnAHit()
	{
		return storeQnAHit;
	}

	public void setStoreQnAHit(int storeQnAHit)
	{
		this.storeQnAHit = storeQnAHit;
	}

	public int getStoreQnAPublished()
	{
		return storeQnAPublished;
	}

	public void setStoreQnAPublished(int storeQnAPublished)
	{
		this.storeQnAPublished = storeQnAPublished;
	}

	public String getStoreQnAWriter()
	{
		return storeQnAWriter;
	}

	public void setStoreQnAWriter(String storeQnAWriter)
	{
		this.storeQnAWriter = storeQnAWriter;
	}

	public Date getStoreQnADate()
	{
		return storeQnADate;
	}

	public void setStoreQnADate(Date storeQnADate)
	{
		this.storeQnADate = storeQnADate;
	}

	public String getProductId()
	{
		return productId;
	}

	public void setProductId(String productId)
	{
		this.productId = productId;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		result = prime * result + ((storeQnAContent == null) ? 0 : storeQnAContent.hashCode());
		result = prime * result + ((storeQnADate == null) ? 0 : storeQnADate.hashCode());
		result = prime * result + storeQnAHit;
		result = prime * result + storeQnANo;
		result = prime * result + storeQnAPublished;
		result = prime * result + ((storeQnAReply == null) ? 0 : storeQnAReply.hashCode());
		result = prime * result + ((storeQnATitle == null) ? 0 : storeQnATitle.hashCode());
		result = prime * result + ((storeQnAWriter == null) ? 0 : storeQnAWriter.hashCode());
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
		StoreQnA other = (StoreQnA) obj;
		if (productId == null)
		{
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (storeQnAContent == null)
		{
			if (other.storeQnAContent != null)
				return false;
		} else if (!storeQnAContent.equals(other.storeQnAContent))
			return false;
		if (storeQnADate == null)
		{
			if (other.storeQnADate != null)
				return false;
		} else if (!storeQnADate.equals(other.storeQnADate))
			return false;
		if (storeQnAHit != other.storeQnAHit)
			return false;
		if (storeQnANo != other.storeQnANo)
			return false;
		if (storeQnAPublished != other.storeQnAPublished)
			return false;
		if (storeQnAReply == null)
		{
			if (other.storeQnAReply != null)
				return false;
		} else if (!storeQnAReply.equals(other.storeQnAReply))
			return false;
		if (storeQnATitle == null)
		{
			if (other.storeQnATitle != null)
				return false;
		} else if (!storeQnATitle.equals(other.storeQnATitle))
			return false;
		if (storeQnAWriter == null)
		{
			if (other.storeQnAWriter != null)
				return false;
		} else if (!storeQnAWriter.equals(other.storeQnAWriter))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "StoreQnA [storeQnANo=" + storeQnANo + ", storeQnATitle=" + storeQnATitle + ", storeQnAContent="
				+ storeQnAContent + ", storeQnAHit=" + storeQnAHit + ", storeQnAPublished=" + storeQnAPublished
				+ ", storeQnAWriter=" + storeQnAWriter + ", storeQnADate=" + storeQnADate + ", productId=" + productId
				+ ", storeQnAReply=" + storeQnAReply + "]";
	}
}