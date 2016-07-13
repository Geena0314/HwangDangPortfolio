package com.hwangdang.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product implements Serializable
{
	private String productId;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productMainImage;
	private String productInfo;
	private int productLike;
	private int sellerStoreNo;
	
	private Seller seller;
	private ProductOption productOption;
	private ProductDetailImage productDetailImage;
	
	private List<MultipartFile> images;
	
	public Product()
	{
		// TODO Auto-generated constructor stub
	}

	public Product(String productId, String productName, int productPrice, int productStock, String productMainImage,
			String productInfo, int productLike, int sellerStoreNo)
	{
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productMainImage = productMainImage;
		this.productInfo = productInfo;
		this.productLike = productLike;
		this.sellerStoreNo = sellerStoreNo;
	}
	
	public Product(String productId, String productName, int productPrice, int productStock, String productMainImage,
			String productInfo, int productLike, int sellerStoreNo, Seller seller) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productMainImage = productMainImage;
		this.productInfo = productInfo;
		this.productLike = productLike;
		this.sellerStoreNo = sellerStoreNo;
		this.seller = seller;
	}

	public Product(String productId, String productName, int productPrice, int productStock, String productMainImage,
			String productInfo, int productLike, int sellerStoreNo, Seller seller, ProductOption productOption) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productMainImage = productMainImage;
		this.productInfo = productInfo;
		this.productLike = productLike;
		this.sellerStoreNo = sellerStoreNo;
		this.seller = seller;
		this.productOption = productOption;
	}
	
	public Product(String productId, String productName, int productPrice, int productStock, String productMainImage,
			String productInfo, int productLike, int sellerStoreNo, Seller seller, ProductOption productOption,
			ProductDetailImage productDetailImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productMainImage = productMainImage;
		this.productInfo = productInfo;
		this.productLike = productLike;
		this.sellerStoreNo = sellerStoreNo;
		this.seller = seller;
		this.productOption = productOption;
		this.productDetailImage = productDetailImage;
	}

	public Product(String productId, String productName, int productPrice, int productStock, String productMainImage,
			String productInfo, int productLike, int sellerStoreNo, Seller seller, ProductOption productOption,
			ProductDetailImage productDetailImage, List<MultipartFile> images) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productMainImage = productMainImage;
		this.productInfo = productInfo;
		this.productLike = productLike;
		this.sellerStoreNo = sellerStoreNo;
		this.seller = seller;
		this.productOption = productOption;
		this.productDetailImage = productDetailImage;
		this.images = images;
	}

	public ProductDetailImage getProductDetailImage() {
		return productDetailImage;
	}

	public void setProductDetailImage(ProductDetailImage productDetailImage) {
		this.productDetailImage = productDetailImage;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public String getProductId()
	{
		return productId;
	}

	public void setProductId(String productId)
	{
		this.productId = productId;
	}

	public String getProductName()
	{
		return productName;
	}

	public void setProductName(String productName)
	{
		this.productName = productName;
	}

	public int getProductPrice()
	{
		return productPrice;
	}

	public void setProductPrice(int productPrice)
	{
		this.productPrice = productPrice;
	}

	public int getProductStock()
	{
		return productStock;
	}

	public void setProductStock(int productStock)
	{
		this.productStock = productStock;
	}

	public String getProductMainImage() {
		return productMainImage;
	}

	public void setProductMainImage(String productMainImage) {
		this.productMainImage = productMainImage;
	}

	public String getProductInfo()
	{
		return productInfo;
	}

	public void setProductInfo(String productInfo)
	{
		this.productInfo = productInfo;
	}

	public int getProductLike()
	{
		return productLike;
	}

	public void setProductLike(int productLike)
	{
		this.productLike = productLike;
	}

	public int getSellerStoreNo()
	{
		return sellerStoreNo;
	}

	public void setSellerStoreNo(int sellerStoreNo)
	{
		this.sellerStoreNo = sellerStoreNo;
	}

	public ProductOption getProductOption() {
		return productOption;
	}

	public void setProductOption(ProductOption productOption) {
		this.productOption = productOption;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((images == null) ? 0 : images.hashCode());
		result = prime * result + ((productDetailImage == null) ? 0 : productDetailImage.hashCode());
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		result = prime * result + ((productInfo == null) ? 0 : productInfo.hashCode());
		result = prime * result + productLike;
		result = prime * result + ((productMainImage == null) ? 0 : productMainImage.hashCode());
		result = prime * result + ((productName == null) ? 0 : productName.hashCode());
		result = prime * result + ((productOption == null) ? 0 : productOption.hashCode());
		result = prime * result + productPrice;
		result = prime * result + productStock;
		result = prime * result + ((seller == null) ? 0 : seller.hashCode());
		result = prime * result + sellerStoreNo;
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
		Product other = (Product) obj;
		if (images == null) {
			if (other.images != null)
				return false;
		} else if (!images.equals(other.images))
			return false;
		if (productDetailImage == null) {
			if (other.productDetailImage != null)
				return false;
		} else if (!productDetailImage.equals(other.productDetailImage))
			return false;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (productInfo == null) {
			if (other.productInfo != null)
				return false;
		} else if (!productInfo.equals(other.productInfo))
			return false;
		if (productLike != other.productLike)
			return false;
		if (productMainImage == null) {
			if (other.productMainImage != null)
				return false;
		} else if (!productMainImage.equals(other.productMainImage))
			return false;
		if (productName == null) {
			if (other.productName != null)
				return false;
		} else if (!productName.equals(other.productName))
			return false;
		if (productOption == null) {
			if (other.productOption != null)
				return false;
		} else if (!productOption.equals(other.productOption))
			return false;
		if (productPrice != other.productPrice)
			return false;
		if (productStock != other.productStock)
			return false;
		if (seller == null) {
			if (other.seller != null)
				return false;
		} else if (!seller.equals(other.seller))
			return false;
		if (sellerStoreNo != other.sellerStoreNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productStock=" + productStock + ", productMainImage=" + productMainImage + ", productInfo="
				+ productInfo + ", productLike=" + productLike + ", sellerStoreNo=" + sellerStoreNo + ", seller="
				+ seller + ", productOption=" + productOption + ", productDetailImage=" + productDetailImage
				+ ", images=" + images + "]";
	}
}
