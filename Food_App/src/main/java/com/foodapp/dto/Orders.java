package com.foodapp.dto;

public class Orders {
	private int orderId;
	private int userId;
	private int restarauntId;
	private int totalAmount;
	private String status;
	private String dateTime;
	private String paymentOption;
	
	public Orders()
	{
		
	}

	public Orders(int orderId, int userId, int restarauntId, int totalAmount, String status, String dateTime,
			String paymentOption) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restarauntId = restarauntId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.dateTime = dateTime;
		this.paymentOption = paymentOption;
	}

	public Orders(int userId, int restarauntId, int totalAmount, String status, String dateTime, String paymentOption) {
		super();
		this.userId = userId;
		this.restarauntId = restarauntId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.dateTime = dateTime;
		this.paymentOption = paymentOption;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", userId=" + userId + ", restarauntId=" + restarauntId + ", totalAmount="
				+ totalAmount + ", status=" + status + ", dateTime=" + dateTime + ", paymentOption=" + paymentOption
				+ "]";
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestarauntId() {
		return restarauntId;
	}

	public void setRestarauntId(int restarauntId) {
		this.restarauntId = restarauntId;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	
}
