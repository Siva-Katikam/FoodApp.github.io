package com.foodapp.dto;

public class OrderHistory {
	private int orderHistoryId;
	private int userId;
	private String date;
	private int total;
	private String status;
	
	public OrderHistory()
	{
		
	}

	public OrderHistory(int orderHistoryId, int userId, String date, int total, String status) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.userId = userId;
		this.date = date;
		this.total = total;
		this.status = status;
	}

	public OrderHistory(int userId, String date, int total, String status) {
		super();
		this.userId = userId;
		this.date = date;
		this.total = total;
		this.status = status;
	}

	@Override
	public String toString() {
		return "OrderHistory [orderHistoryId=" + orderHistoryId + ", userId=" + userId + ", date=" + date + ", total="
				+ total + ", status=" + status + "]";
	}

	public int getOrderHistoryId() {
		return orderHistoryId;
	}

	public void setOrderHistoryId(int orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
