package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;

public class Review implements Serializable
{
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private String reviewWriter;
	private String productId;
	
	public Review()
	{
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, String reviewContent, Date reviewDate, String reviewWriter, String productId)
	{
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewWriter = reviewWriter;
		this.productId = productId;
	}

	public int getReviewNo()
	{
		return reviewNo;
	}

	public void setReviewNo(int reviewNo)
	{
		this.reviewNo = reviewNo;
	}

	public String getReviewContent()
	{
		return reviewContent;
	}

	public void setReviewContent(String reviewContent)
	{
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate()
	{
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate)
	{
		this.reviewDate = reviewDate;
	}

	public String getReviewWriter()
	{
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter)
	{
		this.reviewWriter = reviewWriter;
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
		result = prime * result + ((reviewContent == null) ? 0 : reviewContent.hashCode());
		result = prime * result + ((reviewDate == null) ? 0 : reviewDate.hashCode());
		result = prime * result + reviewNo;
		result = prime * result + ((reviewWriter == null) ? 0 : reviewWriter.hashCode());
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
		Review other = (Review) obj;
		if (productId == null)
		{
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (reviewContent == null)
		{
			if (other.reviewContent != null)
				return false;
		} else if (!reviewContent.equals(other.reviewContent))
			return false;
		if (reviewDate == null)
		{
			if (other.reviewDate != null)
				return false;
		} else if (!reviewDate.equals(other.reviewDate))
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		if (reviewWriter == null)
		{
			if (other.reviewWriter != null)
				return false;
		} else if (!reviewWriter.equals(other.reviewWriter))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", reviewWriter=" + reviewWriter + ", productId=" + productId + "]";
	}
}
