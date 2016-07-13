package com.hwangdang.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Orders implements Serializable
{
	private String ordersNo;    //주문번호
	private String ordersReceiver;
	private String ordersPhone;
	private String ordersZipcode;
	private String ordersAddress;
	private String ordersSubAddress;
	private int ordersTotalPrice;  //주문한 총가격 
	private String ordersPayment;   // 결제방식
	private String ordersRequest;  
	private int paymentStatus;    // 결재여부 
	private Date orders_date;   //주문날짜 
	private String memberId;  //구매자 ID
	
	private List<OrderProduct> orderProductList;  // 주문한 제품에대한 세부정보  , 주문수량 , 상품ID
	
	public Orders()
	{
		// TODO Auto-generated constructor stub
	}

	
	
	public Orders(String ordersNo, String ordersReceiver, String ordersPhone, String ordersZipcode,
			String ordersAddress, String ordersSubAddress, int ordersTotalPrice, String ordersPayment,
			String ordersRequest, int paymentStatus, Date orders_date, String memberId) {
		super();
		this.ordersNo = ordersNo;
		this.ordersReceiver = ordersReceiver;
		this.ordersPhone = ordersPhone;
		this.ordersZipcode = ordersZipcode;
		this.ordersAddress = ordersAddress;
		this.ordersSubAddress = ordersSubAddress;
		this.ordersTotalPrice = ordersTotalPrice;
		this.ordersPayment = ordersPayment;
		this.ordersRequest = ordersRequest;
		this.paymentStatus = paymentStatus;
		this.orders_date = orders_date;
		this.memberId = memberId;
	}





	public Orders(String ordersNo, String ordersReceiver, String ordersPhone, String ordersZipcode,
			String ordersAddress, String ordersSubAddress, int ordersTotalPrice, String ordersPayment,
			String ordersRequest, int paymentStatus, int ordersStatus, Date orders_date, String memberId,
			List<OrderProduct> orderProductList)
	{
		//주문상품까지 추가.
		super();
		this.ordersNo = ordersNo;
		this.ordersReceiver = ordersReceiver;
		this.ordersPhone = ordersPhone;
		this.ordersZipcode = ordersZipcode;
		this.ordersAddress = ordersAddress;
		this.ordersSubAddress = ordersSubAddress;
		this.ordersTotalPrice = ordersTotalPrice;
		this.ordersPayment = ordersPayment;
		this.ordersRequest = ordersRequest;
		this.paymentStatus = paymentStatus;
		this.orders_date = orders_date;
		this.memberId = memberId;
		this.orderProductList = orderProductList;
	}

	public String getOrdersNo()
	{
		return ordersNo;
	}

	public void setOrdersNo(String ordersNo)
	{
		this.ordersNo = ordersNo;
	}

	public String getOrdersReceiver()
	{
		return ordersReceiver;
	}

	public void setOrdersReceiver(String ordersReceiver)
	{
		this.ordersReceiver = ordersReceiver;
	}

	public String getOrdersPhone()
	{
		return ordersPhone;
	}

	public void setOrdersPhone(String ordersPhone)
	{
		this.ordersPhone = ordersPhone;
	}

	public String getOrdersZipcode()
	{
		return ordersZipcode;
	}

	public void setOrdersZipcode(String ordersZipcode)
	{
		this.ordersZipcode = ordersZipcode;
	}

	public String getOrdersAddress()
	{
		return ordersAddress;
	}

	public void setOrdersAddress(String ordersAddress)
	{
		this.ordersAddress = ordersAddress;
	}

	public String getOrdersSubAddress()
	{
		return ordersSubAddress;
	}

	public void setOrdersSubAddress(String ordersSubAddress)
	{
		this.ordersSubAddress = ordersSubAddress;
	}

	public int getOrdersTotalPrice()
	{
		return ordersTotalPrice;
	}

	public void setOrdersTotalPrice(int ordersTotalPrice)
	{
		this.ordersTotalPrice = ordersTotalPrice;
	}

	public String getOrdersPayment()
	{
		return ordersPayment;
	}

	public void setOrdersPayment(String ordersPayment)
	{
		this.ordersPayment = ordersPayment;
	}

	public String getOrdersRequest()
	{
		return ordersRequest;
	}

	public void setOrdersRequest(String ordersRequest)
	{
		this.ordersRequest = ordersRequest;
	}

	public int getPaymentStatus()
	{
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus)
	{
		this.paymentStatus = paymentStatus;
	}


	public Date getOrders_date()
	{
		return orders_date;
	}

	public void setOrders_date(Date orders_date)
	{
		this.orders_date = orders_date;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public List<OrderProduct> getOrderProductList()
	{
		return orderProductList;
	}

	public void setOrderProductList(List<OrderProduct> orderProductList)
	{
		this.orderProductList = orderProductList;
	}

	@Override
	public String toString() {
		return "Orders [ordersNo=" + ordersNo + ", ordersReceiver=" + ordersReceiver + ", ordersPhone=" + ordersPhone
				+ ", ordersZipcode=" + ordersZipcode + ", ordersAddress=" + ordersAddress + ", ordersSubAddress="
				+ ordersSubAddress + ", ordersTotalPrice=" + ordersTotalPrice + ", ordersPayment=" + ordersPayment
				+ ", ordersRequest=" + ordersRequest + ", paymentStatus=" + paymentStatus + ", orders_date="
				+ orders_date + ", memberId=" + memberId + ", orderProductList=" + orderProductList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((orderProductList == null) ? 0 : orderProductList.hashCode());
		result = prime * result + ((ordersAddress == null) ? 0 : ordersAddress.hashCode());
		result = prime * result + ((ordersNo == null) ? 0 : ordersNo.hashCode());
		result = prime * result + ((ordersPayment == null) ? 0 : ordersPayment.hashCode());
		result = prime * result + ((ordersPhone == null) ? 0 : ordersPhone.hashCode());
		result = prime * result + ((ordersReceiver == null) ? 0 : ordersReceiver.hashCode());
		result = prime * result + ((ordersRequest == null) ? 0 : ordersRequest.hashCode());
		result = prime * result + ((ordersSubAddress == null) ? 0 : ordersSubAddress.hashCode());
		result = prime * result + ordersTotalPrice;
		result = prime * result + ((ordersZipcode == null) ? 0 : ordersZipcode.hashCode());
		result = prime * result + ((orders_date == null) ? 0 : orders_date.hashCode());
		result = prime * result + paymentStatus;
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
		Orders other = (Orders) obj;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (orderProductList == null) {
			if (other.orderProductList != null)
				return false;
		} else if (!orderProductList.equals(other.orderProductList))
			return false;
		if (ordersAddress == null) {
			if (other.ordersAddress != null)
				return false;
		} else if (!ordersAddress.equals(other.ordersAddress))
			return false;
		if (ordersNo == null) {
			if (other.ordersNo != null)
				return false;
		} else if (!ordersNo.equals(other.ordersNo))
			return false;
		if (ordersPayment == null) {
			if (other.ordersPayment != null)
				return false;
		} else if (!ordersPayment.equals(other.ordersPayment))
			return false;
		if (ordersPhone == null) {
			if (other.ordersPhone != null)
				return false;
		} else if (!ordersPhone.equals(other.ordersPhone))
			return false;
		if (ordersReceiver == null) {
			if (other.ordersReceiver != null)
				return false;
		} else if (!ordersReceiver.equals(other.ordersReceiver))
			return false;
		if (ordersRequest == null) {
			if (other.ordersRequest != null)
				return false;
		} else if (!ordersRequest.equals(other.ordersRequest))
			return false;
		if (ordersSubAddress == null) {
			if (other.ordersSubAddress != null)
				return false;
		} else if (!ordersSubAddress.equals(other.ordersSubAddress))
			return false;
		if (ordersTotalPrice != other.ordersTotalPrice)
			return false;
		if (ordersZipcode == null) {
			if (other.ordersZipcode != null)
				return false;
		} else if (!ordersZipcode.equals(other.ordersZipcode))
			return false;
		if (orders_date == null) {
			if (other.orders_date != null)
				return false;
		} else if (!orders_date.equals(other.orders_date))
			return false;
		if (paymentStatus != other.paymentStatus)
			return false;
		return true;
	}


}