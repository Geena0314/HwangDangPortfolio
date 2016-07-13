package com.hwangdang.vo;

import java.io.Serializable;

public class Category implements Serializable
{
	private int categoryId;
	private String categoryName;
	private String categoryIdRef;
	private String categoryType;
	
	public Category()
	{
		// TODO Auto-generated constructor stub
	}

	public Category(int categoryId, String categoryName, String categoryIdRef, String categoryType)
	{
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryIdRef = categoryIdRef;
		this.categoryType = categoryType;
	}

	public int getCategoryId()
	{
		return categoryId;
	}

	public void setCategoryId(int categoryId)
	{
		this.categoryId = categoryId;
	}

	public String getCategoryName()
	{
		return categoryName;
	}

	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}

	public String getCategoryIdRef()
	{
		return categoryIdRef;
	}

	public void setCategoryIdRef(String categoryIdRef)
	{
		this.categoryIdRef = categoryIdRef;
	}

	public String getCategoryType()
	{
		return categoryType;
	}

	public void setCategoryType(String categoryType)
	{
		this.categoryType = categoryType;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + categoryId;
		result = prime * result + ((categoryIdRef == null) ? 0 : categoryIdRef.hashCode());
		result = prime * result + ((categoryName == null) ? 0 : categoryName.hashCode());
		result = prime * result + ((categoryType == null) ? 0 : categoryType.hashCode());
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
		Category other = (Category) obj;
		if (categoryId != other.categoryId)
			return false;
		if (categoryIdRef == null)
		{
			if (other.categoryIdRef != null)
				return false;
		} else if (!categoryIdRef.equals(other.categoryIdRef))
			return false;
		if (categoryName == null)
		{
			if (other.categoryName != null)
				return false;
		} else if (!categoryName.equals(other.categoryName))
			return false;
		if (categoryType == null)
		{
			if (other.categoryType != null)
				return false;
		} else if (!categoryType.equals(other.categoryType))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryIdRef="
				+ categoryIdRef + ", categoryType=" + categoryType + "]";
	}
}