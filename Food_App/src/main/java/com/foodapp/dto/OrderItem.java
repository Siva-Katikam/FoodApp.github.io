package com.foodapp.dto;

public class OrderItem {
	private int orderItemId;
	private int orderId;
	private int mItemId;
	private int quntity;
	private int subTotal;
	
	public OrderItem()
	{
		
	}

	public OrderItem(int orderItemId, int orderId, int mItemId, int quntity, int subTotal) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.mItemId = mItemId;
		this.quntity = quntity;
		this.subTotal = subTotal;
	}

	public OrderItem(int orderId, int mItemId, int quntity, int subTotal) {
		super();
		this.orderId = orderId;
		this.mItemId = mItemId;
		this.quntity = quntity;
		this.subTotal = subTotal;
	}

	@Override
	public String toString() {
		return "OrderItems [orderItemId=" + orderItemId + ", orderId=" + orderId + ", mItemId=" + mItemId + ", quntity="
				+ quntity + ", subTotal=" + subTotal + "]";
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getmItemId() {
		return mItemId;
	}

	public void setmItemId(int mItemId) {
		this.mItemId = mItemId;
	}

	public int getQuntity() {
		return quntity;
	}

	public void setQuntity(int quntity) {
		this.quntity = quntity;
	}

	public int getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
}
