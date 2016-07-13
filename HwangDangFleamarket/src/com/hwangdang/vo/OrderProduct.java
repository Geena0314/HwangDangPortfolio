package com.hwangdang.vo;

import java.io.Serializable;

public class OrderProduct implements Serializable
{
	private int orderSeqNo;  // 식별자
	private int orderAmount;  //상품수량
	private String ordersNo;  // 주문번호
	private String productId; //상품ID
	private int optionId;  // 상품옵션 ID
	private int sellerStoreNo;   // 셀러 스토어NO
	private int orderProductStatus;  //상품에대한 상태  -1~9
	  
	private Product product;
	private ProductOption productOption;
	  
	private Seller seller;
	
	public OrderProduct()
	{
		// TODO Auto-generated constructor stub
	}

	public OrderProduct(int orderAmount, String ordersNo, String productId, int optionId,
			int sellerStoreNo, int orderProductStatus)
	{
		//주문상품 정보만
		super();
		this.orderAmount = orderAmount;
		this.ordersNo = ordersNo;
		this.productId = productId;
		this.optionId = optionId;
		this.sellerStoreNo = sellerStoreNo;
		this.orderProductStatus = orderProductStatus;
	}

	
	
	public OrderProduct(int orderSeqNo, int orderAmount, String ordersNo, String productId, int optionId,
			int sellerStoreNo, int orderProductStatus)
	{
		//주문상품 정보만
		super();
		this.orderSeqNo = orderSeqNo;
		this.orderAmount = orderAmount;
		this.ordersNo = ordersNo;
		this.productId = productId;
		this.optionId = optionId;
		this.sellerStoreNo = sellerStoreNo;
		this.orderProductStatus = orderProductStatus;
	}

	public OrderProduct(int orderSeqNo, int orderAmount, String ordersNo, String productId, int optionId,
			int sellerStoreNo, int orderProductStatus, Product product, ProductOption productOption)
	{
		//모든정보 - seller.
		super();
		this.orderSeqNo = orderSeqNo;
		this.orderAmount = orderAmount;
		this.ordersNo = ordersNo;
		this.productId = productId;
		this.optionId = optionId;
		this.sellerStoreNo = sellerStoreNo;
		this.orderProductStatus = orderProductStatus;
		this.product = product;
		this.productOption = productOption;
	}

	public OrderProduct(int orderSeqNo, int orderAmount, String ordersNo, String productId, int optionId,
			int sellerStoreNo, int orderProductStatus, Product product, ProductOption productOption, Seller seller)
	{
		super();
		this.orderSeqNo = orderSeqNo;
		this.orderAmount = orderAmount;
		this.ordersNo = ordersNo;
		this.productId = productId;
		this.optionId = optionId;
		this.sellerStoreNo = sellerStoreNo;
		this.orderProductStatus = orderProductStatus;
		this.product = product;
		this.productOption = productOption;
		this.seller = seller;
	}

	
	public OrderProduct( int orderAmount, String ordersNo, String productId, int optionId,
			int sellerStoreNo, int orderProductStatus, Product product, ProductOption productOption, Seller seller)
	{
		super();
		this.orderAmount = orderAmount;
		this.ordersNo = ordersNo;
		this.productId = productId;
		this.optionId = optionId;
		this.sellerStoreNo = sellerStoreNo;
		this.orderProductStatus = orderProductStatus;
		this.product = product;
		this.productOption = productOption;
		this.seller = seller;
	}

	
	
	
	public int getOrderSeqNo()
	{
		return orderSeqNo;
	}

	public void setOrderSeqNo(int orderSeqNo)
	{
		this.orderSeqNo = orderSeqNo;
	}

	public int getOrderAmount()
	{
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount)
	{
		this.orderAmount = orderAmount;
	}

	public String getOrdersNo()
	{
		return ordersNo;
	}

	public void setOrdersNo(String ordersNo)
	{
		this.ordersNo = ordersNo;
	}

	public String getProductId()
	{
		return productId;
	}

	public void setProductId(String productId)
	{
		this.productId = productId;
	}

	public int getOptionId()
	{
		return optionId;
	}

	public void setOptionId(int optionId)
	{
		this.optionId = optionId;
	}

	public int getSellerStoreNo()
	{
		return sellerStoreNo;
	}

	public void setSellerStoreNo(int sellerStoreNo)
	{
		this.sellerStoreNo = sellerStoreNo;
	}

	public int getOrderProductStatus()
	{
		return orderProductStatus;
	}

	public void setOrderProductStatus(int orderProductStatus)
	{
		this.orderProductStatus = orderProductStatus;
	}

	public Product getProduct()
	{
		return product;
	}

	public void setProduct(Product product)
	{
		this.product = product;
	}

	public ProductOption getProductOption()
	{
		return productOption;
	}

	public void setProductOption(ProductOption productOption)
	{
		this.productOption = productOption;
	}

	public Seller getSeller()
	{
		return seller;
	}

	public void setSeller(Seller seller)
	{
		this.seller = seller;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + optionId;
		result = prime * result + orderAmount;
		result = prime * result + orderProductStatus;
		result = prime * result + orderSeqNo;
		result = prime * result + ((ordersNo == null) ? 0 : ordersNo.hashCode());
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		result = prime * result + ((productOption == null) ? 0 : productOption.hashCode());
		result = prime * result + ((seller == null) ? 0 : seller.hashCode());
		result = prime * result + sellerStoreNo;
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
		OrderProduct other = (OrderProduct) obj;
		if (optionId != other.optionId)
			return false;
		if (orderAmount != other.orderAmount)
			return false;
		if (orderProductStatus != other.orderProductStatus)
			return false;
		if (orderSeqNo != other.orderSeqNo)
			return false;
		if (ordersNo == null)
		{
			if (other.ordersNo != null)
				return false;
		} else if (!ordersNo.equals(other.ordersNo))
			return false;
		if (product == null)
		{
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		if (productId == null)
		{
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (productOption == null)
		{
			if (other.productOption != null)
				return false;
		} else if (!productOption.equals(other.productOption))
			return false;
		if (seller == null)
		{
			if (other.seller != null)
				return false;
		} else if (!seller.equals(other.seller))
			return false;
		if (sellerStoreNo != other.sellerStoreNo)
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "OrderProduct [orderSeqNo=" + orderSeqNo + ", orderAmount=" + orderAmount + ", ordersNo=" + ordersNo
				+ ", productId=" + productId + ", optionId=" + optionId + ", sellerStoreNo=" + sellerStoreNo
				+ ", orderProductStatus=" + orderProductStatus + ", product=" + product + ", productOption="
				+ productOption + ", seller=" + seller + "]";
	}
}