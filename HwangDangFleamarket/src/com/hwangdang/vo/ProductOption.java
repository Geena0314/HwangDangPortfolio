package com.hwangdang.vo;

import java.io.Serializable;
import java.util.List;

public class ProductOption implements Serializable
{
	private int optionId;
	private String optionName;
	private String optionSubName;
	private int optionStock;
	private int optionAddPrice;
	private String productId;
	
	private List<ProductOption> optionList;
	
	public ProductOption() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductOption(int optionId, String optionName, String optionSubName, int optionStock, int optionAddPrice,
			String productId)
	{
		super();
		this.optionId = optionId;
		this.optionName = optionName;
		this.optionSubName = optionSubName;
		this.optionStock = optionStock;
		this.optionAddPrice = optionAddPrice;
		this.productId = productId;
	}
	
	public ProductOption(int optionId, String optionName, String optionSubName, int optionStock, int optionAddPrice,
			String productId, List<ProductOption> optionList) {
		super();
		this.optionId = optionId;
		this.optionName = optionName;
		this.optionSubName = optionSubName;
		this.optionStock = optionStock;
		this.optionAddPrice = optionAddPrice;
		this.productId = productId;
		this.optionList = optionList;
	}

	public int getOptionId()
	{
		return optionId;
	}

	public void setOptionId(int optionId)
	{
		this.optionId = optionId;
	}

	public String getOptionName()
	{
		return optionName;
	}

	public void setOptionName(String optionName)
	{
		this.optionName = optionName;
	}

	public String getOptionSubName()
	{
		return optionSubName;
	}

	public void setOptionSubName(String optionSubName)
	{
		this.optionSubName = optionSubName;
	}

	public int getOptionStock()
	{
		return optionStock;
	}

	public void setOptionStock(int optionStock)
	{
		this.optionStock = optionStock;
	}

	public int getOptionAddPrice()
	{
		return optionAddPrice;
	}

	public void setOptionAddPrice(int optionAddPrice)
	{
		this.optionAddPrice = optionAddPrice;
	}

	public String getProductId()
	{
		return productId;
	}

	public void setProductId(String productId)
	{
		this.productId = productId;
	}

	
	public List<ProductOption> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<ProductOption> optionList) {
		this.optionList = optionList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + optionAddPrice;
		result = prime * result + optionId;
		result = prime * result + ((optionList == null) ? 0 : optionList.hashCode());
		result = prime * result + ((optionName == null) ? 0 : optionName.hashCode());
		result = prime * result + optionStock;
		result = prime * result + ((optionSubName == null) ? 0 : optionSubName.hashCode());
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
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
		ProductOption other = (ProductOption) obj;
		if (optionAddPrice != other.optionAddPrice)
			return false;
		if (optionId != other.optionId)
			return false;
		if (optionList == null) {
			if (other.optionList != null)
				return false;
		} else if (!optionList.equals(other.optionList))
			return false;
		if (optionName == null) {
			if (other.optionName != null)
				return false;
		} else if (!optionName.equals(other.optionName))
			return false;
		if (optionStock != other.optionStock)
			return false;
		if (optionSubName == null) {
			if (other.optionSubName != null)
				return false;
		} else if (!optionSubName.equals(other.optionSubName))
			return false;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductOption [optionId=" + optionId + ", optionName=" + optionName + ", optionSubName=" + optionSubName
				+ ", optionStock=" + optionStock + ", optionAddPrice=" + optionAddPrice + ", productId=" + productId
				+ ", optionList=" + optionList + "]";
	}
}
