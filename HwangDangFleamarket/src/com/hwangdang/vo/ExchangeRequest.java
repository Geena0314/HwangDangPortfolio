package com.hwangdang.vo;

import java.io.Serializable;

public class ExchangeRequest implements Serializable
{
	private String exchageTitle;
	private String exchangeContent;
	private int orderSeqNo;
	
	public ExchangeRequest()
	{
		// TODO Auto-generated constructor stub
	}

	public ExchangeRequest(String exchageTitle, String exchangeContent, int orderSeqNo)
	{
		super();
		this.exchageTitle = exchageTitle;
		this.exchangeContent = exchangeContent;
		this.orderSeqNo = orderSeqNo;
	}

	public String getExchageTitle()
	{
		return exchageTitle;
	}

	public void setExchageTitle(String exchageTitle)
	{
		this.exchageTitle = exchageTitle;
	}

	public String getExchangeContent()
	{
		return exchangeContent;
	}

	public void setExchangeContent(String exchangeContent)
	{
		this.exchangeContent = exchangeContent;
	}

	public int getOrderSeqNo()
	{
		return orderSeqNo;
	}

	public void setOrderSeqNo(int orderSeqNo)
	{
		this.orderSeqNo = orderSeqNo;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((exchageTitle == null) ? 0 : exchageTitle.hashCode());
		result = prime * result + ((exchangeContent == null) ? 0 : exchangeContent.hashCode());
		result = prime * result + orderSeqNo;
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
		ExchangeRequest other = (ExchangeRequest) obj;
		if (exchageTitle == null)
		{
			if (other.exchageTitle != null)
				return false;
		} else if (!exchageTitle.equals(other.exchageTitle))
			return false;
		if (exchangeContent == null)
		{
			if (other.exchangeContent != null)
				return false;
		} else if (!exchangeContent.equals(other.exchangeContent))
			return false;
		if (orderSeqNo != other.orderSeqNo)
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "ExchangeRequest [exchageTitle=" + exchageTitle + ", exchangeContent=" + exchangeContent
				+ ", orderSeqNo=" + orderSeqNo + "]";
	}
}