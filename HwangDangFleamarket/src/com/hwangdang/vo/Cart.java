package com.hwangdang.vo;

import java.io.Serializable;
import java.util.List;

public class Cart implements Serializable
{
	private int cartNo;
	private int cartProductAmount;
	private String cartProductOption;
	private String productId;
	private String memberId;
	private int optionId;
	
	private List<Product> productList;
	
	public Cart()
	{
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartNo, int cartProductAmount, String cartProductOption, String productId, String memberId,
			int optionId, List<Product> productList) {
		super();
		this.cartNo = cartNo;
		this.cartProductAmount = cartProductAmount;
		this.cartProductOption = cartProductOption;
		this.productId = productId;
		this.memberId = memberId;
		this.optionId = optionId;
		this.productList = productList;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartProductAmount() {
		return cartProductAmount;
	}

	public void setCartProductAmount(int cartProductAmount) {
		this.cartProductAmount = cartProductAmount;
	}

	public String getCartProductOption() {
		return cartProductOption;
	}

	public void setCartProductOption(String cartProductOption) {
		this.cartProductOption = cartProductOption;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getOptionId() {
		return optionId;
	}

	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartNo;
		result = prime * result + cartProductAmount;
		result = prime * result + ((cartProductOption == null) ? 0 : cartProductOption.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + optionId;
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		result = prime * result + ((productList == null) ? 0 : productList.hashCode());
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
		Cart other = (Cart) obj;
		if (cartNo != other.cartNo)
			return false;
		if (cartProductAmount != other.cartProductAmount)
			return false;
		if (cartProductOption == null) {
			if (other.cartProductOption != null)
				return false;
		} else if (!cartProductOption.equals(other.cartProductOption))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (optionId != other.optionId)
			return false;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (productList == null) {
			if (other.productList != null)
				return false;
		} else if (!productList.equals(other.productList))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", cartProductAmount=" + cartProductAmount + ", cartProductOption="
				+ cartProductOption + ", productId=" + productId + ", memberId=" + memberId + ", optionId=" + optionId
				+ ", productList=" + productList + "]";
	}
}
