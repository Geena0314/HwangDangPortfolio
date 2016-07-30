package com.hwangdang.vo;

import java.io.Serializable;

public class ExchangeRequest implements Serializable
{
	private String exchangeTitle;
	private String exchangeContent;
	private int orderSeqNo;
	private int exchangeStock;
	private int optionId;
	private String exchangeCharge;
	
	public ExchangeRequest()
	{
		// TODO Auto-generated constructor stub
	}

	public ExchangeRequest(String exchangeTitle, String exchangeContent, int orderSeqNo, int exchangeStock,
			int optionId, String exchangeCharge)
	{
		super();
		this.exchangeTitle = exchangeTitle;
		this.exchangeContent = exchangeContent;
		this.orderSeqNo = orderSeqNo;
		this.exchangeStock = exchangeStock;
		this.optionId = optionId;
		this.exchangeCharge = exchangeCharge;
	}

	public String getExchangeTitle()
	{
		return exchangeTitle;
	}

	public void setExchangeTitle(String exchangeTitle)
	{
		this.exchangeTitle = exchangeTitle;
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

	public int getExchangeStock()
	{
		return exchangeStock;
	}

	public void setExchangeStock(int exchangeStock)
	{
		this.exchangeStock = exchangeStock;
	}

	public int getOptionId()
	{
		return optionId;
	}

	public void setOptionId(int optionId)
	{
		this.optionId = optionId;
	}

	public String getExchangeCharge()
	{
		return exchangeCharge;
	}

	public void setExchangeCharge(String exchangeCharge)
	{
		this.exchangeCharge = exchangeCharge;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((exchangeCharge == null) ? 0 : exchangeCharge.hashCode());
		result = prime * result + ((exchangeContent == null) ? 0 : exchangeContent.hashCode());
		result = prime * result + exchangeStock;
		result = prime * result + ((exchangeTitle == null) ? 0 : exchangeTitle.hashCode());
		result = prime * result + optionId;
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
		if (exchangeCharge == null)
		{
			if (other.exchangeCharge != null)
				return false;
		} else if (!exchangeCharge.equals(other.exchangeCharge))
			return false;
		if (exchangeContent == null)
		{
			if (other.exchangeContent != null)
				return false;
		} else if (!exchangeContent.equals(other.exchangeContent))
			return false;
		if (exchangeStock != other.exchangeStock)
			return false;
		if (exchangeTitle == null)
		{
			if (other.exchangeTitle != null)
				return false;
		} else if (!exchangeTitle.equals(other.exchangeTitle))
			return false;
		if (optionId != other.optionId)
			return false;
		if (orderSeqNo != other.orderSeqNo)
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "ExchangeRequest [exchangeTitle=" + exchangeTitle + ", exchangeContent=" + exchangeContent
				+ ", orderSeqNo=" + orderSeqNo + ", exchangeStock=" + exchangeStock + ", optionId=" + optionId
				+ ", exchangeCharge=" + exchangeCharge + "]";
	}
}