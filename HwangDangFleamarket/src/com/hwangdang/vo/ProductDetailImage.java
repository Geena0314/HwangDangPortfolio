package com.hwangdang.vo;

import java.io.Serializable;

public class ProductDetailImage implements Serializable
{
	private String imagePath;
	private String productId;
	
	public ProductDetailImage()
	{
		// TODO Auto-generated constructor stub
	}

	public ProductDetailImage(String imagePath, String productId)
	{
		super();
		this.imagePath = imagePath;
		this.productId = productId;
	}

	public String getImagePath()
	{
		return imagePath;
	}

	public void setImagePath(String imagePath)
	{
		this.imagePath = imagePath;
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
		result = prime * result + ((imagePath == null) ? 0 : imagePath.hashCode());
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
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
		ProductDetailImage other = (ProductDetailImage) obj;
		if (imagePath == null)
		{
			if (other.imagePath != null)
				return false;
		} else if (!imagePath.equals(other.imagePath))
			return false;
		if (productId == null)
		{
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "ProductDetailImage [imagePath=" + imagePath + ", productId=" + productId + "]";
	}
}
