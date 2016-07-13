package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Notice implements Serializable
{
	private int noticeNo;
	@NotEmpty(message="제목을 입력하세요.")
	@Length(min=1, max=10, message="제목은 10글자 이하로 입력 가능합니다.")
	private String noticeTitle;
	@NotEmpty(message="내용을 입력하세요.")
	private String noticeContent;
	private Date noticeDate;
	private int noticeHit;
	
	public Notice(){}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, int noticeHit)
	{
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeHit = noticeHit;
	}

	public int getNoticeNo()
	{
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo)
	{
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle()
	{
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle)
	{
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent()
	{
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent)
	{
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate()
	{
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate)
	{
		this.noticeDate = noticeDate;
	}

	public int getNoticeHit()
	{
		return noticeHit;
	}

	public void setNoticeHit(int noticeHit)
	{
		this.noticeHit = noticeHit;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((noticeContent == null) ? 0 : noticeContent.hashCode());
		result = prime * result + ((noticeDate == null) ? 0 : noticeDate.hashCode());
		result = prime * result + noticeHit;
		result = prime * result + noticeNo;
		result = prime * result + ((noticeTitle == null) ? 0 : noticeTitle.hashCode());
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
		Notice other = (Notice) obj;
		if (noticeContent == null)
		{
			if (other.noticeContent != null)
				return false;
		} else if (!noticeContent.equals(other.noticeContent))
			return false;
		if (noticeDate == null)
		{
			if (other.noticeDate != null)
				return false;
		} else if (!noticeDate.equals(other.noticeDate))
			return false;
		if (noticeHit != other.noticeHit)
			return false;
		if (noticeNo != other.noticeNo)
			return false;
		if (noticeTitle == null)
		{
			if (other.noticeTitle != null)
				return false;
		} else if (!noticeTitle.equals(other.noticeTitle))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeHit=" + noticeHit + "]";
	}
}
